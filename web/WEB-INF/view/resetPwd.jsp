<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menetap Semula Kata Laluan - SistemPPD</title>  
        <link rel="icon" href="/css/logo.png">
        <!-- Icons font CSS-->
        <link href="/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
        <link href="/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <!-- Font special for pages-->
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <!-- Bootstrap core CSS -->
        <link href="/css/bootstrap.min.css" rel="stylesheet" />
        <link href="/css/customCSS.css" rel="stylesheet" type="text/css"/>
        
        <script src="/vendor/jquery/jquery.min.js"></script>
    </head>
    <body style="background-color: #e6e6e6">
        <%
        String errorMsg = (String) request.getAttribute("errorMsg");
        String selector = (String) request.getAttribute("s");
        String token = (String) request.getAttribute("t");
        %>
        
        <div class="card" style="width: 54rem; margin-left: auto; margin-right: auto; margin-top: 180px;">
            <div class="card-body">
                <%
                if(!selector.isEmpty()){
                    out.println("<h2 class=\"card-title\">Sila menetapkan kata laluan baru untuk akaun anda.</h2><br>"+
                            "<form action=\"resetPwd\" method=\"post\">" +
                            "<input type=\"hidden\" name=\"s\" class=\"form-control\" value="+selector+">"+
                            "<input type=\"hidden\" name=\"t\" class=\"form-control\" value="+token+">"+
                            "<label>Kata Laluan</label><br>"+
                            "<input type=\"password\" name=\"pwd1\" class=\"form-control\" id=\"password\" placeholder=\"Kata laluan\" required>"+
                            "<span class=\"input-error\" id=\"password_alert\"></span><br>"+
                            "<label>Sahkan Kata Laluan</label>"+
                            "<input type=\"password\" name=\"pwd2\" class=\"form-control\" id=\"password1\" placeholder=\"Sahkan kata laluan\" required>"+
                            "<span class=\"input-error\" id=\"password1_alert\"></span><br><br>"+
                            "<input type=\"submit\" name=\"submit\" id=\"resetpwd\" class=\"btn btn-secondary\" value=\"Hantar\">"+
                            "</form>"
                    );
                }  

                if(!errorMsg.isEmpty()){                   
                    out.println("<h2 class=\"card-title\">"+errorMsg+"</h2><br>");
                    
                    if(errorMsg.equals("Kata laluan akaun anda telah dikemas kini.")){
                        out.println("<a href=\"login\" class=\"btn btn-secondary\">Log Masuk</a>");
                    }
                }
                %>
            </div>
        </div>
        
        <script>
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

            // register button clicked
            $(document).on("click", "#resetpwd", function(e){
                if(!isPasswordSame("#password1", "#password") || !isPasswordSame("#password1", "#password")){
                    e.preventDefault();
                }
            });
        </script>   
    </body>
</html>
