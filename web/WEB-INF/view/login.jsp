<!DOCTYPE html>

<html>
  <head>
    <title>Log Masuk - SistemPPD</title>
    <link rel="icon" href="/css/logo.png">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/style.css" type="text/css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css"
    />
  </head>
  <style>
    h5 {
      font-size: 1.5rem;
    }

    .center {
      text-align: center;
      padding-top: 10%;
      width: 60%;
    }

    form {
      display: contents;
    }

    .form-group {
      width: 100%;
    }

    input {
      width: 80%;
      font-size: 20px;
      padding: 15px;
    }

    input[type="submit"] {
      width: 50%;
    }

    input[type="submit"]:hover {
      box-shadow: -2px -2px 5px #fff, 2px 2px 5px #babecc;
    }
    
    @media screen and (min-width:320px) and (max-width:450px){
        .center {
            width: 90%;
            margin-top: 20%;
        }
    }
  </style>
  <body>
    <div class="wrapper">
        <div class="center">
            <h2>Log Masuk Akaun</h2>
            <div class="detail">
                <form method="post" action="login">
                    <div class="form-group">
                      <h5>Emel:</h5>
                      <input type="email" name="email" placeholder="Alamat emel" />
                    </div>

                    <div class="form-group">
                      <h5>Kata Laluan:</h5>
                      <input type="password" name="password" placeholder="Kata laluan" />
                    </div>
                    
                    <div class="form-group">
                      <input type="submit" name="login" value="Log Masuk" />
                    </div>
                    
                    <% 
                    String errorMsg = (String) request.getAttribute("errorMsg"); 

                    if(!errorMsg.isEmpty()){
                        out.println("<div class=\"form-group\">");
                        out.println("<p>"+errorMsg+"</p>");
                        out.println("</div>");
                    }
                    %>
                </form>
            </div>
                    
            <div class="form-group">
                <a href="requestReset">Terlupa kata laluan?</a><br>
                <a href="register">Daftar akaun</a>
            </div>
        </div>
    </div>
  </body>
</html>
