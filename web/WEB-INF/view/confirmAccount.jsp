<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pengaktifan Akaun - SistemPPD</title>   
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
        <div class="card" style="width: 52rem; margin-left: auto; margin-right: auto; margin-top: 200px;">
            <div class="card-body">
              <h2 class="card-title"><%= errorMsg %></h2><br>
              <a href="login" class="btn btn-secondary">Log Masuk</a>              
            </div>
        </div>                
    </body>
</html>