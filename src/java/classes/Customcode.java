/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author User
 */
public class Customcode {
    /**
     * SHA1 encoding
     * @param input plaintext
     * @return SHA1 hash
     */
    public String sha1(String input){
        String hash = "";

        if(!input.isEmpty() || input != null){
            try {
                MessageDigest md = MessageDigest.getInstance("SHA1");
                md.update(input.getBytes(), 0, input.length());
                hash = new BigInteger(1, md.digest()).toString(16);
            } catch (NoSuchAlgorithmException e) {
                System.out.println(e.getMessage());
            }
        }
        return hash;
    }
    
    /**
     * Compare hash function (SHA1)
     * @param pw1 plaintext
     * @param pw2 hash
     * @return true if same
     */
    public boolean compare_sha1(String pw1, String pw2){
        Boolean result = false;
        try {
            // generate md5
            MessageDigest md = MessageDigest.getInstance("SHA1");
            md.update(pw1.getBytes(), 0, pw1.length());
            pw1 = new BigInteger(1, md.digest()).toString(16);
            
            if(pw1.equals(pw2)){
                result = true;
            }
            else{
                result = false;
            }
        } catch (NoSuchAlgorithmException ex) {
            System.out.println(ex.toString());
            System.exit(0);
        }
        
        return result;
    }
    
    /**
     * Convert hexadecimal to plaintext
     * @param hex Hexadecimal
     * @return plaintext
     */
    public String HexadecimalToString(String hex){
        String result = new String();
        char[] charArray = hex.toCharArray();
        for(int i = 0; i < charArray.length; i=i+2) {
           String st = ""+charArray[i]+""+charArray[i+1];
           char ch = (char)Integer.parseInt(st, 16);
           result = result + ch;
        }
        return result;
    }
    
    /**
     * Convert plaintext to hexadecimal
     * @param str plaintext
     * @return hexadecimal
     */
    public String StringToHexadecimal(String str){
        StringBuilder sb = new StringBuilder();
        //Converting string to character array
        char ch[] = str.toCharArray();
        for(int i = 0; i < ch.length; i++) {
           String hexString = Integer.toHexString(ch[i]);
           sb.append(hexString);
        }
        return sb.toString();
    }
    
    /**
     * Set expired time (minutes)
     * @param minutes 
     * @return expire time (LocalDateTime format)
     */
    public String setDuration(int minutes){
        LocalDateTime expire = LocalDateTime.now().plusMinutes(minutes);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formatDateTime = expire.format(formatter);
        return formatDateTime;
    }
    
    /**
     * check is token expired
     * @param time  expiration time (LocalDateTime)
     * @return true if expired
     */
    public boolean isTimeExpired(String time){
        boolean isExpired = false;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime expire = LocalDateTime.parse(time, formatter);

        if(LocalDateTime.now().isAfter(expire)){
            isExpired = true;
        }
        return isExpired;
    }
}
