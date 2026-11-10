#!/system/bin/sh
umask 022
export PATH=/system/bin:/system/xbin
export ANDROID_ROOT=/system ANDROID_DATA=/data
setprop hiveview.app.allowsetting false
setprop hiveview.app.defaultlaunch me.efesser.flauncher
setprop hiveview.app.defaultactivity me.efesser.flauncher.MainActivity
settings put global captive_portal_server connect.rom.miui.com
settings put global ntp_server ntp.aliyun.com
/system/bin/magisk --daemon
(
  count=0
  while [ "$(getprop sys.boot_completed)" != "1" ] && [ "$count" -lt 180 ]; do
    sleep 1
    count=$((count+1))
  done
  am startservice -n local.dmbox.helper/.SyncService --ez boot true
) >/data/local/dm4036-boot.log 2>&1 &
export CLASSPATH=/system/priv-app/DMBoxHelper/DMBoxHelper.apk
exec /system/bin/app_process /system/bin local.dmbox.helper.RootDaemon
