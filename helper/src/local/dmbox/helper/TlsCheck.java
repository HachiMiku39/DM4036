package local.dmbox.helper;
import java.net.*;
import javax.net.ssl.*;
public final class TlsCheck {
 public static void main(String[] args) {
  for(String url:args) {
   HttpsURLConnection c=null;
   try {
    c=(HttpsURLConnection)new URL(url).openConnection();
    c.setConnectTimeout(6000); c.setReadTimeout(6000); c.setInstanceFollowRedirects(false);
    int status=c.getResponseCode();
    System.out.println(new URL(url).getHost()+" TLS_OK HTTP="+status+" cipher="+c.getCipherSuite());
   } catch(Exception e) {System.out.println(url+" TLS_FAIL "+e.getClass().getSimpleName()+": "+e.getMessage());}
   finally {if(c!=null)c.disconnect();}
  }
 }
}
