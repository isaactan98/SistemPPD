/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;
import java.util.ArrayList;
/**
 *
 * @author Caleb
 */
public class assessment {
    private String true_answer;
   private String get_answer;
   private String name;
   private String id;
   private boolean result;
   
   public assessment(){
    
    }
   
   public assessment(String get_answer, String true_answer, String name, String id){
       this.get_answer = get_answer;
       this.true_answer = true_answer;
       this.name = name;
       this.id = id;
       if(this.true_answer.equals(this.get_answer)){
           result = true;
       }
       else{
           result = false;
       }
   }
   
public String getId(){
       return id;
   }
   
   public String getName(){
       return name;
   }
   
   public String getUserAnswer(){
       return get_answer;
   }
   
   public String getCorrectAnswer(){
       return true_answer;
   }
   
   public boolean getResult(){
       return result;
   }
  
}

