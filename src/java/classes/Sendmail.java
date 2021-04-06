package classes;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author User
 */
public class Sendmail {
    private String toMail;
    private String subject;
    private String msg;
    private static final String FROM_MAIL = "testmailfunction001@gmail.com";
    private static final String PWD = "testmail123";
    
    public void setSubject(String subject){
        this.subject = subject;
    }
    
    public void setMsg(String msg){
        this.msg = msg;
    }
    
    /**
     * 
     * @param email receiver email
     * @param mode 1=plain text, 2=html
     * @return isSend true = success
     */
    public boolean sendmail(String email, int mode){
//        this.toMail = email;  // uncomment it when finish
        this.toMail = email; // all email will be sent to this email
        boolean isSend = false;
        
        if(!email.isEmpty() || email != null || (mode == 1 || mode == 2)){
           try{
                Properties pr = new Properties();
                pr.setProperty("mail.smtp.host", "smtp.gmail.com");
                pr.setProperty("mail.smtp.port", "587");
                pr.setProperty("mail.smtp.auth", "true");
                pr.setProperty("mail.smtp.starttls.enable", "true");
                pr.put("mail.smtp.ssl.trust", "smtp.gmail.com");

                //get session to authenticate the host email address and password
                Session session = Session.getInstance(pr, new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(FROM_MAIL, PWD);
                    }
                });
                
                Message mess = null;
                if(mode==1)
                    mess = plainMail(session);
                if(mode==2)
                    mess = htmlMail(session);
                
                //send the message
                Transport.send(mess);
                
                isSend=true;
            }catch(Exception ex){
                ex.printStackTrace();
            } 
        }
        return isSend;
    }
    
    // plain text email
    private Message plainMail(Session session){
        try {
            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(FROM_MAIL));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
            mess.setSubject(subject);
            mess.setText(msg);
            return mess;
        }catch (Exception ex) {
            Logger.getLogger(Sendmail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    // html email
    private Message htmlMail(Session session){
        try {
            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(FROM_MAIL));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
            mess.setSubject(subject);
            mess.setContent(msg, "text/html");
            return mess;
        }catch (Exception ex) {
            Logger.getLogger(Sendmail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    /**
     * 
     * @param size min/max = 1/100, size of 8 will be used if out of range
     * @return random string
     */
    public String generateToken(int size){
        if(size<1 || size>100)
            size = 8;
        
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz"; 
  
        // create StringBuffer size of AlphaNumericString 
        StringBuilder sb = new StringBuilder(size); 
  
        for (int i = 0; i < size; i++) { 
  
            // generate a random number between 
            // 0 to AlphaNumericString variable length 
            int index 
                = (int)(AlphaNumericString.length() 
                        * Math.random()); 
  
            // add Character one by one in end of sb 
            sb.append(AlphaNumericString 
                          .charAt(index)); 
        } 
  
        return sb.toString(); 
    }
}
