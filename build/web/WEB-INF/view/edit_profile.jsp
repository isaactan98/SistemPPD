<%-- Document : edit_profile Created on : Nov 16, 2020, 9:43:51 PM Author :
Caleb --%> <%@page import="java.util.Enumeration"%> <%@page
import="java.util.ArrayList"%> <%@page import="classes.User"%> <% User user =
(User)request.getAttribute("data"); %> <%@page contentType="text/html"
pageEncoding="UTF-8"%>

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

    <title>Profil - Sistem PPD</title>
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
    <link href="/css/customCSS.css" rel="stylesheet" type="text/css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  </head>
  <style>
      .form-check-input{
          box-shadow:none;
      }
      input[type="submit"],input[type="button"]{
        font-size: 12px;
        padding: 10px;
        width: 162px;
        box-shadow: none !important;
      }
      .detail{
          margin-bottom: 20px;
      }
      input[type="button"]{
          background-color: #7386d5;
          box-shadow: -5px -5px 20px #fff, 5px 5px 20px #babecc;
          transition: all 0.2s ease-in-out;
          color: #ebecf0;
      }

</style>
      

  <body id="page-top">
    <body id="page-top">
      <!-- Page Wrapper -->
      <div id="wrapper">
        <!-- Sidebar -->
        <jsp:include page="sidebar.jsp"></jsp:include>
        <!-- End of Sidebar -->
  
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
          <!-- Main Content -->
          <div id="content">
            <!-- Topbar -->
            <jsp:include page="navbar.jsp"></jsp:include>
            <!-- End of Topbar -->
  
            <!-- Begin Page Content -->
            <div class="container-fluid">
              <!-- Page Heading -->
              <div
                class="d-sm-flex align-items-center justify-content-between mb-4"
              >
                <h1 class="h3 mb-0 text-gray-800">Kemas Kini Profil</h1>
              </div>
  
              
                <!-- Earnings (Monthly) Card Example -->
            
                  <div class="detail">
                      <%
                        String update_msg = (String) request.getAttribute("update_msg");                      
                                if(update_msg != null){
                                    out.println("<div class=\"alert alert-success w-100 mb-3 alert-dismissible fade show\" role=\"alert\">" +
                                             "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                             "<span aria-hidden=\"true\">&times;</span>" +
                                             "</button>"
                                             );
                                     out.println("Berjaya Kemas Kini");
                                     out.println("</div>");

                               }
                        
                        Enumeration<String> params = request.getAttributeNames(); 
                        while(params.hasMoreElements()){
                            String paramName = params.nextElement();                    
                            if(paramName.equals("errordata")){                       
                               ArrayList<String> list = (ArrayList)request.getAttribute("errordata");
                               out.println("<div class=\"alert alert-danger w-100 mb-3 alert-dismissible fade show\" role=\"alert\">" +
                                             "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                             "<span aria-hidden=\"true\">&times;</span>" +
                                             "</button>"
                                             );
                               out.println("<ol class=\"pl-2 mb-0\">");
                                 for(int i=0; i<list.size(); i++){
                                    out.println("<li>" + list.get(i).toString() + "</li>");
                                }
                                out.println("</ol>");
                                out.println("</div>");
                            }
                        }
                        
 
                        
                    %>
                    <div class="col-md-12">
                    <form id="displayForm" action="updateUser" method="POST">
                        <input type="hidden" name="student_id" value="<%=user.getId()%>">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h5>Emel:</h5>
                                <input class="w-100" type="email" name="email" placeholder="Alamat emel" value="<%=user.getEmail()%>" required/>
                            </div>
                            <div class="col-md-6 mb-3">
                                <h5>Nama:</h5>
                                <input class="w-100" type="text" name="student_name" placeholder="Nama Pelajar" value="<%=user.getName()%>" required/>
                            </div>
                        </div>
                    
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h5>Masukkan Kata Laluan:</h5>
                                <input class="w-100" type="password" id="password" name="password" placeholder="Kata laluan"/>
                                <span class="input-error" id="password_alert"></span>
                            </div>
                            <div class="col-md-6 mb-3">
                                <h5>Sahkan Kata Laluan:</h5>
                                <input class="w-100" type="password" id="password1" name="password1" placeholder="Sahkan kata laluan"/>
                                <span class="input-error" id="password1_alert"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h5>Tarikh Lahir:</h5>
                                <input class="w-100" type="date" id="birthday" name="student_birthdate" value="<%=user.getBirthdate()%>" required />
                                <span class="input-error" id="dob_alert"></span>
                            </div>
                            <div class="col-md-6 mb-3">
                                <h5>Umur:</h5>
                                <input class="w-100" type="text" id="age" name="student_age" laceholder="Umur Pelajar" value="<%=user.getAge()%>" readonly />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <h5 id="gender" class="<%=user.getGender()%>">Jantina:</h5>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" value="male" name="student_gender" id="male" />
                                    <label class="form-check-label" for="male">Lelaki</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" value="female" name="student_gender" id="female" />
                                    <label class="form-check-label" for="female">Perempuan</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <h5>Alamat Rumah:</h5>
                                <input class="w-100" type="text" name="student_address" placeholder="Tempat Tinggal" value="<%=user.getAddress()%>" required />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h5>Daerah:</h5>
                                <input class="w-100" type="text" name="student_daerah" placeholder="Daerah" value="<%=user.getCity()%>" required />
                            </div>
                            <div class="col-md-6 mb-3">
                                <h5>Poskod:</h5>
                                <input class="w-100" type="text" id="poskod" name="student_poskos" placeholder="Poskod" value="<%=user.getPoscode()%>" required />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h5>Kelas:</h5>
                                <input class="w-100" type="text" name="student_class" placeholder="Kelas" value="<%=user.getClassName()%>" required/>
                            </div>
                            <div class="col-md-6 mb-3">
                                <h5>Aliran:</h5>
                                <select class="w-100 <%=user.getCourse()%>" name="student_stream" id="course">
                                    <option id="w-100 Sains Tulen" value="Sains Tulen">Sains Tulen</option>
                                    <option id="w-100 Akaun" value="Akaun">Akaun</option>
                                    <option id="w-100 Kulinari" value="Kulinari">Kulinari</option>
                                    <option id="w-100 Reka Cipta" value="Reka Cipta">Reka Cipta</option>
                                </select>
                            </div>
                        </div>
                    
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <h5>No Tel:</h5>
                                <input class="w-100" type="tel" name="student_tel" id="hpn" placeholder="No Telefon" pattern="[0-9]{8,11}" value="<%=user.getNotel()%>">
                            </div>
                        </div>
                       
                        <div class="form-group" style="display:flex;">
                            <input type="button" value="Kemas Kini" onClick="Edit()" id="updatebutton">
                            <input type="submit" value="Menyimpan" id="savebutton" style="display:none;">
                            <input type="button" value="Membatal" id="cancelbutton" onclick="location.href='displayUser';" class="bg-danger" style="display:none;">
                        </div>
                        
                            
                    </form>
                    </div>
                            
                    <div class="col-md-12">
                        <form action="/userDeleteServlet" method="post">
                             <div class="form-group">
                                 <input type="hidden" value="<%=user.getEmail()%>">
                                 <input class="bg-danger" type="submit" value="Nyahaktifkan Akaun" onclick="return confirm('Adakah anda pasti?')" >
                             </div>
                         </form>
                    </div>
                  </div>

            </div>
            <!-- /.container-fluid -->
          </div>
          <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
      </div>
      <!-- End of Page Wrapper -->
  
      <!-- Scroll to Top Button-->
      <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
      </a>
  
      <!-- Logout Modal-->
      <div
        class="modal fade"
        id="logoutModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
              <button
                class="close"
                type="button"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
              Select "Logout" below if you are ready to end your current session.
            </div>
            <div class="modal-footer">
              <button
                class="btn btn-secondary"
                type="button"
                data-dismiss="modal"
              >
                Cancel
              </button>
              <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
          </div>
        </div>
      </div>
  
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
    
    <script>
      $(document).ready(function () {

          var gender = $("#gender").attr('class');
          $("#"+gender).attr("checked", true);
         //document.getElementById(gender).checked=true;
        
         var course= $("#course").attr('class');
         document.getElementById(course).selected=true;
          
         disable_input();

      });

      function disable_input() {
        $("#displayForm input").attr("disabled", true);
          $("#displayForm input[type=submit]").attr("disabled", false);
          $("#displayForm input[type=button]").attr("disabled", false);
          $("#displayForm input[type=hidden]").attr("disabled", false);      
        $("select").attr("disabled", true);
      }

      function Edit() {
          $("#displayForm input").prop("disabled", false);
        $("input[type=text]").attr("disabled", false);
        $("input[name=email]").attr("readonly", true);
        $("input[type=radio]").attr("disabled", false);
        $("input[type=password]").attr("disabled", false);
        $("select").attr("disabled", false);
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0;
        document.getElementById("cancelbutton").style.display = "block";
        document.getElementById("savebutton").style.display = "block";
        document.getElementById("updatebutton").style.display = "none";
      }

      function CancelEdit() {
        document.documentElement.scrollTop = 0;
        document.getElementById("cancelbutton").style.display = "none";
        document.getElementById("savebutton").style.display = "none";
        document.getElementById("updatebutton").style.display = "block";
        disable_input();
      }
      
      function calculateAgeFromDOB(selector){
            var field = $(selector);
            var today = new Date();
            var birthDate = new Date(field.val());
            var result = "";

            var age = today.getFullYear() - birthDate.getFullYear();
            var m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }

            if(age > 0)
                return age;
            else
                return result; 
        }
        
        $(document).on("change", "#birthday", function(){
            var age = calculateAgeFromDOB("#birthday");
            var alert = $("#dob_alert");
            
            if(calculateAgeFromDOB("#birthday") != ""){
                $("#age").val(age);
                alert.css("display","none");
                alert.text("");
            }
            else{
                $("#age").val("");
                alert.css("display","block");
                alert.text("Tarikh lahir tidak sah");
            }
        });
        
        // password validation
        function isValidPassword(selector){
            var field = $(selector);
            var pw = field.val();
            var isValid = true;
            
            if(pw.length < 8 || !pw.match(/[A-Z]/) || !pw.match(/[a-z]/) || !pw.match(/\d{2,}/)){
                isValid = false;
            }
            return isValid;
        }
        
        $(document).on("input", "#password", function(){
            var alert = $("#password_alert");
            var pw = $(this).val();
           
            if(!isValidPassword("#password")){
                alert.css("display","block");
                alert.text("Kata laluan mesti mempunyai minimum 8 aksara, 2 nombor, 1 huruf besar dan 1 huruf kecil");
            }
            else{
                alert.css("display","none");
                alert.text("");
            }
           
            if(pw == ""){
                $("#password1_alert").css("display","none");
                $("#password1_alert").text("");
                $("#password1").val("");
            }
        });
        
        // password equal
        function isPasswordSame(selector_pw1, selector_pw){
            var field = $(selector_pw1);
            var field1 = $(selector_pw);
            var pw1= field.val();
            var pw = field1.val();
            var isSame = true;
            
            if(pw1 != pw && pw1 != "" && pw != ""){
               isSame = false;
           }
           return isSame;
        }
        
        $(document).on("input", "#password1", function(){
           var alert = $("#password1_alert");

           if(!isPasswordSame("#password1", "#password")){
               alert.css("display","block");
               alert.text("Kata laluan tidak sama");
           }
           else{
               alert.css("display","none");
               alert.text("");
           }
        });
        
        //  check is number or not
        function checkNumber(selector,indexChar){
            var field= $(selector);
            var num= field.val();

            if(indexChar >= 0){
                var char= parseInt(num.charAt(indexChar));

                if(Number.isInteger(char) == false){
                    var final= num.substring(0, indexChar);
                    field.val(final);
                }
            }
        }
        
        // check poskod number or not
        $(document).on("input", "#poskod", function(e){
            var indexChar= e.target.selectionStart -1;
            checkNumber("#poskod", indexChar);
        });
        
        // check hpn number or not
        $(document).on("input", "#hpn", function(e){
            var indexChar= e.target.selectionStart -1;
            checkNumber("#hpn", indexChar);
        });
        
        // register button clicked
        $(document).on("click", "#register", function(e){
            if(calculateAgeFromDOB("#birthday") == "" || !isPasswordSame("#password1", "#password") 
                    || !isPasswordSame("#password1", "#password")){
                e.preventDefault();
            }
        });
    </script>
  </body>
</html>
