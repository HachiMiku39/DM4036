package local.dmbox.helper;
import android.net.*;
import java.io.*;

public final class SuClient {
    public static void main(String[] args) throws Exception {
        if (args.length<2 || !"-c".equals(args[0])) {
            System.err.println("Usage: su -c 'command' (authorized ADB shell only)");
            System.exit(2);
        }
        LocalSocket socket=new LocalSocket();
        socket.connect(new LocalSocketAddress("dm4036.authorized.root",LocalSocketAddress.Namespace.ABSTRACT));
        DataOutputStream out=new DataOutputStream(socket.getOutputStream());
        out.writeUTF(args[1]); out.flush();
        DataInputStream in=new DataInputStream(socket.getInputStream());
        byte[] buffer=new byte[8192];
        while(true) {
            int size=in.readInt();
            if(size==0) { int code=in.readInt(); socket.close(); System.exit(code); }
            if(size<0 || size>buffer.length) throw new IOException("Invalid frame");
            in.readFully(buffer,0,size); System.out.write(buffer,0,size); System.out.flush();
        }
    }
}
