package local.dmbox.helper;
import android.app.*;
import android.os.*;
import android.content.*;
import android.graphics.Color;
import android.view.*;
import android.widget.*;
public final class MainActivity extends Activity {
    private TextView status;
    public void onCreate(Bundle b) {
        super.onCreate(b);
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(1); layout.setPadding(48,36,48,36);
        layout.setBackgroundColor(Color.rgb(20,23,32));
        status = new TextView(this); status.setTextColor(Color.WHITE); status.setTextSize(22);
        layout.addView(status);
        Button sync = new Button(this); sync.setText("立即校准时间");
        sync.setOnClickListener(v -> {
            startService(new Intent(this,SyncService.class));
            status.setText("正在校时，请稍后重新进入此页面查看结果");
        }); layout.addView(sync);
        Button launch = new Button(this); launch.setText("打开哔哩哔哩");
        launch.setOnClickListener(v -> {
            Intent i=getPackageManager().getLaunchIntentForPackage("blbl.cat3399");
            if(i!=null) startActivity(i);
        }); layout.addView(launch);
        Button auto = new Button(this);
        auto.setText("开机启动 B 站："+(getSharedPreferences("state",0).getBoolean("auto_bili",true)?"开":"关"));
        auto.setOnClickListener(v -> {
            boolean on=!getSharedPreferences("state",0).getBoolean("auto_bili",true);
            getSharedPreferences("state",0).edit().putBoolean("auto_bili",on).apply();
            auto.setText("开机启动 B 站："+(on?"开":"关"));
        }); layout.addView(auto);
        Button settings = new Button(this); settings.setText("打开安卓原生设置");
        settings.setOnClickListener(v -> startActivity(new Intent().setClassName("com.android.settings","com.android.settings.Settings")));
        layout.addView(settings);
        Button root = new Button(this); root.setText("测试 root 授权");
        root.setOnClickListener(v -> new Thread(() -> {
            String result;
            try {
                java.lang.Process p = new ProcessBuilder("/system/xbin/su","-c","id").redirectErrorStream(true).start();
                java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
                byte[] buf = new byte[512]; int n;
                while ((n=p.getInputStream().read(buf))!=-1) out.write(buf,0,n);
                result="Root 测试退出码："+p.waitFor()+"\n"+out.toString();
            } catch(Exception e) { result=e.toString(); }
            final String text=result; runOnUiThread(() -> status.setText(text));
        }).start());
        layout.addView(root);
        setContentView(layout);
    }
    protected void onResume() {
        super.onResume();
        status.setText("盒子时间助手\n"+new java.util.Date()+"\n"+
            getSharedPreferences("state",0).getString("status","尚未校时"));
    }
}
