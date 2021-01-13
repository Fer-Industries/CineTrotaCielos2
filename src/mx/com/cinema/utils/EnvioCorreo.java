package mx.com.cinema.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class EnvioCorreo {
	
	private static final String SERVIDOR_SMTP = "smtp.outlook.com";
    private static final int PORTA_SERVIDOR_SMTP = 587;
    private static final String CONTA_PADRAO = "fer_industries15@hotmail.com"; 
    private static final String SENHA_CONTA_PADRAO = "Cinema.15";

    private final String from = "fer_industries15@hotmail.com"; 

    public boolean sendEmail(String to, int idVenta) {
    	boolean enviado = false;
        final Session session = Session.getInstance(this.getEmailProperties(), new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(CONTA_PADRAO, SENHA_CONTA_PADRAO);
            }

        });
        String subject = "Ticket venta dulceria";
        String messageContent = "Buen día \n"+
        "Gracias por su compra en la dulcería virtual por favor presente este ticket al recoger sus productos: " + idVenta +"\n"+
        "Este ticket es confidencial, si lo llega a compartir recuerde que tiene que presentar la tarjeta con la que se realizo la compra.";
        try {
            final Message message = new MimeMessage(session);
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setFrom(new InternetAddress(from));
            message.setSubject(subject);
            message.setText(messageContent);
            //message.setSentDate(new Date());
            Transport.send(message);
            enviado = true;
        } catch (final MessagingException ex) {
           System.out.println(" "+ex);
        }
        return enviado;
    }

    public Properties getEmailProperties() {
        final Properties config = new Properties();
        config.put("mail.smtp.auth", "true");
        config.put("mail.smtp.starttls.enable", "true");
        config.put("mail.smtp.host", SERVIDOR_SMTP);
        config.put("mail.smtp.port", PORTA_SERVIDOR_SMTP);
        return config; 
    }

    /*public static void main(String [] args) {
        new EnvioCorreo().sendEmail("ferdelgadillo97@gmail.com",12);
    }*/

}