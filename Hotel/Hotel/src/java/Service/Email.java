/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Duc Luong
 */
public class Email {
    public static void sendEmail(String to, String subject, String body) throws AddressException, MessagingException {
        final String username = "abclearneducation@gmail.com"; // Địa chỉ email của bạn
        final String password = "jtrrwlmnlafsxahp"; // Mật khẩu ứng dụng của bạn

        // Thiết lập các thuộc tính cho phiên gửi email
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Tạo phiên gửi email với xác thực
        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
          });

        try {
            // Tạo một thông điệp email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);

            // Gửi email
            Transport.send(message);

            System.out.println("Email đã được gửi thành công!");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
