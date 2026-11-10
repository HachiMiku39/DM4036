import base64,pathlib,shlex
import device
folder='/data/misc/adb'; path=folder+'/adb_keys'
pub=(device.BASE/'android/adbkey.pub').read_text().strip()
device.binder(2,folder,0,2000)
try:
    found=device.shell('test -f '+path+' && echo yes || echo no',root=True).strip()=='yes'
    if found:
        device.binder(2,path,0,2000)
        old=device.shell('cat '+path,root=True)
        (device.BASE/'backup/adb_keys.original').write_text(old+'\n')
    else:
        old=''
    lines=old.splitlines()
    if pub not in lines: lines.append(pub)
    encoded=base64.b64encode(('\n'.join(lines)+'\n').encode()).decode()
    print(device.shell('printf %s '+shlex.quote(encoded)+' | /system/xbin/busybox base64 -d > '+path,root=True))
    print(device.binder(2,path,1000,2000)); print(device.binder(1,path,0o640))
finally:
    print(device.binder(2,folder,1000,2000)); print(device.binder(1,folder,0o2750-65536))
print(device.shell('chmod 600 /dev/__properties__; /data/local/tmp/magisk resetprop -n ro.adb.secure 1; chmod 444 /dev/__properties__; getprop ro.adb.secure',root=True))
print('Added this Mac public key; retained other keys and enabled ADB authentication.')
