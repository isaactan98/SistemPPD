/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package summativeAssessment;

import classes.assessment;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
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
public class doSummative extends HttpServlet {
     private Connection con;
    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private ResultSet rs1 = null;
    private ResultSet rs2 = null;
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("email");
        try (PrintWriter out = response.getWriter()) {
            String status;
            String answers1 = request.getParameter("question1");
            String answers2 = request.getParameter("question2");
            String answers3 = request.getParameter("question3");
            String answers4 = request.getParameter("question4");
            String answers5 = request.getParameter("question5");
                    
            ArrayList<String> correctidList = new ArrayList();
            
            assessment[] question = {
                        new assessment(answers1,"A","question1","q1"),
                        new assessment(answers2,"B","question2","q2"),
                        new assessment(answers3,"B","question3","q3"),
                        new assessment(answers4,"B","question4","q4"),
                        new assessment(answers5,"C","question5","q5")
                    };
            
                for(int i=0; i<question.length;i++){
                    if(question[i].getResult()){
                        String id = question[i].getId();
                        correctidList.add(id);  
                    }
                }
                
                int count_correct = correctidList.size();
                
            try{
                sql = "SELECT id FROM public.user where email=?";
                pst = con.prepareStatement(sql);
                pst.setString (1, email);
                rs1 = pst.executeQuery();
                
                if(rs1.next()){
                    int user_id = rs1.getInt("id");
                    
                    sql = "SELECT * FROM public.summative_question where user_fk=? order by id DESC";
                    pst = con.prepareStatement(sql);
                    pst.setInt (1, user_id);
                    rs = pst.executeQuery();
                    if(rs.next()){
                        int attempt = rs.getInt("attempt");
                        int id = rs.getInt("id");
                        sql = "UPDATE public.summative_question SET user_fk=?, question1=?, question2=?, question3=?, question4=?, question5=?, count_correct=?, attempt=? where id=?";
                        pst = con.prepareStatement(sql);
                        pst.setInt (1, user_id);
                        pst.setString (2, answers1);
                        pst.setString (3, answers2);
                        pst.setString (4, answers3);
                        pst.setString (5, answers4);
                        pst.setString (6, answers5);
                        pst.setInt (7, count_correct);
                        pst.setInt (8, attempt+1);
                        pst.setInt (9, id);
                        pst.executeUpdate();
                    }
                    else{
                    sql = "INSERT INTO public.summative_question (user_fk, question1, question2, question3, question4, question5, count_correct, attempt) VALUES (?,?,?,?,?,?,?,?)";
                    pst = con.prepareStatement(sql);
                    pst.setInt (1, user_id);
                    pst.setString (2, answers1);
                    pst.setString (3, answers2);
                    pst.setString (4, answers3);
                    pst.setString (5, answers4);
                    pst.setString (6, answers5);
                    pst.setInt (7, count_correct);
                    pst.setInt (8, 1);
                    pst.executeUpdate();
                    }
                    
                            
                }
            else{
                    
                    }
        }
        catch(SQLException ex){
            System.out.println(ex);
        }

            response.sendRedirect(request.getContextPath()+"/attemptSummativeForm");
            
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
