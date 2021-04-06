/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import classes.Customcode;
import classes.Sendmail;
import classes.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.JDBCUtility;

/**
 *
 * @author User
 */
public class requestReset extends HttpServlet {
    private JDBCUtility jdbcUtility = new JDBCUtility();
    private Connection con;
    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private String sql;
    
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
        String errorMsg = "";
        String email_attribute = "";
        Integer duration_attribute = 0;

        try (PrintWriter out = response.getWriter()) {
            if(request.getParameter("submit") == null){
                request.setAttribute("errorMsg", errorMsg);
                request.setAttribute("email", email_attribute);
                request.setAttribute("duration", duration_attribute);
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/requestReset.jsp");
                rd.forward(request, response);
            }
            else{
                String email = request.getParameter("email");
                User user = new User();
                user.setEmail(email);
                
                if(!user.getError()){
                    try {
                        sql = "SELECT email FROM public.user WHERE email = ? and verify ='1'";
                        pst = con.prepareStatement(sql);
                        pst.setString(1, user.getEmail());
                        rs = pst.executeQuery();

                        if(rs.next()){
                            Customcode custom = new Customcode();
                            // send email
                            Sendmail mail = new Sendmail();
                            String selector = custom.StringToHexadecimal(custom.sha1(mail.generateToken(8)));
                            String token = mail.generateToken(32);
                            mail.setSubject("Terlupa kata laluan");
                            String msg = "<p>Terlupa kata laluan anda?</p>";
                            msg+= "<p>Sila klik pautan di bawah untuk menetapkan semula kata laluan anda.</p>";
                            msg+= "<a href=\"https://sistemppd.herokuapp.com/resetPwd?s="+selector+"&t="
                                    + custom.StringToHexadecimal(token) +"\">Menetapkan semula</a>"
                                    + "<b><p>Sila menetapkan kata laluan anda dalam 15 minit.</p></b>";
                            mail.setMsg(msg);

                            if(!mail.sendmail(user.getEmail(), 2)){
                                errorMsg = "Fungsi emel gagal!";
                                request.setAttribute("errorMsg", errorMsg);
                                request.setAttribute("email", email_attribute);
                                request.setAttribute("duration", duration_attribute);
                                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/requestReset.jsp");
                                rd.forward(request, response);
                            }
                            else{
                                // delete user mailsession before
                                sql = "DELETE FROM public.mailsession WHERE email = ?";
                                pst = con.prepareStatement(sql);
                                pst.setString(1, user.getEmail());
                                pst.executeUpdate();

                                // send user token to database for verification
                                int duration = 15;
                                sql = "INSERT INTO public.mailsession(email, selector, token, expire) VALUES(?,?,?,?)";
                                pst = con.prepareStatement(sql);
                                pst.setString (1, user.getEmail());
                                pst.setString (2, selector);
                                pst.setString (3, custom.sha1(token));
                                pst.setString (4, custom.setDuration(duration));
                                pst.executeUpdate();
                                
                                request.setAttribute("errorMsg", errorMsg);
                                request.setAttribute("email", user.getEmail());
                                request.setAttribute("duration", duration);
                                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/requestReset.jsp");
                                rd.forward(request, response);
                            }
                        }
                        else{
                            errorMsg = "Email tidak sah!";
                            request.setAttribute("errorMsg", errorMsg);
                            request.setAttribute("email", email_attribute);
                            request.setAttribute("duration", duration_attribute);
                            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/requestReset.jsp");
                            rd.forward(request, response);
                        }
                    } catch (Exception e) {
                        System.out.println(e.toString());
                    }
                }
                else{
                    errorMsg = "Email tidak sah!";
                    request.setAttribute("errorMsg", errorMsg);
                    request.setAttribute("email", email_attribute);
                    request.setAttribute("duration", duration_attribute);
                    RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/requestReset.jsp");
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
