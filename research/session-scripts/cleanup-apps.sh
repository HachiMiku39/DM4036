#!/system/bin/sh
set -eu
export PATH=/system/bin:/system/xbin
BK=/data/local/dm4036-backup/apps
mkdir -p "$BK"
mount -o remount,rw /system
am force-stop com.damai.browser || true
pm disable-user com.damai.browser || true
am force-stop com.fast.clean.tv || true
pm disable-user com.fast.clean.tv || true
am force-stop com.gitvdamai.video || true
pm disable-user com.gitvdamai.video || true
am force-stop com.hiveview.abn || true
pm disable-user com.hiveview.abn || true
am force-stop com.hiveview.advertisement || true
pm disable-user com.hiveview.advertisement || true
am force-stop com.hiveview.carousel || true
pm disable-user com.hiveview.carousel || true
am force-stop com.hiveview.clear.manager || true
pm disable-user com.hiveview.clear.manager || true
am force-stop com.hiveview.cloudpromotionalcard || true
pm disable-user com.hiveview.cloudpromotionalcard || true
am force-stop com.hiveview.cloudscreen.appstore || true
pm disable-user com.hiveview.cloudscreen.appstore || true
am force-stop com.hiveview.cloudscreen.guide || true
pm disable-user com.hiveview.cloudscreen.guide || true
am force-stop com.hiveview.cloudscreen.launcher || true
pm disable-user com.hiveview.cloudscreen.launcher || true
am force-stop com.hiveview.cloudscreen.player || true
pm disable-user com.hiveview.cloudscreen.player || true
am force-stop com.hiveview.cloudscreen.py || true
pm disable-user com.hiveview.cloudscreen.py || true
am force-stop com.hiveview.cloudscreen.pyplayer || true
pm disable-user com.hiveview.cloudscreen.pyplayer || true
am force-stop com.hiveview.cloudscreen.search || true
pm disable-user com.hiveview.cloudscreen.search || true
am force-stop com.hiveview.cloudscreen.silentupdate || true
pm disable-user com.hiveview.cloudscreen.silentupdate || true
am force-stop com.hiveview.cloudscreen.tip || true
pm disable-user com.hiveview.cloudscreen.tip || true
am force-stop com.hiveview.cloudscreen.user || true
pm disable-user com.hiveview.cloudscreen.user || true
am force-stop com.hiveview.cloudscreen.videolive || true
pm disable-user com.hiveview.cloudscreen.videolive || true
am force-stop com.hiveview.cloudtv.settings || true
pm disable-user com.hiveview.cloudtv.settings || true
am force-stop com.hiveview.commoditybundle || true
pm disable-user com.hiveview.commoditybundle || true
am force-stop com.hiveview.content || true
pm disable-user com.hiveview.content || true
am force-stop com.hiveview.dataprovider || true
pm disable-user com.hiveview.dataprovider || true
am force-stop com.hiveview.dianshang || true
pm disable-user com.hiveview.dianshang || true
am force-stop com.hiveview.dmadapp || true
pm disable-user com.hiveview.dmadapp || true
am force-stop com.hiveview.hiveviewdog || true
pm disable-user com.hiveview.hiveviewdog || true
am force-stop com.hiveview.keycodemonitorserver || true
pm disable-user com.hiveview.keycodemonitorserver || true
am force-stop com.hiveview.premiere || true
pm disable-user com.hiveview.premiere || true
am force-stop com.hiveview.sep || true
pm disable-user com.hiveview.sep || true
am force-stop com.hiveview.silentextend || true
pm disable-user com.hiveview.silentextend || true
am force-stop com.hiveview.smalllauncher || true
pm disable-user com.hiveview.smalllauncher || true
am force-stop com.hiveview.upgrade || true
pm disable-user com.hiveview.upgrade || true
am force-stop com.hiveview.user || true
pm disable-user com.hiveview.user || true
am force-stop com.hiveview.voicesearch || true
pm disable-user com.hiveview.voicesearch || true
am force-stop com.hiveview.yunpush.server || true
pm disable-user com.hiveview.yunpush.server || true
am force-stop com.system.safe.tv || true
pm disable-user com.system.safe.tv || true
am force-stop tv.huan.appdist_damai || true
pm disable-user tv.huan.appdist_damai || true
if [ -d /system/app/CloudPromotionalCard_v1.05.24_202101051714_target28_damai_release_sign ]; then busybox mv /system/app/CloudPromotionalCard_v1.05.24_202101051714_target28_damai_release_sign "$BK/"; fi
if [ -d /system/app/CloudScreenTVSearch2.1_v2.08.13_202005281341_target19_release ]; then busybox mv /system/app/CloudScreenTVSearch2.1_v2.08.13_202005281341_target19_release "$BK/"; fi
if [ -d /system/app/CloudScreenUser_v1.05.70_202103181529_sign ]; then busybox mv /system/app/CloudScreenUser_v1.05.70_202103181529_sign "$BK/"; fi
if [ -d /system/app/CloudScreenVideoLiveCN_20210730_4.19.0422_sign ]; then busybox mv /system/app/CloudScreenVideoLiveCN_20210730_4.19.0422_sign "$BK/"; fi
if [ -d /system/app/CommodityBundle_4.4.16_202106211619 ]; then busybox mv /system/app/CommodityBundle_4.4.16_202106211619 "$BK/"; fi
if [ -d /system/app/DataProvider_2.02.30_201901181440_sign ]; then busybox mv /system/app/DataProvider_2.02.30_201901181440_sign "$BK/"; fi
if [ -d /system/app/DebugTool_27_4.1.201128_x905_20210820 ]; then busybox mv /system/app/DebugTool_27_4.1.201128_x905_20210820 "$BK/"; fi
if [ -d /system/app/DomyUI4.x_CompositePlayer_2.17.20_202107301506 ]; then busybox mv /system/app/DomyUI4.x_CompositePlayer_2.17.20_202107301506 "$BK/"; fi
if [ -d /system/app/DomyUI5.1_Launcher_5.01.80_202107301450 ]; then busybox mv /system/app/DomyUI5.1_Launcher_5.01.80_202107301450 "$BK/"; fi
if [ -d /system/app/DomyUI5.1_details_4.1.54_202103231005 ]; then busybox mv /system/app/DomyUI5.1_details_4.1.54_202103231005 "$BK/"; fi
if [ -d /system/app/HiveviewDog ]; then busybox mv /system/app/HiveviewDog "$BK/"; fi
if [ -d /system/app/HiveviewGuide_4.1.7_417_20200529_sign ]; then busybox mv /system/app/HiveviewGuide_4.1.7_417_20200529_sign "$BK/"; fi
if [ -d /system/app/Hiveview_Domybox_ClearManager_20201020 ]; then busybox mv /system/app/Hiveview_Domybox_ClearManager_20201020 "$BK/"; fi
if [ -d /system/app/Hiveview_Domybox_Setting_905_20201225 ]; then busybox mv /system/app/Hiveview_Domybox_Setting_905_20201225 "$BK/"; fi
if [ -d /system/app/KeyCodeMonitorServer ]; then busybox mv /system/app/KeyCodeMonitorServer "$BK/"; fi
if [ -d /system/app/OTAupdate_3.1UI_v2021.06.03_202107281346_target25_damai_release_1.0s_signed ]; then busybox mv /system/app/OTAupdate_3.1UI_v2021.06.03_202107281346_target25_damai_release_1.0s_signed "$BK/"; fi
if [ -d /system/app/PayCenter_5.07.12_202107131601_sign ]; then busybox mv /system/app/PayCenter_5.07.12_202107131601_sign "$BK/"; fi
if [ -d /system/app/SilentUpdate_1.03.08_308_202108121454 ]; then busybox mv /system/app/SilentUpdate_1.03.08_308_202108121454 "$BK/"; fi
if [ -d /system/app/SmallLauncher ]; then busybox mv /system/app/SmallLauncher "$BK/"; fi
if [ -d /system/app/YunPushServer_v1.02.43_202104141203_target26_damai_release_1.0s_signed ]; then busybox mv /system/app/YunPushServer_v1.02.43_202104141203_target26_damai_release_1.0s_signed "$BK/"; fi
if [ -d /system/app/advertisement_20210708_sign ]; then busybox mv /system/app/advertisement_20210708_sign "$BK/"; fi
if [ -d /system/app/browser_6_20200930 ]; then busybox mv /system/app/browser_6_20200930 "$BK/"; fi
if [ -d /system/app/system_nutlet_damai_202107080952_2.2.27_release_905x_signed ]; then busybox mv /system/app/system_nutlet_damai_202107080952_2.2.27_release_905x_signed "$BK/"; fi
mkdir -p "$BK/updates/com.hiveview.user"
cp /data/app/com.hiveview.user-2/base.apk "$BK/updates/com.hiveview.user/base.apk"
pm uninstall --user 0 com.hiveview.user || true
mkdir -p "$BK/updates/com.hiveview.dmadapp"
cp /data/app/com.hiveview.dmadapp-1/base.apk "$BK/updates/com.hiveview.dmadapp/base.apk"
pm uninstall --user 0 com.hiveview.dmadapp || true
mkdir -p "$BK/updates/com.hiveview.dataprovider"
cp /data/app/com.hiveview.dataprovider-1/base.apk "$BK/updates/com.hiveview.dataprovider/base.apk"
pm uninstall --user 0 com.hiveview.dataprovider || true
mkdir -p "$BK/updates/com.hiveview.premiere"
cp /data/app/com.hiveview.premiere-1/base.apk "$BK/updates/com.hiveview.premiere/base.apk"
pm uninstall --user 0 com.hiveview.premiere || true
mkdir -p "$BK/updates/com.hiveview.abn"
cp /data/app/com.hiveview.abn-1/base.apk "$BK/updates/com.hiveview.abn/base.apk"
pm uninstall --user 0 com.hiveview.abn || true
mkdir -p "$BK/updates/com.hiveview.sep"
cp /data/app/com.hiveview.sep-1/base.apk "$BK/updates/com.hiveview.sep/base.apk"
pm uninstall --user 0 com.hiveview.sep || true
mkdir -p "$BK/updates/com.hiveview.dianshang"
cp /data/app/com.hiveview.dianshang-1/base.apk "$BK/updates/com.hiveview.dianshang/base.apk"
pm uninstall --user 0 com.hiveview.dianshang || true
mkdir -p "$BK/updates/com.hiveview.cloudscreen.pyplayer"
cp /data/app/com.hiveview.cloudscreen.pyplayer-1/base.apk "$BK/updates/com.hiveview.cloudscreen.pyplayer/base.apk"
pm uninstall --user 0 com.hiveview.cloudscreen.pyplayer || true
mkdir -p "$BK/updates/com.system.safe.tv"
cp /data/app/com.system.safe.tv-1/base.apk "$BK/updates/com.system.safe.tv/base.apk"
pm uninstall --user 0 com.system.safe.tv || true
mkdir -p "$BK/updates/com.hiveview.cloudscreen.appstore"
cp /data/app/com.hiveview.cloudscreen.appstore-2/base.apk "$BK/updates/com.hiveview.cloudscreen.appstore/base.apk"
pm uninstall --user 0 com.hiveview.cloudscreen.appstore || true
mkdir -p "$BK/updates/com.hiveview.cloudscreen.player"
cp /data/app/com.hiveview.cloudscreen.player-1/base.apk "$BK/updates/com.hiveview.cloudscreen.player/base.apk"
pm uninstall --user 0 com.hiveview.cloudscreen.player || true
mkdir -p "$BK/updates/com.hiveview.cloudscreen.search"
cp /data/app/com.hiveview.cloudscreen.search-1/base.apk "$BK/updates/com.hiveview.cloudscreen.search/base.apk"
pm uninstall --user 0 com.hiveview.cloudscreen.search || true
mkdir -p "$BK/updates/com.hiveview.silentextend"
cp /data/app/com.hiveview.silentextend-1/base.apk "$BK/updates/com.hiveview.silentextend/base.apk"
pm uninstall --user 0 com.hiveview.silentextend || true
mkdir -p "$BK/updates/com.hiveview.cloudscreen.videolive"
cp /data/app/com.hiveview.cloudscreen.videolive-2/base.apk "$BK/updates/com.hiveview.cloudscreen.videolive/base.apk"
pm uninstall --user 0 com.hiveview.cloudscreen.videolive || true
mkdir -p "$BK/updates/com.hiveview.cloudscreen.tip"
cp /data/app/com.hiveview.cloudscreen.tip-1/base.apk "$BK/updates/com.hiveview.cloudscreen.tip/base.apk"
pm uninstall --user 0 com.hiveview.cloudscreen.tip || true
mkdir -p "$BK/updates/com.hiveview.carousel"
cp /data/app/com.hiveview.carousel-2/base.apk "$BK/updates/com.hiveview.carousel/base.apk"
pm uninstall --user 0 com.hiveview.carousel || true
mkdir -p "$BK/updates/com.hiveview.commoditybundle"
cp /data/app/com.hiveview.commoditybundle-2/base.apk "$BK/updates/com.hiveview.commoditybundle/base.apk"
pm uninstall --user 0 com.hiveview.commoditybundle || true
mkdir -p "$BK/updates/com.hiveview.cloudscreen.py"
cp /data/app/com.hiveview.cloudscreen.py-1/base.apk "$BK/updates/com.hiveview.cloudscreen.py/base.apk"
pm uninstall --user 0 com.hiveview.cloudscreen.py || true
mkdir -p "$BK/updates/com.hiveview.clear.manager"
cp /data/app/com.hiveview.clear.manager-1/base.apk "$BK/updates/com.hiveview.clear.manager/base.apk"
pm uninstall --user 0 com.hiveview.clear.manager || true
mkdir -p "$BK/updates/com.hiveview.upgrade"
cp /data/app/com.hiveview.upgrade-2/base.apk "$BK/updates/com.hiveview.upgrade/base.apk"
pm uninstall --user 0 com.hiveview.upgrade || true
mkdir -p "$BK/updates/com.fast.clean.tv"
cp /data/app/com.fast.clean.tv-1/base.apk "$BK/updates/com.fast.clean.tv/base.apk"
pm uninstall --user 0 com.fast.clean.tv || true
mkdir -p "$BK/updates/com.hiveview.cloudscreen.silentupdate"
cp /data/app/com.hiveview.cloudscreen.silentupdate-2/base.apk "$BK/updates/com.hiveview.cloudscreen.silentupdate/base.apk"
pm uninstall --user 0 com.hiveview.cloudscreen.silentupdate || true
mkdir -p "$BK/updates/tv.huan.appdist_damai"
cp /data/app/tv.huan.appdist_damai-2/base.apk "$BK/updates/tv.huan.appdist_damai/base.apk"
pm uninstall --user 0 tv.huan.appdist_damai || true
mkdir -p "$BK/updates/com.hiveview.yunpush.server"
cp /data/app/com.hiveview.yunpush.server-1/base.apk "$BK/updates/com.hiveview.yunpush.server/base.apk"
pm uninstall --user 0 com.hiveview.yunpush.server || true
mkdir -p "$BK/updates/com.gitvdamai.video"
cp /data/app/com.gitvdamai.video-1/base.apk "$BK/updates/com.gitvdamai.video/base.apk"
pm uninstall --user 0 com.gitvdamai.video || true
mkdir -p "$BK/updates/com.hiveview.cloudscreen.launcher"
cp /data/app/com.hiveview.cloudscreen.launcher-4/base.apk "$BK/updates/com.hiveview.cloudscreen.launcher/base.apk"
pm uninstall --user 0 com.hiveview.cloudscreen.launcher || true
mkdir -p "$BK/updates/com.hiveview.cloudscreen.user"
cp /data/app/com.hiveview.cloudscreen.user-2/base.apk "$BK/updates/com.hiveview.cloudscreen.user/base.apk"
pm uninstall --user 0 com.hiveview.cloudscreen.user || true
mkdir -p "$BK/updates/com.hiveview.advertisement"
cp /data/app/com.hiveview.advertisement-1/base.apk "$BK/updates/com.hiveview.advertisement/base.apk"
pm uninstall --user 0 com.hiveview.advertisement || true
mkdir -p "$BK/updates/com.hiveview.cloudtv.settings"
cp /data/app/com.hiveview.cloudtv.settings-1/base.apk "$BK/updates/com.hiveview.cloudtv.settings/base.apk"
pm uninstall --user 0 com.hiveview.cloudtv.settings || true
mkdir -p "$BK/updates/com.hiveview.voicesearch"
cp /data/app/com.hiveview.voicesearch-2/base.apk "$BK/updates/com.hiveview.voicesearch/base.apk"
pm uninstall --user 0 com.hiveview.voicesearch || true
mkdir -p "$BK/updates/com.hiveview.content"
cp /data/app/com.hiveview.content-2/base.apk "$BK/updates/com.hiveview.content/base.apk"
pm uninstall --user 0 com.hiveview.content || true
mkdir -p "$BK/updates/com.hiveview.cloudpromotionalcard"
cp /data/app/com.hiveview.cloudpromotionalcard-1/base.apk "$BK/updates/com.hiveview.cloudpromotionalcard/base.apk"
pm uninstall --user 0 com.hiveview.cloudpromotionalcard || true
sync
mount -o remount,ro /system || true
echo Cleanup-completed
