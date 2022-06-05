/*
Clase para enviar un email
 */
package controladorVerificacionEmail;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author daw2
 */
public class EnviarEmail {

    public String getRandom() {

        Random rnd = new Random();

        int numero = rnd.nextInt(999999);

        String formatoNumero = String.format("%06d", numero);

        return formatoNumero;

    }

    public boolean sendEmail(Usuario usuario) {

        boolean test = false;

        String toEmail = usuario.getEmail();
        String fromEmail = "msb.caixa@gmail.com";
        String password = "93345900";

        try {

            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "465");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "465");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            //la session
            Session ses = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message mes = new MimeMessage(ses);
            mes.setFrom(new InternetAddress(fromEmail));
            mes.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            mes.setSubject("User Email Verification");

            mes.setText("Registro correcto , Comprobar tu cuenta con este codigo : " + usuario.getCodigoVerificacion());

            //enviar email
            Transport.send(mes);
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

}
