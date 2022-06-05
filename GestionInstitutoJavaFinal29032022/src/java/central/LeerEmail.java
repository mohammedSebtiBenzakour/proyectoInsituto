/*
Servlet para leer los correos
 */
package central;

import java.io.IOException;
import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.ContentType;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author daw2
 */
public class LeerEmail {

    public static void LeerCorreos() {
        Properties props = System.getProperties();
        props.setProperty("mail.store.protocol", "imaps");
        try {
            Session session = Session.getDefaultInstance(props, null);
            Store store = session.getStore("imaps");
            store.connect("outlook.office365.com", "msb.iescamas@outlook.com", "Msb.93345900");
            Folder[] folders = store.getDefaultFolder().list("*");
            for (Folder folder : folders) {
                if (folder.getType() == 3) {
                    System.out.println(folder.getFullName() + ": " + folder.getMessageCount());

                    folder = store.getFolder(folder.getFullName());
                    folder.open(Folder.READ_ONLY);

                    Message[] mensajes = folder.getMessages();

                    for (int i = 0; i < mensajes.length; i++) {
                        System.out.println("DE    : " + mensajes[i].getFrom()[0].toString());
                        System.out.println("ASUNTO: " + mensajes[i].getSubject());
                    }
                }
            }
            store.close();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static Message[] LeerCorreos1() {
        Message[] mensajes = null;
        Properties props = System.getProperties();
        props.setProperty("mail.store.protocol", "imaps");
        try {
            Session session = Session.getDefaultInstance(props, null);
            Store store = session.getStore("imaps");
            store.connect("outlook.office365.com", "msb.iescamas@outlook.com", "Msb.93345900");
            Folder[] folders = store.getDefaultFolder().list("*");
            for (Folder folder : folders) {
                if (folder.getType() == 3) {
                    System.out.println(folder.getFullName() + ": " + folder.getMessageCount());

                    folder = store.getFolder(folder.getFullName());
                    folder.open(Folder.READ_ONLY);

                    mensajes = folder.getMessages();

                    for (int i = 0; i < mensajes.length; i++) {
                        System.out.println("DE    : " + mensajes[i].getFrom()[0].toString());
                        System.out.println("ASUNTO: " + mensajes[i].getSubject());
                    }
                }
            }
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return mensajes;
    }

    public static void leerCorreo() throws IOException {
        Properties prop = new Properties();

        // Deshabilitamos TLS
        prop.setProperty("mail.pop3.starttls.enable", "false");

        // Hay que usar SSL
        prop.setProperty("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        prop.setProperty("mail.pop3.socketFactory.fallback", "false");

        // Puerto 995 para conectarse.
        prop.setProperty("mail.pop3.port", "995");
        prop.setProperty("mail.pop3.socketFactory.port", "995");

        Session sesion = Session.getInstance(prop);
        sesion.setDebug(false);
        LeerEmail le = new LeerEmail();
     
        Store store = null;
        Folder folder;
        try {
            store = sesion.getStore("pop3");
            store.connect("outlook.office365.com", "msb.iescamas@outlook.com", "Msb.93345900");

            folder = store.getFolder("INBOX");
            folder.open(Folder.READ_ONLY);

            Message[] mensajes = folder.getMessages();
            String res = null;
            for (int i = 0; i < mensajes.length; i++) {
                System.out.println("DE    : " + mensajes[i].getFrom()[0].toString());
                System.out.println("ASUNTO: " + mensajes[i].getSubject());
               res = le.getTextFromMessage(mensajes[i]);
               
                System.out.println("el le es " + res);
            }
            store.close();
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    public  String getTextFromMessage(Message message) throws IOException, MessagingException {
        String result = "";
        if (message.isMimeType("text/plain")) {
            result = message.getContent().toString();
        } else if (message.isMimeType("multipart/*")) {
            MimeMultipart mimeMultipart = (MimeMultipart) message.getContent();
            result = getTextFromMimeMultipart(mimeMultipart);
        }
        return result;
    }

    public String getTextFromMimeMultipart(
            MimeMultipart mimeMultipart) throws IOException, MessagingException {

        int count = mimeMultipart.getCount();
        if (count == 0) {
            throw new MessagingException("Multipart with no body parts not supported.");
        }
        boolean multipartAlt = new ContentType(mimeMultipart.getContentType()).match("multipart/alternative");
        if (multipartAlt) // alternatives appear in an order of increasing 
        // faithfulness to the original content. Customize as req'd.
        {
            return getTextFromBodyPart(mimeMultipart.getBodyPart(count - 1));
        }
        String result = "";
        for (int i = 0; i < count; i++) {
            BodyPart bodyPart = mimeMultipart.getBodyPart(i);
            result += getTextFromBodyPart(bodyPart);
        }
        return result;
    }

    public String getTextFromBodyPart(BodyPart bodyPart) throws IOException, MessagingException {

        String result = "";
        if (bodyPart.isMimeType("text/plain")) {
            result = (String) bodyPart.getContent();
        } else if (bodyPart.isMimeType("text/html")) {
            String html = (String) bodyPart.getContent();
            result = org.jsoup.Jsoup.parse(html).text();
        } else if (bodyPart.getContent() instanceof MimeMultipart) {
            result = getTextFromMimeMultipart((MimeMultipart) bodyPart.getContent());
        }
        return result;
    }

    public static void main(String[] args) throws IOException {
        leerCorreo();
        
      
    }
}
