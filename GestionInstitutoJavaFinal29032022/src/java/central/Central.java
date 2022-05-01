/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package central;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author daw2
 */
public class Central {
    
     public void setEnviarEmail(Email email, String password) throws AddressException, MessagingException {
        String emailError = "";
        Properties p = new Properties();
        // Servidor smtp de correo
        p.setProperty("mail.smtp.host", "smtp.gmail.com");
        // Usar TLS
        p.setProperty("mail.smtp.starttls.enable", "true");
        // puerto del servidor smtp
        p.setProperty("mail.smtp.port", "587");
        // Usuario smtp
        p.setProperty("mail.smtp.user", email.getFrom());
        // Autenticación requerida
        p.setProperty("mail.smtp.auth", "true");
        // Obtenemos la sesión
        Session sesion = Session.getDefaultInstance(p);
        sesion.setDebug(false);
        // Creamos el mensaje
        MimeMessage mensaje = new MimeMessage(sesion);
        // Y establecemos sus propiedades

        mensaje.setFrom(new InternetAddress(email.getFrom()));
        mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(email.getTo()));
        mensaje.setSubject(email.getSubject());
        mensaje.setText(email.getText());
        // Enviamos el mensaje
        Transport t = sesion.getTransport("smtp");
        // Para conectarnos usamos usuario y password
        t.connect(email.getFrom(), password);
        t.sendMessage(mensaje, mensaje.getAllRecipients());

    }
    
}
