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
import java.sql.DriverManager;
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
import javax.servlet.http.HttpSession;
import jdbc.JDBCUtility;

/**
 *
 * @author Caleb
 */
public class displayUser extends HttpServlet {
    private Connection con;
    
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
            HttpSession session = request.getSession();
            String email = (String)session.getAttribute("email");
            String name = request.getParameter("student_name");
            
            try{
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM public.user where email='"+email+"'");
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String password = rs.getString("password");
                String retrieve_name = rs.getString("name");         
                String age = rs.getString("age");
                String dob = rs.getString("birthdate");
                //String birthdate= DateFor.format(dob);
                String gender = rs.getString("gender");
                String address =rs.getString("address");
                String city = rs.getString("city");
                String poscode = rs.getString("poscode");
                String className = rs.getString("className");
                String course  = rs.getString("course");
                String notel = rs.getString("notel");
                String db_email = rs.getString("email");
                
               
                user.setId(id);
                user.setName(retrieve_name);
                user.setEmail(email);
                //user.setPassword()
                user.setAge(age);
                user.setBirthdate(dob);
                user.setGender(gender);
                user.setAddress(address);
                user.setCity(city);
                user.setPoscode(poscode);
                user.setClassName(className);
                user.setCourse(course);
                user.setNotel(notel); 
            }
            request.setAttribute("data", user); 

            RequestDispatcher rd =  request.getRequestDispatcher("/WEB-INF/view/edit_profile.jsp"); 
            
            rd.forward(request, response); 
            
        }
        
        catch(SQLException ex){
            System.out.println(ex);
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
