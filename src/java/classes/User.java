package classes;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.regex.Pattern;

/**
 *
 * @author User
 */
public class User {
    private String id;
    private String name;
    private String email;
    private String password;
    private String confirmPassword;
    private String age;
    private String birthdate;
    private String gender;
    private String address;
    private String city;
    private String poscode;
    private String className;
    private String course;
    private String notel;
    private Boolean isError = false;
    private ArrayList<String> errorList = new ArrayList();
    
    
    public String getId(){
        return id;
    }
    
    public void setId(String id){
        this.id=id;
    }
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        if(name != null && !name.isEmpty() && name.length() <= 255){
            this.name = name;
        }
        else{
            this.isError = true;
            this.errorList.add("Nama tidah sah");
        }
    }
    
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        
        if(email != null && !email.isEmpty() && pattern.matcher(email).matches() && email.length()<=100){
            this.email = email.toLowerCase();
        }
        else{
            this.isError = true;
            this.errorList.add("E-mel tidah sah");
        }
    }

    /**
     * @return the age
     */
    public String getAge() {
        return age;
    }

    /**
     * @param age the age to set
     */
    public void setAge(String age) {
        if(age != null && !age.isEmpty() && age.matches("[0-9]+")){
            if(Integer.parseInt(age) <= 200)
                this.age = age;
            else
                this.isError = true;
        }
        else{
            this.isError = true;
            this.errorList.add("Umur tidah sah");
        }
    }

    /**
     * @return the birthdate
     */
    public String getBirthdate() {
        return birthdate;
    }

    /**
     * @param birthdate the birthdate to set
     */
    public void setBirthdate(String birthdate) {
        if(birthdate != null && !birthdate.isEmpty()){
           LocalDate bd = LocalDate.parse(birthdate); 
            LocalDate now = LocalDate.now();

            if(now.compareTo(bd) > 0){
                this.birthdate = birthdate;
            }
            else{
                this.isError = true;
                this.errorList.add("Tarikh lahir tidak boleh melebihi tarikh hari ini");
            } 
        }
        else{
            this.isError = true;
            this.errorList.add("Hari lahir tidah sah");
        }
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        if(gender != null && !gender.isEmpty() && (gender.equals("male") || gender.equals("female"))){
            this.gender = gender;
        }
        else{
            this.isError = true;
            this.errorList.add("Jantina tidah sah");
        }
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        if(address != null && !address.isEmpty() && address.length() <= 255){
            this.address = address.toUpperCase();
        }
        else{
            this.isError = true;
            this.errorList.add("Alamat rumah tidah sah");
        }
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        if(city != null && !city.isEmpty() && city.length() <= 50){
            this.city = city.toUpperCase();
        }
        else{
            this.isError = true;
            this.errorList.add("Daerah tidah sah");
        }
    }

    /**
     * @return the poscode
     */
    public String getPoscode() {
        return poscode;
    }

    /**
     * @param poscode the poscode to set
     */
    public void setPoscode(String poscode) {
        if(poscode != null && !poscode.isEmpty() && poscode.matches("[0-9]{5}")){
            this.poscode = poscode;
        }
        else{
            this.isError = true;
            this.errorList.add("Poskod tidah sah");
        }
    }

    /**
     * @return the className
     */
    public String getClassName() {
        return className;
    }

    /**
     * @param className the className to set
     */
    public void setClassName(String className) {
        if(className != null && !className.isEmpty() && className.length() <= 50){
            this.className = className.toUpperCase();
        }
        else{
            this.isError = true;
            this.errorList.add("Kelas tidah sah");
        }
    }

    /**
     * @return the course
     */
    public String getCourse() {
        return course;
    }

    /**
     * @param course the course to set
     */
    public void setCourse(String course) {
        if(course != null && !course.isEmpty()){
            String[] s = {"Sains Tulen","Akaun", "Kulinari", "Reka Cipta"};
            Boolean notFound = true;

            if(Arrays.asList(s).contains(course)){
                this.course = course;
            }
            else{
                this.isError = true;
                this.errorList.add("Aliran tidah sah");
            }
        }
    }

    /**
     * @return the notel
     */
    public String getNotel() {
        return notel;
    }

    /**
     * @param notel the notel to set
     */
    public void setNotel(String notel) {
        if(notel != null && !notel.isEmpty() && notel.matches("[0-9]{8,11}")){
            this.notel = notel;
        }
        else{
            this.isError = true;
            this.errorList.add("No Tel tidah sah");
        }
    }
    
    /**
     * @return the password (md5)
     */
    public String getPassword() {
        return password;
    }
    
    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        String result = "";
        
        if(password != null && !password.isEmpty()){
            Pattern Uppercase = Pattern.compile("[A-Z]");
            Pattern Lowercase = Pattern.compile("[a-z]");

            char e;
            int digit=0;
            for (int i = 0; i < password.length(); i++){
                e = password.charAt(i);
                if(Character.isDigit(e)){
                    digit++;
                }
            }

            if(digit >= 2 && Uppercase.matcher(password).find() && Lowercase.matcher(password).find() && password.length() >= 8){
                try {
                    MessageDigest md = MessageDigest.getInstance("MD5");
                    md.update(password.getBytes(), 0, password.length());
                    result = new BigInteger(1, md.digest()).toString(16);
                } catch (NoSuchAlgorithmException ex) {
                    System.out.println(ex.toString());
                }
                this.password = result;
            }
            else{
                this.isError = true;
                this.errorList.add("Kata laluan mesti mempunyai minimum 8 aksara, 2 nombor, 1 huruf besar dan 1 huruf kecil");
            }                    
        }
        else{
            this.isError = true;
            this.errorList.add("Kata laluan tidak sah");
        }
    }
    
    /**
     * @param password, confirmPassword the password to set
     */
    public void setPassword(String password, String confirmPassword) {
        String result = "";
        
        if(password != null && !password.isEmpty()){
            if(password.equals(confirmPassword)){
                Pattern Uppercase = Pattern.compile("[A-Z]");
                Pattern Lowercase = Pattern.compile("[a-z]");

                char e;
                int digit=0;
                for (int i = 0; i < password.length(); i++){
                    e = password.charAt(i);
                    if(Character.isDigit(e)){
                        digit++;
                    }
                }
                
                if(digit >= 2 && Uppercase.matcher(password).find() && Lowercase.matcher(password).find() && password.length() >= 8){
                    try {
                        MessageDigest md = MessageDigest.getInstance("MD5");
                        md.update(password.getBytes(), 0, password.length());
                        result = new BigInteger(1, md.digest()).toString(16);
                    } catch (NoSuchAlgorithmException ex) {
                        System.out.println(ex.toString());
                    }
                    this.password = result;
                }
                else{
                    this.isError = true;
                    this.errorList.add("Kata laluan mesti mempunyai minimum 8 aksara, 2 nombor, 1 huruf besar dan 1 huruf kecil");
                }                    
            }
            else{
                this.isError = true;
                this.errorList.add("Kata laluan tidak sama");
            }
        }
        else{
            this.isError = true;
            this.errorList.add("Kata laluan tidak sah");
        }
    }
    
    /**
     * @param password the password to set
     * @return the true if same
     */
    public Boolean compare_md5(String plaintext, String md5){
        Boolean result = false;
        try {
            // generate md5
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(plaintext.getBytes(), 0, plaintext.length());
            plaintext = new BigInteger(1, md.digest()).toString(16);
            
            if(plaintext.equals(md5)){
                result = true;
            }
            else{
                result = false;
            }
        } catch (NoSuchAlgorithmException ex) {
            System.out.println(ex.toString());
        }
        
        return result;
    }
    
    public Boolean getError(){
        return isError;
    }
    
    public ArrayList<String> getErrorMsg(){
        return errorList;
    }
}
