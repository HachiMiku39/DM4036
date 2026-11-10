package local.dmbox.helper;
import android.net.*;
import android.os.Process;
import java.io.*;

/** Local-only root service. Only root and the authenticated ADB shell may call it. */
public final class RootDaemon {
    public static void main(String[] args) throws Exception {
        if (Process.myUid()!=0) throw new SecurityException("Root service requires uid 0");
        LocalServerSocket server = new LocalServerSocket("dm4036.authorized.root");
        while (true) {
            final LocalSocket socket=server.accept();
            new Thread(() -> handle(socket),"RootCommand").start();
        }
    }
    private static void handle(LocalSocket socket) {
        try {
            socket.setSoTimeout(30000);
            int uid=socket.getPeerCredentials().getUid();
            if (uid!=0 && uid!=2000) throw new SecurityException("UID is not authorized");
            DataInputStream in=new DataInputStream(socket.getInputStream());
            DataOutputStream out=new DataOutputStream(socket.getOutputStream());
            String command=in.readUTF();
            if (command.length()>8192) throw new IOException("Command too long");
            java.lang.Process process=new ProcessBuilder("/system/bin/sh","-c",command)
                .redirectErrorStream(true).start();
            InputStream output=process.getInputStream();
            byte[] buffer=new byte[8192]; int count;
            while ((count=output.read(buffer))!=-1) {
                out.writeInt(count); out.write(buffer,0,count); out.flush();
            }
            out.writeInt(0); out.writeInt(process.waitFor()); out.flush();
        } catch (Exception e) {
            System.err.println("Root request rejected/failed: "+e.getClass().getSimpleName());
        } finally { try { socket.close(); } catch(Exception ignored) {} }
    }
}
