#!/system/bin/sh
export PATH=/system/bin:/system/xbin
BK=/data/local/dm4036-backup/apps/updates
mkdir -p "$BK"
if [ -f /data/app/com.fast.clean.tv-1/base.apk ]; then
mkdir -p "$BK/com.fast.clean.tv"
cp /data/app/com.fast.clean.tv-1/base.apk "$BK/com.fast.clean.tv/base.apk"
pm uninstall com.fast.clean.tv
fi
if [ -f /data/app/com.gitvdamai.video-1/base.apk ]; then
mkdir -p "$BK/com.gitvdamai.video"
cp /data/app/com.gitvdamai.video-1/base.apk "$BK/com.gitvdamai.video/base.apk"
pm uninstall com.gitvdamai.video
fi
if [ -f /data/app/com.hiveview.abn-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.abn"
cp /data/app/com.hiveview.abn-1/base.apk "$BK/com.hiveview.abn/base.apk"
pm uninstall com.hiveview.abn
fi
if [ -f /data/app/com.hiveview.advertisement-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.advertisement"
cp /data/app/com.hiveview.advertisement-1/base.apk "$BK/com.hiveview.advertisement/base.apk"
pm uninstall com.hiveview.advertisement
fi
if [ -f /data/app/com.hiveview.carousel-2/base.apk ]; then
mkdir -p "$BK/com.hiveview.carousel"
cp /data/app/com.hiveview.carousel-2/base.apk "$BK/com.hiveview.carousel/base.apk"
pm uninstall com.hiveview.carousel
fi
if [ -f /data/app/com.hiveview.clear.manager-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.clear.manager"
cp /data/app/com.hiveview.clear.manager-1/base.apk "$BK/com.hiveview.clear.manager/base.apk"
pm uninstall com.hiveview.clear.manager
fi
if [ -f /data/app/com.hiveview.cloudpromotionalcard-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudpromotionalcard"
cp /data/app/com.hiveview.cloudpromotionalcard-1/base.apk "$BK/com.hiveview.cloudpromotionalcard/base.apk"
pm uninstall com.hiveview.cloudpromotionalcard
fi
if [ -f /data/app/com.hiveview.cloudscreen.appstore-2/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudscreen.appstore"
cp /data/app/com.hiveview.cloudscreen.appstore-2/base.apk "$BK/com.hiveview.cloudscreen.appstore/base.apk"
pm uninstall com.hiveview.cloudscreen.appstore
fi
if [ -f /data/app/com.hiveview.cloudscreen.launcher-4/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudscreen.launcher"
cp /data/app/com.hiveview.cloudscreen.launcher-4/base.apk "$BK/com.hiveview.cloudscreen.launcher/base.apk"
pm uninstall com.hiveview.cloudscreen.launcher
fi
if [ -f /data/app/com.hiveview.cloudscreen.player-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudscreen.player"
cp /data/app/com.hiveview.cloudscreen.player-1/base.apk "$BK/com.hiveview.cloudscreen.player/base.apk"
pm uninstall com.hiveview.cloudscreen.player
fi
if [ -f /data/app/com.hiveview.cloudscreen.py-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudscreen.py"
cp /data/app/com.hiveview.cloudscreen.py-1/base.apk "$BK/com.hiveview.cloudscreen.py/base.apk"
pm uninstall com.hiveview.cloudscreen.py
fi
if [ -f /data/app/com.hiveview.cloudscreen.pyplayer-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudscreen.pyplayer"
cp /data/app/com.hiveview.cloudscreen.pyplayer-1/base.apk "$BK/com.hiveview.cloudscreen.pyplayer/base.apk"
pm uninstall com.hiveview.cloudscreen.pyplayer
fi
if [ -f /data/app/com.hiveview.cloudscreen.search-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudscreen.search"
cp /data/app/com.hiveview.cloudscreen.search-1/base.apk "$BK/com.hiveview.cloudscreen.search/base.apk"
pm uninstall com.hiveview.cloudscreen.search
fi
if [ -f /data/app/com.hiveview.cloudscreen.silentupdate-2/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudscreen.silentupdate"
cp /data/app/com.hiveview.cloudscreen.silentupdate-2/base.apk "$BK/com.hiveview.cloudscreen.silentupdate/base.apk"
pm uninstall com.hiveview.cloudscreen.silentupdate
fi
if [ -f /data/app/com.hiveview.cloudscreen.tip-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudscreen.tip"
cp /data/app/com.hiveview.cloudscreen.tip-1/base.apk "$BK/com.hiveview.cloudscreen.tip/base.apk"
pm uninstall com.hiveview.cloudscreen.tip
fi
if [ -f /data/app/com.hiveview.cloudscreen.user-2/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudscreen.user"
cp /data/app/com.hiveview.cloudscreen.user-2/base.apk "$BK/com.hiveview.cloudscreen.user/base.apk"
pm uninstall com.hiveview.cloudscreen.user
fi
if [ -f /data/app/com.hiveview.cloudscreen.videolive-2/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudscreen.videolive"
cp /data/app/com.hiveview.cloudscreen.videolive-2/base.apk "$BK/com.hiveview.cloudscreen.videolive/base.apk"
pm uninstall com.hiveview.cloudscreen.videolive
fi
if [ -f /data/app/com.hiveview.cloudtv.settings-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.cloudtv.settings"
cp /data/app/com.hiveview.cloudtv.settings-1/base.apk "$BK/com.hiveview.cloudtv.settings/base.apk"
pm uninstall com.hiveview.cloudtv.settings
fi
if [ -f /data/app/com.hiveview.commoditybundle-2/base.apk ]; then
mkdir -p "$BK/com.hiveview.commoditybundle"
cp /data/app/com.hiveview.commoditybundle-2/base.apk "$BK/com.hiveview.commoditybundle/base.apk"
pm uninstall com.hiveview.commoditybundle
fi
if [ -f /data/app/com.hiveview.content-2/base.apk ]; then
mkdir -p "$BK/com.hiveview.content"
cp /data/app/com.hiveview.content-2/base.apk "$BK/com.hiveview.content/base.apk"
pm uninstall com.hiveview.content
fi
if [ -f /data/app/com.hiveview.dataprovider-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.dataprovider"
cp /data/app/com.hiveview.dataprovider-1/base.apk "$BK/com.hiveview.dataprovider/base.apk"
pm uninstall com.hiveview.dataprovider
fi
if [ -f /data/app/com.hiveview.dianshang-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.dianshang"
cp /data/app/com.hiveview.dianshang-1/base.apk "$BK/com.hiveview.dianshang/base.apk"
pm uninstall com.hiveview.dianshang
fi
if [ -f /data/app/com.hiveview.dmadapp-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.dmadapp"
cp /data/app/com.hiveview.dmadapp-1/base.apk "$BK/com.hiveview.dmadapp/base.apk"
pm uninstall com.hiveview.dmadapp
fi
if [ -f /data/app/com.hiveview.premiere-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.premiere"
cp /data/app/com.hiveview.premiere-1/base.apk "$BK/com.hiveview.premiere/base.apk"
pm uninstall com.hiveview.premiere
fi
if [ -f /data/app/com.hiveview.sep-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.sep"
cp /data/app/com.hiveview.sep-1/base.apk "$BK/com.hiveview.sep/base.apk"
pm uninstall com.hiveview.sep
fi
if [ -f /data/app/com.hiveview.silentextend-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.silentextend"
cp /data/app/com.hiveview.silentextend-1/base.apk "$BK/com.hiveview.silentextend/base.apk"
pm uninstall com.hiveview.silentextend
fi
if [ -f /data/app/com.hiveview.upgrade-2/base.apk ]; then
mkdir -p "$BK/com.hiveview.upgrade"
cp /data/app/com.hiveview.upgrade-2/base.apk "$BK/com.hiveview.upgrade/base.apk"
pm uninstall com.hiveview.upgrade
fi
if [ -f /data/app/com.hiveview.user-2/base.apk ]; then
mkdir -p "$BK/com.hiveview.user"
cp /data/app/com.hiveview.user-2/base.apk "$BK/com.hiveview.user/base.apk"
pm uninstall com.hiveview.user
fi
if [ -f /data/app/com.hiveview.voicesearch-2/base.apk ]; then
mkdir -p "$BK/com.hiveview.voicesearch"
cp /data/app/com.hiveview.voicesearch-2/base.apk "$BK/com.hiveview.voicesearch/base.apk"
pm uninstall com.hiveview.voicesearch
fi
if [ -f /data/app/com.hiveview.yunpush.server-1/base.apk ]; then
mkdir -p "$BK/com.hiveview.yunpush.server"
cp /data/app/com.hiveview.yunpush.server-1/base.apk "$BK/com.hiveview.yunpush.server/base.apk"
pm uninstall com.hiveview.yunpush.server
fi
if [ -f /data/app/com.system.safe.tv-1/base.apk ]; then
mkdir -p "$BK/com.system.safe.tv"
cp /data/app/com.system.safe.tv-1/base.apk "$BK/com.system.safe.tv/base.apk"
pm uninstall com.system.safe.tv
fi
if [ -f /data/app/tv.huan.appdist_damai-2/base.apk ]; then
mkdir -p "$BK/tv.huan.appdist_damai"
cp /data/app/tv.huan.appdist_damai-2/base.apk "$BK/tv.huan.appdist_damai/base.apk"
pm uninstall tv.huan.appdist_damai
fi
sync
echo Finished-user-app-cleanup
