#!/usr/bin/env python3
"""Local controller for the user's DM4036, using its original Binder service."""
import pathlib
import shlex
import struct
import subprocess
import sys

BASE = pathlib.Path(__file__).resolve().parent
ADB = BASE / 'tools/platform-tools/adb'
DEVICE = 'BOX_IP:5555'
ROOT_SH = '/mnt/asec/dm4036-root-sh'

def adb(*args, check=True):
    r = subprocess.run([str(ADB), '-P', '5038', '-s', DEVICE, *args],
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    output = r.stdout.decode(errors='replace').strip()
    if check and r.returncode:
        raise RuntimeError(output or 'ADB exit %s' % r.returncode)
    return output

def shell(command, root=False):
    if root:
        command = shlex.join(['/system/xbin/su', '-c',
            'export PATH=/system/bin:/system/xbin ANDROID_ROOT=/system ANDROID_DATA=/data; '+command])
    return adb('shell', command)

def cstring(value):
    data = value.encode() + b'\0'
    data += b'\0' * (-len(data) % 4)
    args = []
    for value, in struct.iter_unpack('<i', data):
        args += ['i32', str(value)]
    return args

def binder(code, path, *values):
    args = ['service', 'call', 'rootserver.root_flinger', str(code)] + cstring(path)
    for value in values:
        args += ['i32', str(value)]
    return shell(shlex.join(args))

def bootstrap():
    # Only this temporary mount's ownership changes, and is restored immediately.
    print(binder(2, '/mnt/asec', 2000, 1000))
    try:
        print(adb('push', str(BASE/'root-helper'), '/data/local/tmp/dm4036-root-helper'))
        print(shell('rm -f ' + ROOT_SH + '; cp /data/local/tmp/dm4036-root-helper ' + ROOT_SH))
        print(binder(2, ROOT_SH, 0, 2000))
        # This vendor wrapper accepts signed int, then casts to a 16-bit mode.
        print(binder(1, ROOT_SH, 0o4750 - 0x10000))
    finally:
        print(binder(2, '/mnt/asec', 0, 1000))
    print(shell('id; ls -ld /mnt/asec; ls -l ' + ROOT_SH, root=True))

if __name__ == '__main__':
    if sys.argv[1] == 'bootstrap':
        bootstrap()
    else:
        print(shell(sys.argv[2], root=sys.argv[1] == 'root'))
