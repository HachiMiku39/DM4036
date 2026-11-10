#!/system/bin/sh
export PATH=/system/bin:/system/xbin
export ANDROID_ROOT=/system ANDROID_DATA=/data
export CLASSPATH=/system/priv-app/DMBoxHelper/DMBoxHelper.apk
exec /system/bin/app_process /system/bin local.dmbox.helper.SuClient "$@"
