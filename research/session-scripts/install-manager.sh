#!/system/bin/sh
set -eu
export PATH=/system/bin:/system/xbin ANDROID_ROOT=/system ANDROID_DATA=/data
mount -o remount,rw /system
if [ ! -f /system/xbin/dmbox-su ]; then cp /system/xbin/su /system/xbin/dmbox-su; fi
cp /data/local/tmp/magisk /system/bin/magisk
chmod 755 /system/xbin/dmbox-su /system/bin/magisk /system/xbin
rm -f /system/xbin/su
ln -s ../bin/magisk /system/xbin/su
mount -o remount,ro /system
for p in $(ps | awk '$NF=="magiskd" {print $2}'); do kill -9 "$p"; done
/system/bin/magisk --daemon
/system/bin/magisk --sqlite "INSERT OR REPLACE INTO policies (uid,package_name,policy,until,logging,notification) VALUES (2000,'com.android.shell',2,0,1,1);"
am force-stop com.topjohnwu.magisk
am start -W -n com.topjohnwu.magisk/.core.SplashActivity
