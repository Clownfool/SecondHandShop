/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Transport;

/**
 *
 * @author Admin
 */
public class Email {
    // Password: upsagcevjoharuub
    // Email: sfashionfornewworld@gmail.com
    public static void main(String[] args) {
        final String from = "sfashionfornewworld@gmail.com";
        final String password = "upsagcevjoharuub";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "smtp.gmail.com");
        props.put("mail.smtp.auth","true");
        props.put("mail.smtp.starttls.enable", "true");
        
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }  
        };
        Session session = Session.getInstance(props, auth);
        final String to = "choyvinhthien0209@gmail.com";
        
        
        MimeMessage msg = new MimeMessage(session);
        try {
            //kiểu nội dung
            msg.addHeader ("Content-type", "text/HTML; charset=UTF-8");
            //người gửi
            msg.setFrom(from);
            //người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            
            msg.setSubject("Verify Email Address for SFashion");
            msg.setSentDate(new Date());
            
            msg.setContent ("<!DOCTYPE html>\r\n"
                            + "<html>\r\n"
                            + "<body>\r\n"
                            + "\r\n"
                            + "<h1>Hey "+to+",</h1>\r\n"
                            + "<h2>Thanks for registering for an account on SFashion! Before we get started, we just need to confirm that this is you.</h2>\r\n"
                            + "<h2>Your Verification Code:</h2>\r\n"
                            + "\r\n"
                            +"<img src=\"https://www.creativefabrica.com/wp-content/uploads/2022/03/04/Fashion-logo-fashion-clothes-shop-Graphics-26436674-1-1-580x386.png\" alt=\"SFashion Logo\">"
                            +"</body>\r\n"
                            + "</html>", "text/html");
            
            Transport.send(msg);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
