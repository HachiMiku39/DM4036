#!/system/bin/sh
echo /sbin/modprobe > /proc/sys/kernel/modprobe
exec > /data/local/tmp/dm4036-install.log 2>&1
set -eu
export PATH=/system/bin:/system/xbin
umask 077
id
cat /proc/self/status | grep Cap
BK=/data/local/dm4036-backup
mkdir -p "$BK"
if [ ! -f "$BK/build.prop" ]; then cp -p /system/build.prop "$BK/build.prop"; fi
if [ -f /system/bin/install-recovery.sh ] && [ ! -f "$BK/install-recovery.sh" ]; then
  cp -p /system/bin/install-recovery.sh "$BK/install-recovery.sh"
fi
mount -o remount,rw /system
mkdir -p /system/priv-app/DMBoxHelper
cp /data/local/tmp/dm4036-time-helper.apk /system/priv-app/DMBoxHelper/DMBoxHelper.apk
cp /data/local/tmp/dm4036-root-start.sh /system/bin/install-recovery.sh
cp /data/local/tmp/dm4036-su-client.sh /system/xbin/su
chown 0:0 /system/priv-app/DMBoxHelper /system/priv-app/DMBoxHelper/DMBoxHelper.apk /system/bin/install-recovery.sh /system/xbin/su
chmod 755 /system/priv-app/DMBoxHelper /system/bin/install-recovery.sh /system/xbin/su
chmod 644 /system/priv-app/DMBoxHelper/DMBoxHelper.apk
if grep -q '^ro.adb.secure=' /system/build.prop; then
  busybox sed -i 's/^ro.adb.secure=.*/ro.adb.secure=1/' /system/build.prop
else
  printf '\n# Authenticate ADB administration\nro.adb.secure=1\n' >> /system/build.prop
fi
chmod 644 /system/build.prop
sync
mount -o remount,ro /system
chmod 600 /dev/__properties__
/data/local/tmp/magisk resetprop -n ro.debuggable 0
/data/local/tmp/magisk resetprop -n ro.secure 1
/data/local/tmp/magisk resetprop -n service.adb.root 0
chmod 444 /dev/__properties__
setprop ctl.start flash_recovery
echo 'Installed authenticated local root service, restored normal ADB privileges, system read-only.'
chmod 644 /data/local/tmp/dm4036-install.log
