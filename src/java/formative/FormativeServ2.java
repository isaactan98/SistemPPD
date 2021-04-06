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
public class FormativeServ2 extends HttpServlet {

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
            String q4 = request.getParameter("question4");
            String q5 = request.getParameter("question5");

            String msg1 = "", msg2 = "", msg3 = "", msg4 = "", msg5 = "";
            int score = 0, high_score = 0;

            if (q1.equals("d")) {
                msg1 = "<p style = 'color:green'>Your Answer is Correct</p>";
                score++;
            } else {
                msg1 = "<p style = 'color:red'>Your Answer is Incorrect</p>";
            }

            if (q2.equals("c")) {
                msg2 = "<p style = 'color:green'>Your Answer is Correct</p>";
                score++;
            } else {
                msg2 = "<p style = 'color:red'>Your Answer is Incorrect</p>";
            }

            if (q3.equals("a")) {
                msg3 = "<p style = 'color:green'>Your Answer is Correct</p>";
                score++;
            } else {
                msg3 = "<p style = 'color:red'>Your Answer is Incorrect</p>";
            }

            if (q4.equals("c")) {
                msg4 = "<p style = 'color:green'>Your Answer is Correct</p>";
                score++;
            } else {
                msg4 = "<p style = 'color:red'>Your Answer is Incorrect</p>";
            }

            if (q5.equals("c")) {
                msg5 = "<p style = 'color:green'>Your Answer is Correct</p>";
                score++;
            } else {
                msg5 = "<p style = 'color:red'>Your Answer is Incorrect</p>";
            }
            String marks = String.valueOf(score);
            String markah = "", show = "", reattempt = "";
            if (score < 5) {
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
                    pst.setInt(2, 2);
                    rs = pst.executeQuery();

                    if (rs.next()) {
                        attempt = rs.getInt("s_attempt");
                        s_score = rs.getInt("s_score");
                        int id = rs.getInt("ID");

                        //reattempt 
                        if (s_score == 5 && attempt < 3) {
                            show = "none";
                            reattempt = "none";
                            msg1 = "<p style = 'color:green'>D. II, III dan IV</p>";
                            msg2 = "<p style = 'color:green'>C. I, II dan III</p>";
                            msg3 = "<p style = 'color:green'>A. Proses penukaran teks biasa kepada teks sifer dengan menggunakan algoritma dan kunci penyulitan</p>";
                            msg4 = "<p style = 'color:green'>C. Proses penukaran teks sifer kepada teks biasa dengan menggunakan algoritma dan kunci penyulitan</p>";
                            msg5 = "<p style = 'color:green'>C. III -> I -> II </p>";
                        } else if (attempt >= 3) {
                            msg1 = "D. II, III dan IV";
                            msg2 = "C. I, II dan III";
                            msg3 = "A. Proses penukaran teks biasa kepada teks sifer dengan menggunakan algoritma dan kunci penyulitan";
                            msg4 = "C. Proses penukaran teks sifer kepada teks biasa dengan menggunakan algoritma dan kunci penyulitan";
                            msg5 = "C. III -> I -> II ";
                            show = "none";
                            reattempt = "none";
                        } else if (attempt < 3) {
                            show = "none";
                            reattempt = "";
                        }

                        sql = "UPDATE public.formative_q SET stud_id=?, \"Qid\"=?, \"Q_num\"=?, \"Q_ans\"=?, s_attempt=?, s_score=? where \"ID\"=?";
                        pst = con.prepareStatement(sql);
                        pst.setInt(1, user_id);
                        pst.setInt(2, 2);
                        pst.setInt(3, 5);
                        pst.setString(4, markah);
                        pst.setInt(5, attempt + 1);
                        pst.setInt(6, score);
                        pst.setInt(7, id);
                        pst.executeUpdate();
                    } else {
                        sql = "INSERT INTO public.formative_q (stud_id, \"Qid\", \"Q_num\", \"Q_ans\", s_attempt, s_score) "
                                + "VALUES ("+user_id+","+2+","+5+",'"+markah+"','1',"+score+")";
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
            request.setAttribute("msg4", msg4);
            request.setAttribute("msg5", msg5);
            request.setAttribute("score", marks);
            request.setAttribute("s_attempt", attempt);
            request.setAttribute("show", show);
            request.setAttribute("reattempt", reattempt);

            response.sendRedirect("viewFA?v=2");
            
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
