<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

<html>
<head>
    <title>Daftar Akaun - SistemPPD</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/css/logo.png">
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
    <link href="/css/customCSS.css" rel="stylesheet" type="text/css"/>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css"
    />

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body>
    <div class="wrapper">
        <div class="center">
          <h3>Pendaftaran Akaun</h3>
            <div class="detail">
                <%
                ArrayList<String> list = (ArrayList)request.getAttribute("data");

                if(list.size() > 0){
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
                %>

                <div class="col-md-12">
                    <form action="register" method="post">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h5>Emel:</h5>
                                <input class="w-100" type="email" name="email" placeholder="Alamat emel" required/>
                            </div>
                            <div class="col-md-6 mb-3">
                                <h5>Nama:</h5>
                                <input class="w-100" type="text" name="student_name" placeholder="Nama Pelajar" required/>
                            </div>
                        </div>
                    
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h5>Masukkan Kata Laluan:</h5>
                                <input class="w-100" type="password" id="password" name="password" placeholder="Kata laluan" required/>
                                <span class="input-error" id="password_alert"></span>
                            </div>
                            <div class="col-md-6 mb-3">
                                <h5>Sahkan Kata Laluan:</h5>
                                <input class="w-100" type="password" id="password1" name="password1" placeholder="Sahkan kata laluan" required/>
                                <span class="input-error" id="password1_alert"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h5>Tarikh Lahir:</h5>
                                <input class="w-100" type="date" id="birthday" name="student_birthdate" required />
                                <span class="input-error" id="dob_alert"></span>
                            </div>
                            <div class="col-md-6 mb-3">
                                <h5>Umur:</h5>
                                <input class="w-100" type="number" id="age" name="student_age" laceholder="Umur Pelajar" readonly />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <h5>Jantina:</h5>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="student_gender" id="male" value="male" required/>
                                    <label class="form-check-label" for="male">Lelaki</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="student_gender" id="female" value="female" />
                                    <label class="form-check-label" for="female">Perempuan</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <h5>Alamat Rumah:</h5>
                                <input class="w-100" type="text" name="student_address" placeholder="Tempat Tinggal" required />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h5>Daerah:</h5>
                                <input class="w-100" type="text" name="student_daerah" placeholder="Daerah" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <h5>Poskod:</h5>
                                <input class="w-100" type="text" id="poskod" name="student_poskos" placeholder="Poskod"/>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h5>Kelas:</h5>
                                <input class="w-100" type="text" name="student_class" placeholder="Kelas"/>
                            </div>
                            <div class="col-md-6 mb-3">
                                <h5>Aliran:</h5>
                                <select class="w-100" name="student_stream">
                                    <option value="Sains Tulen">Sains Tulen</option>
                                    <option value="Akaun">Akaun</option>
                                    <option value="Kulinari">Kulinari</option>
                                    <option value="Reka Cipta">Reka Cipta</option>
                                </select>
                            </div>
                        </div>
                    
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <h5>No Tel:</h5>
                                <input class="w-100" type="tel" name="student_tel" id="hpn" placeholder="No Telefon" pattern="[0-9]{8,11}">
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-12">
                                <input class="w-25" type="submit" id="register" name="register" value="Daftar" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // auto age calculator
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
