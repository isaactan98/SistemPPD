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
public class displaySummative extends HttpServlet {
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
            String status = request.getParameter("status");
            if(status == null){
               status = "fail";
            }
            ArrayList<String> answerList = new ArrayList();
            ArrayList<String> wrongidList = new ArrayList();
            ArrayList<String> correctidList = new ArrayList();
            ArrayList<String> answernameList = new ArrayList();
            ArrayList<String> answerdbList = new ArrayList();
                    
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
                            assessment[] question = {
                            new assessment(rs.getString("question1"),"A","question1","q1"),
                            new assessment(rs.getString("question2"),"B","question2","q2"),
                            new assessment(rs.getString("question3"),"B","question3","q3"),
                            new assessment(rs.getString("question4"),"B","question4","q4"), 
                            new assessment(rs.getString("question5"),"C","question5","q5")
                        };
            
                    for(int i=0; i<question.length;i++){
                        if(question[i].getResult()){

                            String id = question[i].getId();
                            correctidList.add(id);  
                        }
                        else{                                 
                            String[] question_name = {"question1","question2","question3","question4","question5"};
                            for(int x=0; x<question_name.length; x++){
                                if(question_name[x].equals(question[i].getName())){                                                                      
                                    String wrong_id = question[x].getId();
                                    wrongidList.add(wrong_id);                       

                                    String msg = question[i].getCorrectAnswer();
                                    answerList.add(msg);

                                }
                            }
                        }
                        answernameList.add(question[i].getName());
                        answerdbList.add(question[i].getUserAnswer());
                     
                    }
            
                    request.setAttribute("answerdbList",answerdbList); 
                    request.setAttribute("answernameList",answernameList);
                    request.setAttribute("correctidList",correctidList);
                    request.setAttribute("wrongidList",wrongidList);
                    request.setAttribute("answerList",answerList);
                    request.setAttribute("status","pass");
                    RequestDispatcher rd =  request.getRequestDispatcher("/WEB-INF/view/summativeAssessment.jsp"); 
                    rd.forward(request, response);    
                    }
                    else{
                        RequestDispatcher rd2=request.getRequestDispatcher("WEB-INF/view/summativeAssessment.jsp");  
                        rd2.forward(request, response);               
                    }        
                    
                }
                else{
                    RequestDispatcher rd3=request.getRequestDispatcher("WEB-INF/view/summativeAssessment.jsp");  
                    rd3.forward(request, response);          
                }
                    
                }
                else{
                    System.out.println("no id in user db");
                }     
                
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
