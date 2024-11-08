package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.math.BigInteger;
import java.time.Instant;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.Scanner;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Grey
 */
public class validation {

    public static String inputString() {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            String result = scanner.nextLine();
            result = result.replaceAll("\\s\\s+", " ").trim();
            if (!result.isEmpty()) {
                return result;
            } else {
                System.out.println("Please enter a string");
                System.out.println("Enter again");
            }
        }
    }
    
    public static int inputInteger() {
        while (true) {
            String inputString = inputString();
            try {
                int result = Integer.parseInt(inputString);
                    return result;
            } catch (Exception e) {
                System.out.println("Please enter a integer number");
                System.out.println("Enter again");
            }
        }
    }

    public static int inputIntegerPositive() {
        while (true) {
            String inputString = inputString();
            try {
                int result = Integer.parseInt(inputString);
                if (result > 0) {
                    return result;
                } else {
                    System.out.println("Please enter a positive integer number");
                    System.out.println("Enter again");
                }
            } catch (Exception e) {
                System.out.println("Please enter a integer number");
                System.out.println("Enter again");
            }
        }
    }
    public static BigInteger inputBigInteger() {
        while (true) {
            String inputString = inputString();
            try {
                BigInteger result = new BigInteger(inputString);
                    return result;
            } catch (Exception e) {
                System.out.println("Please enter a integer number");
                System.out.println("Enter again");
            }
        }
    }

    public static int inputLimit(int min, int max) {
        while (true) {
            int result = inputInteger();
            if (result >= min && result <= max) {
                return result;
            } else {
                System.out.println("Please enter a number in the range " + min + "," + max);
            }
        }
    }

    public static boolean inputYN() {
        System.out.println("Do you want to continue?(Y/N)");
        while (true) {
            String inputString = inputString();
            if (inputString.equalsIgnoreCase("Y")) {
                return true;
            } else if (inputString.equalsIgnoreCase("N")) {
                return false;
            } else {
                System.out.println("Please enter Y/y or N/n!");
            }
        }
    }
    
    public static float inputFloat() {
        while (true) {
            String String = inputString();
            try {
                float result = Float.parseFloat(String);
                    return result;
            } catch (Exception e) {
                System.out.println("Please enter a number");
                System.out.println("Enter again");
            }

        }
    }

    public static float inputFloatPositive() {
        while (true) {
            String String = inputString();
            try {
                float result = Float.parseFloat(String);
                if (result > 0) {
                    return result;
                }
                System.out.println("Please enter a Positive number");
            } catch (Exception e) {
                System.out.println("Please enter a number");
                System.out.println("Enter again");
            }

        }
    }
    
    public static long inputLong() {
        while (true) {
            String String = inputString();
            try {
                long result = Long.parseLong(String);
                    return result;
            } catch (Exception e) {
                System.out.println("Please enter a number");
                System.out.println("Enter again");
            }

        }
    }

    public static long inputLongPositive() {
        while (true) {
            String String = inputString();
            try {
                long result = Long.parseLong(String);
                if (result > 0) {
                    return result;
                }
                System.out.println("Please enter a Positive number");
            } catch (Exception e) {
                System.out.println("Please enter a number");
                System.out.println("Enter again");
            }

        }
    }
    
    public static Double inputDouble() {
        while (true) {
            String String = inputString();
            try {
                Double result = Double.parseDouble(String);
                    return result;
            } catch (Exception e) {
                System.out.println("Please enter a number");
                System.out.println("Enter again");
            }

        }
    }

    public static Double inputDoublePositive() {
        while (true) {
            String String = inputString();
            try {
                Double result = Double.parseDouble(String);
                if (result > 0) {
                    return result;
                }
                System.out.println("Please enter a Positive number");
            } catch (Exception e) {
                System.out.println("Please enter a number");
                System.out.println("Enter again");
            }

        }
    }
    
    public static boolean hasNextLine(){
        Scanner scanner = new Scanner(System.in);
        return scanner.hasNextLine();
    }
    public static String getTrim() {
        Scanner scanner = new Scanner(System.in);
        return scanner.nextLine().trim();
    }
    
    public static String normalizeName(String name) {
        String[] words = name.trim().replaceAll("\\s+", " ").split(" ");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < words.length; i++) {
            sb.append(Character.toUpperCase(words[i].charAt(0)));
            sb.append(words[i].substring(1).toLowerCase());
            if (i < words.length - 1) {
                sb.append(" ");
            }
        }
        return sb.toString();
    }
    public static boolean isUsernameValid(String username) {
        // Check the length of the username
        if (username.length() < 5 || username.length() > 20) {
            return false; // Username length should be between 5 and 20 characters.
        }

        // Check if the username contains only alphanumeric characters
        if (!username.matches("^[a-zA-Z0-9]*$")) {
            return false; // Username should only contain alphanumeric characters.
        }
        
        if (Character.isDigit(username.charAt(0))) {
            return false; // Username should not start with a digit.
        }

        // Additional checks can be added if needed

        return true; // Username is valid.
    }
    
    public static boolean isPhoneNumberValid(String phoneNumber) {
        // Check if the phone number consists of numbers only
        if (!phoneNumber.matches("[0-9]+")) {
            return false;
        }

        // Check if the phone number has exactly 10 characters
        return phoneNumber.length() == 10;
    }
    public static void sendEmail(String to, String subject, String content){
        

        
        final String from = "haiphamjavadev@gmail.com";
        final String password = "mlnl gclz wfuy qeov";
        Properties props = new Properties();
        props.put("mail.smtp.timeout", "10000");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth","true");
        props.put("mail.smtp.starttls.enable", "true");
        
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }  
        };
        Session session = Session.getInstance(props, auth);
        
        
        MimeMessage msg = new MimeMessage(session);
        try {
            //kiểu nội dung
            msg.addHeader ("Content-type", "text/HTML; charset=UTF-8");
            //người gửi
            msg.setFrom(from);
            //người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            
            msg.setContent ("<!DOCTYPE html>\r\n"
                            + "<html>\r\n"
                            + "<body>\r\n"
                            + "\r\n"
                            + "<h1>Hey "+to+",</h1>\r\n"
                            + content
                            + "\r\n"
                            +"<img src=\"https://www.creativefabrica.com/wp-content/uploads/2022/03/04/Fashion-logo-fashion-clothes-shop-Graphics-26436674-1-1-580x386.png\" alt=\"SFashion Logo\">"
                            +"</body>\r\n"
                            + "</html>", "text/html");
            
            Transport.send(msg);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static String randomCode(int codeLength){
        String characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
        // Create a StringBuilder to store the generated code
        StringBuilder codeBuilder = new StringBuilder();

        // Create an instance of Random class
        Random random = new Random();

        // Generate the random verification code
        for (int i = 0; i < codeLength; i++) {
            // Get a random index from the characters string
            int randomIndex = random.nextInt(characters.length());

            // Append the character at the random index to the codeBuilder
            codeBuilder.append(characters.charAt(randomIndex));
        }

        // Convert the codeBuilder to a string and return the verification code
        return codeBuilder.toString();
    }
    static long expiryTime = Instant.now().plusSeconds(180).toEpochMilli();
    public static boolean isCodeExpired() {
        long currentTime = Instant.now().toEpochMilli();
        return currentTime > expiryTime;
    }
}
