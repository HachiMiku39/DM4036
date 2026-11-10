package local.dmbox.helper;
import android.app.*;
import android.content.*;
import android.os.*;
import android.util.Log;
import java.net.*;

public final class SyncService extends IntentService {
    public SyncService() { super("BoxTimeSync"); }
    private long read32(byte[] b, int p) {
        return ((long)(b[p]&255)<<24)|((long)(b[p+1]&255)<<16)|
               ((long)(b[p+2]&255)<<8)|(b[p+3]&255);
    }
    private long query(String host) throws Exception {
        DatagramSocket s = new DatagramSocket();
        try {
            s.setSoTimeout(1800);
            byte[] b = new byte[48]; b[0] = 0x23;
            InetAddress address = InetAddress.getByName(host);
            DatagramPacket request = new DatagramPacket(b, b.length, address, 123);
            long start = SystemClock.elapsedRealtime();
            s.send(request);
            DatagramPacket reply = new DatagramPacket(new byte[48],48);
            s.receive(reply);
            byte[] r = reply.getData();
            if (reply.getLength()<48 || (r[0]&7)!=4 || (r[0]&0xc0)==0xc0 ||
                (r[1]&255)==0 || (r[1]&255)>15 || !reply.getAddress().equals(address))
                throw new Exception("invalid NTP reply");
            long time = (read32(r,40)-2208988800L)*1000L +
                        read32(r,44)*1000L/4294967296L +
                        (SystemClock.elapsedRealtime()-start)/2;
            if (time<1704067200000L || time>2145916800000L)
                throw new Exception("time outside supported range");
            return time;
        } finally { s.close(); }
    }
    private long httpTime() throws Exception {
        long first=0;
        for (String host : new String[]{"www.baidu.com","www.qq.com"}) {
            HttpURLConnection c=(HttpURLConnection)new URL("http://"+host+"/?dmbox_time="+SystemClock.elapsedRealtime()).openConnection();
            try {
                c.setConnectTimeout(2500); c.setReadTimeout(2500);
                c.setInstanceFollowRedirects(false); c.setUseCaches(false);
                c.setRequestProperty("Cache-Control","no-cache");
                c.getResponseCode(); long t=c.getHeaderFieldDate("Date",0);
                if (t<1704067200000L || t>2145916800000L) throw new Exception("invalid HTTP date");
                if (first!=0 && Math.abs(t-first)>60000) throw new Exception("time servers disagree");
                first=t;
            } finally {c.disconnect();}
        }
        return first;
    }
    protected void onHandleIntent(Intent i) {
        AlarmManager alarms=(AlarmManager)getSystemService(ALARM_SERVICE);
        alarms.setTimeZone("Asia/Shanghai");
        PendingIntent next=PendingIntent.getService(this,1,new Intent(this,SyncService.class),PendingIntent.FLAG_UPDATE_CURRENT);
        alarms.setInexactRepeating(AlarmManager.ELAPSED_REALTIME,SystemClock.elapsedRealtime()+21600000L,21600000L,next);
        boolean boot = i!=null && i.getBooleanExtra("boot",false);
        if (boot) {
            try {
                java.io.BufferedReader r=new java.io.BufferedReader(new java.io.FileReader("/proc/sys/kernel/random/boot_id"));
                String bootId=r.readLine(); r.close();
                String previous=getSharedPreferences("state",0).getString("boot_id","");
                if (bootId.equals(previous)) return;
                getSharedPreferences("state",0).edit().putString("boot_id",bootId).commit();
            } catch(Exception ignored) {}
        }
        boolean good = false;
        String error = "网络尚未就绪";
        for (int n=0; n<(boot?3:1) && !good; n++) {
            for (String host : new String[]{"ntp.aliyun.com","ntp1.aliyun.com"}) {
                try {
                    long time = query(host);
                    ((AlarmManager)getSystemService(ALARM_SERVICE)).setTime(time);
                    if (Math.abs(System.currentTimeMillis()-time)>3000)
                        throw new Exception("系统未授予校时权限");
                    getSharedPreferences("state",0).edit().putLong("last_sync",time)
                        .putString("status","校时成功").apply();
                    Log.i("DMBoxHelper","Time synchronized from "+host);
                    good = true; break;
                } catch (Exception e) { error=e.getClass().getSimpleName()+": "+e.getMessage(); }
            }
            if (!good && boot) SystemClock.sleep(2000);
        }
        if (!good) {
            try {
                long time=httpTime(); alarms.setTime(time);
                if(Math.abs(System.currentTimeMillis()-time)>3000) throw new Exception("time permission denied");
                getSharedPreferences("state",0).edit().putLong("last_sync",time).putString("status","HTTP 双服务器校时成功（NTP 备用）").apply();
                Log.i("DMBoxHelper","Time synchronized with two HTTP Date servers");
                good=true;
            } catch(Exception e) {error=e.toString();}
        }
        if (!good) {
            getSharedPreferences("state",0).edit().putString("status",error).apply();
            Log.w("DMBoxHelper","Time sync failed: "+error);
        }
        if (boot && getSharedPreferences("state",0).getBoolean("auto_bili",true)) {
            Intent launch = getPackageManager().getLaunchIntentForPackage("blbl.cat3399");
            if (launch!=null) {
                launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(launch);
            }
        }
    }
}
