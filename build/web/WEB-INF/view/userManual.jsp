<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String output = (String)request.getAttribute("output");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Panduan Pengguna - Sistem PPD</title>
    <link rel="icon" href="/css/logo.png">

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet" />
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/customCSS.css" rel="stylesheet">
    
    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    
    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
    
    <style>
        iframe{
            min-height: 100vh;
        }
    </style>
    
</head>

<body id="page-top">
    <div id="wrapper">
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <jsp:include page="navbar.jsp"></jsp:include>
                
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Panduan Pengguna</h1>
                    </div>
                    
                    <div class="row">
                        <div class="container-fluid shadow">
                        <%= output %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                                    
    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>                                
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>
</body>
</html>