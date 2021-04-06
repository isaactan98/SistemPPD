package user;

import classes.Customcode;
import classes.Sendmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.JDBCUtility;
import javax.servlet.RequestDispatcher;
import classes.User;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;

public class register extends HttpServlet {
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
        
        ArrayList<String> errorList = new ArrayList();
        
        try (PrintWriter out = response.getWriter()) {
            // debug usage (get paramete)
//            Enumeration<String> params = request.getParameterNames(); 
//            while(params.hasMoreElements()){
//             String paramName = params.nextElement();
//             out.println(paramName+" : "+request.getParameter(paramName));
//            }

            if(request.getParameter("register") == null){
                request.setAttribute("data", errorList);
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/register.jsp");
                rd.forward(request, response);
            }
            else{
                String email = request.getParameter("email");
                String name = request.getParameter("student_name");
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("password1");
                String age = request.getParameter("student_age");
                String birth = request.getParameter("student_birthdate");
                String gender = request.getParameter("student_gender");
                String address = request.getParameter("student_address");
                String city = request.getParameter("student_daerah");
                String pos = request.getParameter("student_poskos");
                String clas = request.getParameter("student_class");
                String course = request.getParameter("student_stream");
                String notel = request.getParameter("student_tel");

                User user = new User();
                user.setName(name);
                user.setEmail(email);
                user.setPassword(password, confirmPassword);
                user.setAge(age);
                user.setBirthdate(birth);
                user.setGender(gender);
                user.setAddress(address);
                user.setCity(city);
                user.setPoscode(pos);
                user.setClassName(clas);
                user.setCourse(course);
                user.setNotel(notel);
                
                if(!user.getError()){
                    try {
                        sql = "SELECT email FROM public.user WHERE email = ?";
                        pst = con.prepareStatement(sql);
                        pst.setString(1, user.getEmail());
                        rs = pst.executeQuery();

                        if(rs.next()){
                            errorList.add("Email tersebut telah digunakan");
                            request.setAttribute("data", errorList);
                            RequestDispatcher rd =  request.getRequestDispatcher("WEB-INF/view/register.jsp"); 
                            rd.forward(request, response);
                        }
                        else{
                            Customcode custom = new Customcode();
                            // send email
                            Sendmail mail = new Sendmail();
                            String selector = custom.StringToHexadecimal(custom.sha1(mail.generateToken(8)));
                            String token = mail.generateToken(32);
                            mail.setSubject("Pendaftaran Akaun Berjaya");
                            String msg = "<p>Tahniah!</p>";
                            msg+= "<p>Akaun anda telah didaftarkan. Sila klik pautan di bawah untuk mengaktifkan akaun anda.</p>";
                            msg+= "<a href=\"https://sistemppd.herokuapp.com/verifyAccount?s="+selector+"&t="
                                    + custom.StringToHexadecimal(token) +"\">Pautan Pengaktifan</a>"
                                    + "<b><p>Sesi pengaktifan akaun akan ditutupkan selepas 15 minit.</p></b>";
                            mail.setMsg(msg);

                            if(!mail.sendmail(user.getEmail(), 2)){
                                out.println("Fungsi emel gagal!");
                            }
                            else{
                                // send user data to database
                                sql = "INSERT INTO public.user(email, password, name, age, birthdate, gender, address, city, poscode, \"className\", course, notel) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
                                PreparedStatement ps = con.prepareStatement (sql);
                                ps.setString (1, user.getEmail());
                                ps.setString (2, user.getPassword());
                                ps.setString (3, user.getName());
                                ps.setString (4, user.getAge());
                                ps.setString (5, user.getBirthdate());
                                ps.setString (6, user.getGender());
                                ps.setString (7, user.getAddress());
                                ps.setString (8, user.getCity());
                                ps.setString (9, user.getPoscode());
                                ps.setString (10, user.getClassName());
                                ps.setString (11, user.getCourse());
                                ps.setString (12, user.getNotel());
                                ps.executeUpdate();

                                // delete user mailsession before
                                sql = "DELETE FROM public.mailsession WHERE email = ?";
                                ps = con.prepareStatement(sql);
                                ps.setString(1, user.getEmail());
                                ps.executeUpdate();

                                // send user token to database for verification
                                int duration = 15;
                                sql = "INSERT INTO public.mailsession(email, selector, token, expire) VALUES(?,?,?,?)";
                                ps = con.prepareStatement(sql);
                                ps.setString (1, user.getEmail());
                                ps.setString (2, selector);
                                ps.setString (3, custom.sha1(token));
                                ps.setString (4, custom.setDuration(duration));
                                ps.executeUpdate();

                                request.setAttribute("email", user.getEmail());
                                request.setAttribute("duration", duration);
                                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/verifyAccount.jsp");
                                rd.forward(request, response);
                            }
                        }
                    } catch (Exception e) {
                        System.out.println(e.toString());
                    }
                }
                else{
                    errorList = user.getErrorMsg();
                    request.setAttribute("data", errorList);
                    RequestDispatcher rd =  request.getRequestDispatcher("WEB-INF/view/register.jsp"); 
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