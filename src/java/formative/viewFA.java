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
public class viewFA extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            RequestDispatcher head = request.getRequestDispatcher("WEB-INF/view/header-summative.jsp");
            head.include(request, response);

            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            boolean loggedIn = session != null && session.getAttribute("email") != null;

            request.setAttribute("loggedIn", loggedIn);

            String msg1 = "", msg2 = "", msg3 = "", msg4 = "", msg5 = "", show = "Ambil Kuiz", reattempt, markah = "";
            int score = 0, high_score = 0, attempt = 0, s_score = 0;

            int view = Integer.parseInt(request.getParameter("v"));

            String layout = "<div class='center'>";
            String midlayout = "<div class='detail'>"
                    + "<table class='table col-lg-12 bg-light'>"
                    + "<thead><tr><th>Soalan</th><th>Cubaan</th><th>Markah</th></tr></thead>";
            String endlayout = "</div></div>";

            String location = "'/attemptFA?v='";

            try {
                sql = "Select * from public.user where email=?";
                pst = con.prepareStatement(sql);
                pst.setString(1, email);
                rs1 = pst.executeQuery();

                if (rs1.next()) {
                    int userID = rs1.getInt("id");
                    sql = "SELECT * FROM public.formative_q where stud_id=? and \"Qid\" =? order by \"ID\" DESC";
                    pst = con.prepareStatement(sql);
                    pst.setInt(1, userID);
                    pst.setInt(2, view);
                    rs = pst.executeQuery();

                    if (rs.next()) {
                        attempt = rs.getInt("s_attempt");
                        s_score = rs.getInt("s_score");
                        int id = rs.getInt("ID");

                        //reattempt 
                        if (view == 5 || view == 6) {
                            if (s_score == 3 && attempt < 3) {
                                show = "Ulang Kaji";
                            } else if (attempt > 3) {
                                show = "Ulang Kaji";
                            }
                        } else if (s_score == 5 && attempt < 3) {
                            show = "Ulang Kaji";
                        } else if (attempt >= 3) {
                            show = "Ulang Kaji";
                        } else if (attempt < 3) {
                            show = "Ambil Kuiz";
                        } else {
                            show = "Ambil Kuiz";
                        }

                    }
                }
            } catch (Exception e) {
                out.println(e);
            }

            if (view == 1) {

                out.println(layout + midlayout);
                out.println("<tbody style=\"background-color: white;\">");
                out.println("<tr><td>Penilaian 2.1.1</td><td>" + attempt + "/3</td><td>" + s_score + "/5</td></tr>");
                out.println("</tbody></table>");
                out.println("<div class=\"container-fluid\"><input type=\"submit\" value='" + show + "' onclick=\"location.href='" + request.getContextPath() + "/attemptFA?v=" + view + "'\"></div>");
                out.println(endlayout);

//                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/f.a.2-1-1.jsp");
//                rd.forward(request, response);
            } else if (view == 2) {

                out.println(layout + midlayout);
                out.println("<tbody style=\"background-color: white;\">");
                out.println("<tr><td>Penilaian 2.1.2</td><td>" + attempt + "/3</td><td>" + s_score + "/5</td></tr>");
                out.println("</tbody></table>");
                out.println("<div class=\"container-fluid\"><input type=\"submit\" value='" + show + "' onclick=\"location.href='" + request.getContextPath() + "/attemptFA?v=" + view + "'\"></div>");
                out.println(endlayout);

//                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/f.a.2-1-2.jsp");
//                rd.forward(request, response);
            } else if (view == 3) {
                out.println(layout + midlayout);
                out.println("<tbody style=\"background-color: white;\">");
                out.println("<tr><td>Penilaian 2.1.3</td><td>" + attempt + "/3</td><td>" + s_score + "/5</td></tr>");
                out.println("</tbody></table>");
                out.println("<div class=\"container-fluid\"><input type=\"submit\" value='" + show + "' onclick=\"location.href='" + request.getContextPath() + "/attemptFA?v=" + view + "'\"></div>");
                out.println(endlayout);

//                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/f.a.2-1-3.jsp");
//                rd.forward(request, response);
            } else if (view == 4) {
                out.println(layout + midlayout);
                out.println("<tbody style=\"background-color: white;\">");
                out.println("<tr><td>Penilaian 2.1.4</td><td>" + attempt + "/3</td><td>" + s_score + "/5</td></tr>");
                out.println("</tbody></table>");
                out.println("<div class=\"container-fluid\"><input type=\"submit\" value='" + show + "' onclick=\"location.href='" + request.getContextPath() + "/attemptFA?v=" + view + "'\"></div>");
                out.println(endlayout);

//                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/f.a.2-1-4.jsp");
//                rd.forward(request, response);
            } else if (view == 5) {
                out.println(layout + midlayout);
                out.println("<tbody style=\"background-color: white;\">");
                out.println("<tr><td>Penilaian 2.1.5</td><td>" + attempt + "/3</td><td>" + s_score + "/3</td></tr>");
                out.println("</tbody></table>");
                out.println("<div class=\"container-fluid\"><input type=\"submit\" value='" + show + "' onclick=\"location.href='" + request.getContextPath() + "/attemptFA?v=" + view + "'\"></div>");
                out.println(endlayout);

//                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/f.a.2-1-5.jsp");
//                rd.forward(request, response);
            } else if (view == 6) {
                out.println(layout + midlayout);
                out.println("<tbody style=\"background-color: white;\">");
                out.println("<tr><td>Penilaian 2.1.6</td><td>" + attempt + "/3</td><td>" + s_score + "/3</td></tr>");
                out.println("</tbody></table>");
                out.println("<div class=\"container-fluid\"><input type=\"submit\" value='" + show + "' onclick=\"location.href='" + request.getContextPath() + "/attemptFA?v=" + view + "'\"></div>");
                out.println(endlayout);

//                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/f.a.2-1-6.jsp");
//                rd.forward(request, response);
            } else {
            }

            RequestDispatcher foot = request.getRequestDispatcher("WEB-INF/view/footer-summative.jsp");
            foot.include(request, response);
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
