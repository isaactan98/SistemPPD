/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import classes.Customcode;
import classes.MailToken;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class verifyAccount extends HttpServlet {
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
        try (PrintWriter out = response.getWriter()) {
            String selector = request.getParameter("s");
            String token = request.getParameter("t");
            String errorMsg = "";  
            
            if(selector == null || token == null){
                response.sendRedirect("material");
            }
            else{
                try {
                    sql = "SELECT email, selector, token, expire FROM public.mailsession WHERE selector = ? LIMIT 1";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, selector);
                    rs = pst.executeQuery();
                    
                    if(rs.next()){
                        MailToken mt = new MailToken(rs.getString("email"), rs.getString("selector"), rs.getString("token"), rs.getString("expire"));
                        Customcode c = new Customcode();
                        token = c.HexadecimalToString(token);
                        
                        if(c.isTimeExpired(mt.getExpire())){
                            sql = "DELETE user, mailsession FROM public.user JOIN public.mailsession on (mailsession.email = user.email) WHERE user.email = ?";
                            pst = con.prepareStatement(sql);
                            pst.setString(1, mt.getEmail());
                            pst.executeUpdate();
                            
                            errorMsg = "Sesi pengaktifan akaun anda telah tamat! Sila mendaftar akaun semula.";
                            request.setAttribute("errorMsg", errorMsg);
                            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/confirmAccount.jsp");
                            rd.forward(request, response);
                        }
                        else if(!c.compare_sha1(token, mt.getToken())){
                            response.sendRedirect("login");
                        }
                        else{
                            sql = "UPDATE public.user SET verify = '1' WHERE email =?";
                            pst = con.prepareStatement(sql);
                            pst.setString(1, mt.getEmail());
                            pst.executeUpdate();
                            
                            sql = "DELETE FROM public.mailsession WHERE email = ?";
                            pst = con.prepareStatement(sql);
                            pst.setString(1, mt.getEmail());
                            pst.executeUpdate();
                            
                            errorMsg = "Akaun anda telah diaktifkan !";
                            request.setAttribute("errorMsg", errorMsg);
                            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/confirmAccount.jsp");
                            rd.forward(request, response);
                        }
                    }
                    else{
                        response.sendRedirect("material");
                    }
                } catch (Exception e) {
                    System.out.println(e.toString());
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
