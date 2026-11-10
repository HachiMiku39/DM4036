#!/usr/bin/env python3
"""Explicitly targeted ADB controller for an owner-authorized DM4036."""
import argparse
import os
import pathlib
import shlex
import shutil
import struct
import subprocess

BASE = pathlib.Path(__file__).resolve().parents[1]
ADB = os.environ.get("DM4036_ADB") or shutil.which("adb") or str(BASE / "tools/platform-tools/adb")
DEVICE = os.environ.get("DM4036_DEVICE", "")
SERVER_PORT = os.environ.get("DM4036_ADB_SERVER_PORT", "5038")
ROOT_SH = "/mnt/asec/dm4036-root-sh"
ROOT_HELPER = pathlib.Path(os.environ.get("DM4036_ROOT_HELPER", str(BASE / "research/session-scripts/root-helper")))


def adb(*args, check=True):
    if not DEVICE:
        raise RuntimeError("Set DM4036_DEVICE to the exact ADB serial or BOX_IP:5555 first.")
    result = subprocess.run(
        [str(ADB), "-P", SERVER_PORT, "-s", DEVICE, *args],
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=120,
    )
    output = result.stdout.decode(errors="replace").strip()
    if check and result.returncode:
        raise RuntimeError(output or "ADB exit %s" % result.returncode)
    return output


def shell(command, root=False):
    if root:
        command = shlex.join([
            "/system/xbin/su", "-c",
            "export PATH=/system/bin:/system/xbin ANDROID_ROOT=/system ANDROID_DATA=/data; " + command,
        ])
    return adb("shell", command)


def cstring(value):
    data = value.encode() + b"\0"
    data += b"\0" * (-len(data) % 4)
    args = []
    for value, in struct.iter_unpack("<i", data):
        args += ["i32", str(value)]
    return args


def binder(code, path, *values):
    args = ["service", "call", "rootserver.root_flinger", str(code)] + cstring(path)
    for value in values:
        args += ["i32", str(value)]
    return shell(shlex.join(args))


def bootstrap():
    if shell("getprop ro.product.model").strip() != "DM4036":
        raise RuntimeError("This research entry was only verified on DM4036.")
    if not ROOT_HELPER.is_file():
        raise RuntimeError("Build research/session-scripts/root-helper with build_root_helper.py first.")
    # The documented factory mount is root:system 0755. Check before changing it.
    actual = shell("/system/xbin/busybox stat -c '%u:%g:%a' /mnt/asec").strip()
    if actual != "0:1000:755":
        raise RuntimeError("Unexpected /mnt/asec owner/mode; inspect and record it first: " + actual)
    print(binder(2, "/mnt/asec", 2000, 1000))
    try:
        print(adb("push", str(ROOT_HELPER), "/data/local/tmp/dm4036-root-helper"))
        print(shell("/system/bin/cp /data/local/tmp/dm4036-root-helper " + ROOT_SH))
        print(binder(2, ROOT_SH, 0, 2000))
        print(binder(1, ROOT_SH, 0o4750 - 65536))
    finally:
        print(binder(2, "/mnt/asec", 0, 1000))
    # Temporary UID 0 is different from full Linux capabilities; see the manual.
    print(shell(shlex.join([ROOT_SH, "-c", "/system/bin/id"])))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=["shell", "root", "bootstrap"])
    parser.add_argument("command", nargs="?")
    parser.add_argument("--owner-authorized", action="store_true", help="Explicitly acknowledge ownership authorization for the temporary bootstrap.")
    args = parser.parse_args()
    if args.mode == "bootstrap":
        if not args.owner_authorized:
            parser.error("bootstrap requires --owner-authorized and the manual's hardware/precondition checks")
        bootstrap()
    elif args.command is None:
        parser.error("shell/root requires one quoted command")
    else:
        print(shell(args.command, root=args.mode == "root"))
