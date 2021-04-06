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
    </head>
    <body style="background-color: #e6e6e6">
        <% 
        String email = (String) request.getAttribute("email"); 
        Integer duration = (Integer)request.getAttribute("duration");
        String errorMsg = (String) request.getAttribute("errorMsg"); 
        %>        
        
        <div class="card" style="width: 54rem; margin-left: auto; margin-right: auto; margin-top: 180px;">
            <div class="card-body">
                <%
                if(!email.isEmpty()){
                    out.println("<h2 class=\"card-title\">Pautan telah dihantarkan ke emel anda.</h2>");
                    out.println("<p class=\"card-text\">Sila periksa emel anda "+email+" untuk menetapkan semula kata laluan akaun anda "+duration.toString()+" minit.</p><br>");
                    out.println("<a href=\"login\" class=\"btn btn-secondary\">Log Masuk</a>");
                }
                else{
                    out.println("<form action=\"requestReset\" method=\"post\">");
                    out.println("<h2 class=\"card-title\">Terlupa kata laluan anda?</h2>");
                    out.println("<p class=\"card-text\">Jangan risau. Sila isikan emel anda dan kami akan menghantar pautan untuk menetapkan semula kata laluan anda.</p><br>");
                    out.println(
                            "<label>Alamat Emel</label><br>"+
                            "<input type=\"email\" class=\"form-control\" name=\"email\" placeholder=\"Alamat Emel\" required><br><br>" +
                            "<input type=\"submit\" name=\"submit\" class=\"btn btn-secondary\" value=\"Hantar\">" +
                            "</form>"
                    );

                    if(!errorMsg.isEmpty()){                      
                        out.println("<br><p style=\"color:red;\" class=\"card-text\">"+errorMsg+"</p>");                       
                    }
                }
                %>
            </div>
        </div>                
    </body>
</html>