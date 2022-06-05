/*
Clase Enviar email con los metodos de configuración para el envio de emails
 */
package controlador;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author daw2
 */
public class EnviarEmail {

    public static void enviarEmail(String to, String pass) {

        // to = "msb.caixa@gmail.com";//change accordingly
//Get the session object
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(to, pass);//Put your email id and password here
            }
        });
//compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(to));//change accordingly
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Hello mohammed sebti benzakour");
            message.setText("Testing.......Tu contraseña es : " + pass);
//send message
            Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
//        return new PasswordAuthentication("msb.caixa@gmail.com", "93345900");
    }

    public static void main(String[] args) {
//        String to = "msb.caixa@gmail.com";//change accordingly
////Get the session object
//        Properties props = new Properties();
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.socketFactory.port", "465");
//        props.put("mail.smtp.socketFactory.class",
//                "javax.net.ssl.SSLSocketFactory");
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.port", "465");
//        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication("msb.caixa@gmail.com", "93345900");//Put your email id and password here
//            }
//        });
////compose message
//        try {
//            MimeMessage message = new MimeMessage(session);
//            message.setFrom(new InternetAddress("msb.caixa@gmail.com"));//change accordingly
//            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
//            message.setSubject("Hello");
//            message.setText("Testing.......");
////send message
//            Transport.send(message);
//            System.out.println("message sent successfully");
//        } catch (MessagingException e) {
//            throw new RuntimeException(e);
//        }

        EnviarEmail.enviarEmail("msb.caixa@gmail.com", "93345900");

    }

}
