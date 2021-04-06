package user;

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
import javax.servlet.http.HttpSession;
import jdbc.JDBCUtility;

/**
 *
 * @author User
 */
public class login extends HttpServlet {
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

        try (PrintWriter out = response.getWriter()) {
            if(request.getParameter("login") == null){
                request.setAttribute("errorMsg", errorMsg);
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/login.jsp");
                rd.forward(request, response);
            }
            else{
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String md5 = "";

                User user = new User();
                user.setEmail(email);
                user.setPassword(password);
                
                if(!user.getError()){
                    try {
                        sql = "SELECT email, name, password, gender, verify FROM public.user WHERE email = ?";
                        pst = con.prepareStatement(sql);
                        pst.setString(1, user.getEmail());
                        rs = pst.executeQuery();

                        if(rs.next()){
                            if(rs.getString("verify").equals("1")){
                                user.setEmail(rs.getString("email"));
                                user.setName(rs.getString("name"));
                                user.setGender(rs.getString("gender"));
                                md5 = (rs.getString("password"));

                                if(user.compare_md5(password, md5)){
                                    HttpSession session = request.getSession();
                                    session.setAttribute("email", user.getEmail());
                                    session.setAttribute("name", user.getName());
                                    session.setAttribute("gender", user.getGender());
                                    //setting session to expiry in 60 mins
                                    session.setMaxInactiveInterval(60*60);
                                    response.sendRedirect("material");
                                }
                                else{
                                    errorMsg = "Emel atau kata laluan tidak sah!";
                                    request.setAttribute("errorMsg", errorMsg);
                                    RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/login.jsp");
                                    rd.forward(request, response);
                                }
                            }
                            else{
                                errorMsg = "Akaun anda belum diaktifkan!";
                                request.setAttribute("errorMsg", errorMsg);
                                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/login.jsp");
                                rd.forward(request, response);
                            }
                        }
                        else{
                            errorMsg = "Emel atau kata laluan tidak sah!";
                            request.setAttribute("errorMsg", errorMsg);
                            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/login.jsp");
                            rd.forward(request, response);
                        }
                    } catch (Exception e) {
                        System.out.println(e.toString());
                    }
                }
                else{
                    errorMsg = "Emel atau kata laluan tidak sah!";
                    request.setAttribute("errorMsg", errorMsg);
                    RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/login.jsp");
                    rd.forward(request, response);
    //                        for(int i=0; i<user.getErrorMsg().size(); i++){
    //                           out.println(user.getErrorMsg().get(i).toString()+",");
    //                        }
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
