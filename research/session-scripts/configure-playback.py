import sys,pathlib,xml.etree.ElementTree as E,shlex
sys.path.insert(0,str(pathlib.Path(__file__).resolve().parent))
from device import adb,shell,BASE
print(adb('push',str(BASE/'tools/ijk/libijkplayer.so'),'/data/local/tmp/libijkplayer.so'))
prefs='/data/data/blbl.cat3399/shared_prefs/blbl_prefs.xml'
print(shell('am force-stop blbl.cat3399',root=True))
t=E.fromstring(shell('cat '+prefs,root=True))
for key,kind,value in [('player_engine_kind','string','ijkplayer'),('player_codec','string','AVC'),('player_preferred_qn','int','80'),('player_seamless_quality_switch_enabled','boolean','false')]:
 for x in list(t):
  if x.get('name')==key:t.remove(x)
 x=E.SubElement(t,kind,{'name':key})
 if kind=='string':x.text=value
 else:x.set('value',value)
f=BASE/'blbl-prefs-fixed.xml';E.ElementTree(t).write(f,encoding='utf-8',xml_declaration=True)
print(adb('push',str(f),'/data/local/tmp/blbl-prefs-fixed.xml'))
cmd='mkdir -p /data/data/blbl.cat3399/files/plugins/ijkplayer/armeabi-v7a; cp /data/local/tmp/libijkplayer.so /data/data/blbl.cat3399/files/plugins/ijkplayer/armeabi-v7a/; echo 4 > /data/data/blbl.cat3399/files/plugins/ijkplayer/armeabi-v7a/install_stamp; chown -R 10051:10051 /data/data/blbl.cat3399/files/plugins; chmod 755 /data/data/blbl.cat3399/files/plugins/ijkplayer/armeabi-v7a/libijkplayer.so; cp /data/local/tmp/blbl-prefs-fixed.xml '+prefs+'; chown 10051:10051 '+prefs+'; chmod 660 '+prefs+'; monkey -p blbl.cat3399 -c android.intent.category.LAUNCHER 1'
print(shell(cmd,root=True))
