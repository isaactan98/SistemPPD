<%-- 
    Document   : summativeAssessment
    Created on : Nov 25, 2020, 8:47:02 PM
    Author     : Caleb
--%>

<%@page import="classes.assessment"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Penilaian Sumatif - SistemPPD</title>
    <link rel="icon" href="/css/logo.png">

    <!-- Custom fonts for this template-->
    <link
      href="/vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet" />
    <link href="/css/style.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  </head>
  <style>
      .summative{
          background-color: #ffffff;
      }
      input[type=radio]{
          box-shadow:none;
      }
      input[type="submit"]{
        font-size: 15px;
        padding: 15px;
        width: 8%;
      }
  </style>
  <body id="page-top">
    <body id="page-top">
      <!-- Page Wrapper -->
      <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
          <!-- Main Content -->
          <div id="content">
            <!-- Topbar -->
            <jsp:include page="navbar.jsp"></jsp:include>
            <!-- End of Topbar -->
    
    <div class="container-fluid">    
        <div class="col-12">
            <div class="summative mb-4">
                <div class="card-header">
                    <h1>Penilaian Sumatif</h1>
                </div>
            <div class="card-body">
                
            <form action="doSummative" method="post">          
            <div>
            <strong>1) Antara kaedah sifer yang berikut, yang manakah tidak menggunakan kunci?</strong><br>
            <input type="hidden" id="question1" name="q1" value="q1">
            <input type="radio" id="question1_1" name="question1" value="A" required><label for="question1_1">A. Reverse cipher</label><br>
            <input type="radio" id="question1_2" name="question1" value="B"><label for="question1_2">B. Caesar Cipher</label><br>
            <input type="radio" id="question1_3" name="question1" value="C"><label for="question1_3">C. Columnar cipher</label><br>
            <input type="radio" id="question1_4" name="question1" value="D"><label for="question1_4">D. Pigpen Cipher</label><br>
            </div>
            <div id="q1"></div>

            <br>
            <div>
            <strong>2) Apakah yang dimaksudkan dengan transposition cipher?</strong><br>
            <input type="hidden" id="question2" name="q2" value="q2">
            <input type="radio" id="question2_1" name="question2" value="A" required><label for="question2_1">A. Kaedah sifer yang menggantikan huruf-huruf dalam teks biasa dengan huruf-huruf yang lain menjadi teks sifer</label><br>
            <input type="radio" id="question2_2" name="question2" value="B"><label for="question2_2">B. Kaedah sifer yang mengubah kedudukan huruf-huruf dalam teks biasa untuk menghasilkan teks sifer</label><br>
            <input type="radio" id="question2_3" name="question2" value="C"><label for="question2_3">C. Kaedah sifer yang menterbalikkan huruf-huruf dalam teks biasa menjadi teks sifer</label><br>
            <input type="radio" id="question2_4" name="question2" value="D"><label for="question2_4">D. Kaedah sifer yang menggunakan jadual dengan mengisi huruf-huruf teks biasa ke dalam jadual secara menegak</label><br>
            </div>
            <div id="q2"></div>

            <br>
            <div>
            <strong>3) Apakah teks sifer yang terhasil apabila perkataan "MERDEKA" disulitkan menggunakan Caesar Cipher dengan kunci, K = 3?</strong><br>
            <input type="hidden" id="question3" name="q3" value="q3">
            <input type="radio" id="question3_1" name="question3" value="A" required><label for="question3_1">A. PGUGHND</label><br>
            <input type="radio" id="question3_2" name="question3" value="B"><label for="question3_2">B. PHUGHND</label><br>
            <input type="radio"  id="question3_3" name="question3" value="C"><label for="question3_3">C. PFUFHND</label><br>
            <input type="radio" id="question3_4" name="question3" value="D"><label for="question3_4">D. PFUGHND</label><br>
            </div>
            <div id="q3"></div>

            <br>
            <div>
            <strong>4) Apakah yang dimaksudkan dengan kerahsiaan data dalam aspek kriptografi?</strong><br>
            <input type="hidden" id="question4" name="q4" value="q4">
            <input type="radio" id="question4_1" name="question4" value="A" required><label for="question4_1">A. Penjagaan daripada perubahan data secara tidak sah</label><br>
            <input type="radio" id="question4_2" name="question4" value="B"><label for="question4_2">B. Menjaga sesuatu maklumat daripada dibaca oleh pihak lain tanpa kebenaran</label><br>
            <input type="radio" id="question4_3" name="question4" value="C"><label for="question4_3">C. Pengenalan secara kesatuan sistem dan informasi itu sendiri</label><br>
            <input type="radio" id="question4_4" name="question4" value="D"><label for="question4_4">D. Usaha untuk mencegah terjadinya perubahan terhadap suatu informasi yang dihantar</label><br>
            </div>
            <div id="q4"></div>
            
            <br>
            <div>
            <strong>5) Apakah kunci bagi Caesar Cipher jika abjad pertama bermula dengan abjad F?</strong><br>
            <input type="hidden" id="question5" name="q5" value="q5">
            <input type="radio" id="question5_1" name="question5" value="A" required><label for="question5_1">A. 7</label><br>
            <input type="radio" id="question5_2" name="question5" value="B"><label for="question5_2">B. 6</label><br>
            <input type="radio" id="question5_3" name="question5" value="C"><label for="question5_3">C. 5</label><br>
            <input type="radio" id="question5_4" name="question5" value="D"><label for="question5_4">D. 4</label><br>
            </div>
            <div id="q5"></div>

            <br>
            <% String list = (String) request.getAttribute("status");
        if(list != null){
            out.println("</form><input type=\"submit\" value='Balik' onclick=\"location.href='"+request.getContextPath()+"/attemptSummativeForm'\">");
          
                    }
        else{
            out.println("<input type=\"submit\" name=\"submitButton\" class=\"summativeButton\" value=\"Hantar\"></input></form>");
        }
                    %>
             
        
        
            </div>
            </div>
        </div>
    </div>
        <div id="A"></div>
        <div id="B"></div>
        <div id="C"></div>
        <div id="D"></div>
           
        <script type="text/javascript">
             
        $(document).ready(function () {
           var wrong_ids = <%= (ArrayList) request.getAttribute("wrongidList")%>;
           var list = <%= (ArrayList)request.getAttribute("answerList")%>;
           var correct_ids = <%= (ArrayList)request.getAttribute("correctidList")%>;
           var answerdbList = <%= (ArrayList)request.getAttribute("answerdbList")%>;
           var answernameList = <%= (ArrayList)request.getAttribute("answernameList")%>;

            for(var i=0; i<wrong_ids.length;i++){
                $(wrong_ids[i]).html("Jawapan betul ialah :"+list[i].id);       
                $(wrong_ids[i]).css("color","#721c24");
                $(wrong_ids[i]).css("background-color","#f8d7da");
                $(wrong_ids[i]).css("padding",".75rem 1.25rem");
            }
            
            for(var i=0; i<correct_ids.length; i++){
                $(correct_ids[i]).html("Jawapan betul"); 
                $(correct_ids[i]).css("color","#155724");
                $(correct_ids[i]).css("background-color","#d4edda");
                $(correct_ids[i]).css("padding",".75rem 1.25rem");
            }
            
            for(var i=0; i<answernameList.length; i++){
                $("input[name="+answernameList[i].id+"][value="+answerdbList[i].id+"]").attr("checked", true);
                $("input[name="+answernameList[i].id+"]:not(:checked)").attr('disabled', true);
            }

});
        </script>
              <!-- Bootstrap core JavaScript-->
      <script src="/vendor/jquery/jquery.min.js"></script>
      <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
      <!-- Core plugin JavaScript-->
      <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
  
      <!-- Custom scripts for all pages-->
      <script src="/js/sb-admin-2.min.js"></script>
  
      <!-- Page level plugins -->
      <script src="/vendor/chart.js/Chart.min.js"></script>
  
      <!-- Page level custom scripts -->
      <script src="/js/demo/chart-area-demo.js"></script>
      <script src="/js/demo/chart-pie-demo.js"></script>
    </body>
</html>