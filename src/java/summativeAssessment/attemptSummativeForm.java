/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package summativeAssessment;

import classes.assessment;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class attemptSummativeForm extends HttpServlet {
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
            /* TODO output your page here. You may use following sample code. */            
            RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/view/header-summative.jsp");  
            rd.include(request, response);   
            if(email != null)
            {
             out.println("<div class=\"center\"><div class=\"detail\"><div class=\"table-responsive\"><table class=\"table\"><thead> <tr>\n" +
"<th scope=\"col\" class=\"border-0 bg-light\">Soalan</th>\n" +
"                            <th scope=\"col\" class=\"border-0 bg-light\">Cubaan</th>\n" +
"                            <th scope=\"col\" class=\"border-0 bg-light\">Markah</th>\n" +
"                        </tr><thead>\n" +
"                        <tbody style=\"background-color: white;\"><tr>\n" +
"                            <td>Bab 2 Perwakilan Data</td>\n");
            
            
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
                            if(rs.getInt("attempt")==3 || rs.getInt("count_correct")==5){
                                out.println("<td>"+rs.getInt("attempt")+"/3</td><td>"+rs.getInt("count_correct")+"/5</td>");
                                out.println("</tr></tbody></table></div><div class='container-fluid'>");
                                out.println("<input type=\"submit\" value='Ulang Kaji' onclick=\"location.href='"+request.getContextPath()+"/displaySummative'\">");
                            }
                            else{
                                out.println("<td>"+rs.getInt("attempt")+"/3</td><td>"+rs.getInt("count_correct")+"/5</td>");
                                out.println("</tr></tbody></table></div><div class='container-fluid'>");
                                out.println("<input type=\"submit\" value='Mencuba Sekarang' onclick=\"location.href='"+request.getContextPath()+"/displaySummative'\">");                      
                            }                   
                    
                }
                else{
                    out.println("<td>0/3</td><td>0/5</td>");
                    out.println("</tr></tbody></table></div><div class='container-fluid' style=\"text-align:center;\">");
                    out.println("<input type=\"submit\" value='Mencuba Sekarang' onclick=\"location.href='"+request.getContextPath()+"/displaySummative'\">");
                }
                    
                }
                else{
                    System.out.println("no id in user db");
                }     
            }                         
            catch(SQLException ex){
                System.out.println(ex);
            }
            
            out.println("</div></div></div>"); 
            }
            
            RequestDispatcher rd2=request.getRequestDispatcher("WEB-INF/view/footer-summative.jsp");  
            rd2.include(request, response); 
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
