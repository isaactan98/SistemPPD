/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author User
 */
public class MailToken {
    private String email;
    private String selector;
    private String token;
    private String expire;

    public MailToken() {}
    /**
     * Parameterized constructor
     * @param email 
     * @param selector  
     * @param token 
     * @param expire 
     */
    public MailToken(String email, String selector, String token, String expire) {
        this.email = email;
        this.selector = selector;
        this.token = token;
        this.expire = expire;
    }
    
    public String getEmail(){
        return email;
    }
    
    public String getSelector(){
        return selector;
    }
    
    public String getToken(){
        return token;
    }
    
    public String getExpire(){
        return expire;
    }
}
