/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import classes.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.JDBCUtility;

/**
 *
 * @author Caleb
 */
public class updateUser extends HttpServlet {
    private Connection con;
    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private String sql;
    private JDBCUtility jdbcUtility = new JDBCUtility();

    
    public void init() throws ServletException
    {
        con = jdbcUtility.db1_connect();
    }  

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = new User();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String id =  request.getParameter("student_id");
            String name = request.getParameter("student_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("password1");
            String age = request.getParameter("student_age");
            String birthdate = request.getParameter("student_birthdate");
            String gender = request.getParameter("student_gender");
            String address = request.getParameter("student_address");
            String city = request.getParameter("student_daerah");
            String poscode = request.getParameter("student_poskos");
            String className = request.getParameter("student_class");
            String course = request.getParameter("student_stream");
            String notel = request.getParameter("student_tel");
            ArrayList<String> errorList = new ArrayList();
            user.setEmail(email);
            user.setName(name);                    
            user.setAge(age);
            user.setBirthdate(birthdate);
            user.setGender(gender);
            user.setAddress(address);
            user.setCity(city);
            user.setPoscode(poscode);
            user.setClassName(className);
            user.setCourse(course);
            user.setNotel(notel);
            
            if(password.equals("") && confirmPassword.equals("")){  
                if(!user.getError()){
                    try{
                        sql = "SELECT password FROM public.user where email=?";
                        pst = con.prepareStatement(sql);
                        pst.setString(1, user.getEmail());
                        rs = pst.executeQuery();                     
                            while (rs.next()) {
                                String db_password = rs.getString("password");
                                sql = "UPDATE public.user SET name=?,password=?, age=?, birthdate=?, gender=?, address=?, city=?, poscode=?, \"className\"='"+className+"', course=?, notel=? where email=?";
                                pst = con.prepareStatement (sql);
                                pst.setString(1, name); 
                                pst.setString(2, db_password); 
                                pst.setString(3, age);
                                pst.setString(4, birthdate); 
                                pst.setString(5, gender); 
                                pst.setString(6, address); 
                                pst.setString(7, city); 
                                pst.setString(8, poscode); 
                                pst.setString(9, course); 
                                pst.setString(10, notel); 
                                pst.setString(11, email); 
                                pst.executeUpdate();
                                request.setAttribute("update_msg", "Berjaya Kemas Kini");
                                request.getSession().setAttribute("name", name);
                                RequestDispatcher rd =  request.getRequestDispatcher("/displayUser"); 
                                rd.forward(request, response);
                            }  
                       
                    }                         
                    catch(SQLException ex){
                        System.out.println(ex);
                    }             
            }
            else{
                errorList = user.getErrorMsg();
                request.setAttribute("errordata", errorList);
                RequestDispatcher rd =  request.getRequestDispatcher("/displayUser"); 
                rd.forward(request, response);
            }
        }
        else{
            user.setPassword(password, confirmPassword);
                if(!user.getError()){
                    try{
                        sql = "SELECT password FROM public.user where email=?";
                        pst = con.prepareStatement(sql);
                        pst.setString(1, user.getEmail());
                        rs = pst.executeQuery();  
                    while (rs.next()) {                       
                        sql = "UPDATE public.user SET name=?,password=?, age=?, birthdate=?, gender=?, address=?, city=?, poscode=?, className=?, course=?, notel=? where email=?";
                        pst = con.prepareStatement (sql);
                        pst.setString(1, name); 
                        pst.setString(2, user.getPassword()); 
                        pst.setString(3, age);
                        pst.setString(4, birthdate); 
                        pst.setString(5, gender); 
                        pst.setString(6, address); 
                        pst.setString(7, city); 
                        pst.setString(8, poscode); 
                        pst.setString(9, className); 
                        pst.setString(10, course); 
                        pst.setString(11, notel); 
                        pst.setString(12, email); 
                        pst.executeUpdate();
                        request.setAttribute("update_msg", "Berjaya Kemas Kini");
                        RequestDispatcher rd =  request.getRequestDispatcher("/displayUser"); 
                        rd.forward(request, response);
                    }                        
                }                  

                    catch(SQLException ex){
                        System.out.println(ex);
                    }        
            }
            else{
                errorList = user.getErrorMsg();
                request.setAttribute("errordata", errorList);
                RequestDispatcher rd =  request.getRequestDispatcher("/displayUser"); 
                rd.forward(request, response);
                }
            }           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
