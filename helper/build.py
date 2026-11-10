from pathlib import Path
import subprocess,shutil,os
p=Path(__file__).resolve().parent
tools=p.parent/'tools'
android=Path(os.environ.get('DM_ANDROID_JAR',str(tools/'sdk23/android-6.0/android.jar')))
for folder in ['classes','dex','apk']:(p/folder).mkdir(parents=True,exist_ok=True)
def run(*args): subprocess.run([str(x) for x in args],check=True)
run('javac','--release','8','-Xlint:-options','-encoding','UTF-8','-classpath',android,'-d',p/'classes',*sorted((p/'src/local/dmbox/helper').glob('*.java')))
run('jar','cf',p/'helper-classes.jar','-C',p/'classes','.')
run('java','-cp',tools/'r8.jar','com.android.tools.r8.D8','--min-api','21','--lib',android,'--output',p/'dex',p/'helper-classes.jar')
shutil.copyfile(p/'dex/classes.dex',p/'apk/classes.dex')
run('java','-jar',tools/'apktool.jar','b','-p',p.parent/'apk-framework','-o',p/'helper-unsigned.apk',p/'apk')
pw=p/'signing-password.txt'
if not pw.exists() or not (p/'helper.keystore').exists():
    raise SystemExit('Signing key is intentionally excluded from the handoff archive; create your own key as documented, or use the provided signed APK.')
dest=p.parent/'dist/dm4036-time-helper.apk'
dest.parent.mkdir(parents=True,exist_ok=True)
shutil.copyfile(p/'helper-unsigned.apk',dest)
run('jarsigner','-keystore',p/'helper.keystore','-storepass:file',pw,'-keypass:file',pw,'-sigalg','SHA256withRSA','-digestalg','SHA-256',dest,'helper')
print('Built',dest)
