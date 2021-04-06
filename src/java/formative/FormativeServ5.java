/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formative;

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
import javax.servlet.http.HttpSession;
import jdbc.JDBCUtility;

/**
 *
 * @author iztan
 */
public class FormativeServ5 extends HttpServlet {

    private Connection con;
    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private ResultSet rs1 = null;
    private ResultSet rs2 = null;
    private String sql;
    private JDBCUtility jdbcUtility = new JDBCUtility();

    public void init() throws ServletException {
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

        HttpSession ss = request.getSession();
        String email = (String) ss.getAttribute("email");

        try (PrintWriter out = response.getWriter()) {

            String q1 = request.getParameter("question1");
            String q2 = request.getParameter("question2");
            String q3 = request.getParameter("question3");

            String msg1 = "", msg2 = "", msg3 = "", msg4 = "", msg5 = "";
            int score = 0, high_score = 0;

            if (q1.equals("d")) {
                msg1 = "<p style = 'color:green'>Your Answer is Correct</p>";
                score++;
            } else {
                msg1 = "<p style = 'color:red'>Your Answer is Incorrect</p>";
            }

            if (q2.equals("a")) {
                msg2 = "<p style = 'color:green'>Your Answer is Correct</p>";
                score++;
            } else {
                msg2 = "<p style = 'color:red'>Your Answer is Incorrect</p>";
            }

            if (q3.equals("c")) {
                msg3 = "<p style = 'color:green'>Your Answer is Correct</p>";
                score++;
            } else {
                msg3 = "<p style = 'color:red'>Your Answer is Incorrect</p>";
            }

            String marks = String.valueOf(score);
            String markah = "", show = "", reattempt = "";
            if (score < 3) {
                markah = "noFull";
            } else {
                markah = "full";
                show = "none";
                reattempt = "none";
            }

            int attempt = 0, s_score = 0;

            try {
                sql = "Select * from public.user where email=?";
                pst = con.prepareStatement(sql);
                pst.setString(1, email);
                rs1 = pst.executeQuery();

                if (rs1.next()) {
                    int user_id = rs1.getInt("id");

                    sql = "SELECT * FROM public.formative_q where stud_id=? and \"Qid\" =? order by \"ID\" DESC";
                    pst = con.prepareStatement(sql);
                    pst.setInt(1, user_id);
                    pst.setInt(2, 5);
                    rs = pst.executeQuery();

                    if (rs.next()) {
                        attempt = rs.getInt("s_attempt");
                        s_score = rs.getInt("s_score");
                        int id = rs.getInt("ID");

                        //reattempt 
                        if (s_score == 3 && attempt < 3) {
                            show = "none";
                            reattempt = "none";
                            msg1 = "<p style = 'color:green'>D. kerahsiaan</p>";
                            msg2 = "<p style = 'color:green'>A. I dan III</p>";
                            msg3 = "<p style = 'color:green'>C. II dan IV</p>";
                        } else if (attempt >= 3) {
                            msg1 = "D. kerahsiaan";
                            msg2 = "A. I dan III";
                            msg3 = "C. II dan IV";
                            show = "none";
                            reattempt = "none";
                        } else if (attempt < 3) {
                            show = "none";
                            reattempt = "";
                        }

                        //check score
                        if (rs.getInt("s_score") < score) {
                            high_score = score;
                        } else {
                            high_score = score;
                        }

                        sql = "UPDATE public.formative_q SET stud_id=?, \"Qid\"=?, \"Q_num\"=?, \"Q_ans\"=?, s_attempt=?, s_score=? where \"ID\"=?";
                        pst = con.prepareStatement(sql);
                        pst.setInt(1, user_id);
                        pst.setInt(2, 5);
                        pst.setInt(3, 3);
                        pst.setString(4, markah);
                        pst.setInt(5, attempt + 1);
                        pst.setInt(6, high_score);
                        pst.setInt(7, id);
                        pst.executeUpdate();
                    } else {
                        sql = "INSERT INTO public.formative_q (stud_id, \"Qid\", \"Q_num\", \"Q_ans\", s_attempt, s_score) "
                                + "VALUES ("+user_id+","+5+","+3+",'"+markah+"','1',"+score+")";
                        pst = con.prepareStatement(sql);
                        pst.executeUpdate();
                    }

                } else {
                }

            } catch (Exception e) {
                out.println(e);
            }

            request.setAttribute("msg1", msg1);
            request.setAttribute("msg2", msg2);
            request.setAttribute("msg3", msg3);
            request.setAttribute("score", marks);
            request.setAttribute("s_attempt", attempt);
            request.setAttribute("show", show);
            request.setAttribute("reattempt", reattempt);

            response.sendRedirect("viewFA?v=5");

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
