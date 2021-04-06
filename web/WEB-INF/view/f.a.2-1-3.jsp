<%@page import="jdbc.JDBCUtility"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Enumeration"%> 
<%@page import="java.util.ArrayList"%>
<%@page import="classes.User"%> 
<% User user = (User) request.getAttribute("data"); %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession ss = request.getSession();
    String email = (String) ss.getAttribute("email");

    Connection con = null;
    PreparedStatement pst=null;
    ResultSet rs = null;
    ResultSet rs1 = null;
    JDBCUtility jdbcUtility = new JDBCUtility();
    String sql;
    
    con = jdbcUtility.db1_connect();
    
    String msg1="", msg2="", msg3="", msg4="", msg5="";
    String score, show = "", reattempt = "";
    int attempt=0,s_score=0;

    try {
        sql = "Select * from public.user where email=?";
        pst = con.prepareStatement(sql);
        pst.setString(1, email);
        rs1 = pst.executeQuery();
        if (rs1.next()) {
            int user_id = rs1.getInt("id");

            sql = "SELECT * FROM public.formative_q where stud_id=? and \"Qid\" = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, user_id);
            pst.setInt(2, 3);
            rs = pst.executeQuery();

            if (rs.next()) {
                attempt = rs.getInt("s_attempt");
                s_score = rs.getInt("s_score");
                
                if (rs.getInt("Qid") == 3) {

                        if (s_score == 5 && attempt < 3) {
                            show = "none";
                            reattempt = "";
                            msg1 = "<p style = 'color:green'>B. II dan III</p>";
                            msg2 = "<p style = 'color:green'>C. I dan IV</p>";
                            msg3 = "<p style = 'color:green'>D. QFZIZ RZOZS PFNKFOZM AZNIFW</p>";
                            msg4 = "<p style = 'color:green'>A. SERONOK BELAJAR</p>";
                            msg5 = "<p style = 'color:green'>C. YBOGXVX </p>";
                            request.setAttribute("msg1", msg1);
                            request.setAttribute("msg2", msg2);
                            request.setAttribute("msg3", msg3);
                            request.setAttribute("msg4", msg4);
                            request.setAttribute("msg5", msg5);
                            request.setAttribute("score", String.valueOf(s_score));
                            request.setAttribute("show", show);
                            request.setAttribute("reattempt", reattempt);
                        } else if (attempt >= 3) {
                            msg1 = "B. II dan III";
                            msg2 = "C. I dan IV";
                            msg3 = "D. QFZIZ RZOZS PFNKFOZM AZNIFW";
                            msg4 = "A. SERONOK BELAJAR";
                            msg5 = "C. YBOGXVX";
                            show = "none";
                            reattempt = "";
                            request.setAttribute("msg1", msg1);
                            request.setAttribute("msg2", msg2);
                            request.setAttribute("msg3", msg3);
                            request.setAttribute("msg4", msg4);
                            request.setAttribute("msg5", msg5);
                            request.setAttribute("score", String.valueOf(s_score));
                            request.setAttribute("show", show);
                            request.setAttribute("reattempt", reattempt);
                        } else if (attempt < 3) {
//                            show = "none";
//                            reattempt = "";
//                            request.setAttribute("show", show);
//                            request.setAttribute("reattempt", reattempt);
                        }
                    }
            }else{}
        }else{}con.close();
    } catch (Exception e) {
        out.println(e);
    }

    if (request.getAttribute("show") == null) {
        show = "";
    } else {
        show = (String) request.getAttribute("show");
    }

    if (request.getAttribute("reattempt") == null) {
        reattempt = "none";
    } else {
        reattempt = (String) request.getAttribute("reattempt");
    }

    if (request.getAttribute("score") == null) {
        score = "";
    } else {
        score = "Markah: " + (String) request.getAttribute("score");
    }

    if (request.getAttribute("msg1") == null) {
        msg1 = "";
    } else {
        msg1 = (String) request.getAttribute("msg1");
    }
    if (request.getAttribute("msg2") == null) {
        msg2 = "";
    } else {
        msg2 = (String) request.getAttribute("msg2");
    }
    if (request.getAttribute("msg3") == null) {
        msg3 = "";
    } else {
        msg3 = (String) request.getAttribute("msg3");
    }
    if (request.getAttribute("msg4") == null) {
        msg4 = "";
    } else {
        msg4 = (String) request.getAttribute("msg4");
    }
    if (request.getAttribute("msg5") == null) {
        msg5 = "";
    } else {
        msg5 = (String) request.getAttribute("msg5");
    }


%>

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

        <title>Penilaian Formatif - SistemPPD</title>
        <link rel="icon" href="/css/logo.png" />

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
        <link href="/css/assessment.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>

    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <%--<jsp:include page="../profile/sidebar.jsp"></jsp:include>--%>
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
                                <h1 class="h3 mb-0 text-gray-800">Penilaian Formatif</h1>
                            </div>

                        <div class="row">
                            <!-- Area Chart -->
                            <div class="col-xl-8 col-lg-12">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                                        >
                                        <h6 class="m-0 font-weight-bold text-primary">
                                            Penilaian - 2.1.3 <div><%= score%></div>
                                        </h6>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-area" style="height: auto">
                                            <!-- Start Form -->
                                            <form action="FormativeServ3" method="post">
                                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                                    <li class="nav-item">
                                                        <a
                                                            class="nav-link active"
                                                            id="Q1"
                                                            data-toggle="tab"
                                                            href="#q1"
                                                            role="tab"
                                                            aria-controls="q1"
                                                            aria-selected="true"
                                                            >Soalan 1</a
                                                        >
                                                    </li>
                                                    <li class="nav-item">
                                                        <a
                                                            class="nav-link"
                                                            id="Q2"
                                                            data-toggle="tab"
                                                            href="#q2"
                                                            role="tab"
                                                            aria-controls="q2"
                                                            aria-selected="false"
                                                            >Soalan 2</a
                                                        >
                                                    </li>
                                                    <li class="nav-item">
                                                        <a
                                                            class="nav-link"
                                                            id="Q3"
                                                            data-toggle="tab"
                                                            href="#q3"
                                                            role="tab"
                                                            aria-controls="q3"
                                                            aria-selected="false"
                                                            >Soalan 3</a
                                                        >
                                                    </li>
                                                    <li class="nav-item">
                                                        <a
                                                            class="nav-link"
                                                            id="Q4"
                                                            data-toggle="tab"
                                                            href="#q4"
                                                            role="tab"
                                                            aria-controls="q4"
                                                            aria-selected="false"
                                                            >Soalan 4</a
                                                        >
                                                    </li>
                                                    <li class="nav-item">
                                                        <a
                                                            class="nav-link"
                                                            id="Q5"
                                                            data-toggle="tab"
                                                            href="#q5"
                                                            role="tab"
                                                            aria-controls="q4"
                                                            aria-selected="false"
                                                            >Soalan 5</a
                                                        >
                                                    </li>

                                                </ul>
                                                <!-- Start Content -->
                                                <div class="tab-content" id="myTabContent">
                                                    <div
                                                        class="tab-pane fade show active"
                                                        id="q1"
                                                        role="tabpanel"
                                                        aria-labelledby="q1"
                                                        >
                                                        <p>Soalan 1</p>
                                                        <h5>
                                                            1. Antara berikut yang manakah dikategorikan di bawah Substitution Cipher? <br>
                                                            I Rail Fence Cipher <br>
                                                            II Pigpen Cipher <br>
                                                            III Caesar Cipher <br>
                                                            IV Columnar Cipher <br>

                                                        </h5>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question1" value="a" id="question1a"/><label for="question1a">
                                                            A. I dan II</label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question1" value="b" id="question1b"/><label for="question1b">
                                                                B. II dan III</label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question1" value="c" id="question1c"/><label for="question1c">
                                                                C. II dan IV</label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question1" value="d" id="question1d"/><label for="question1d">
                                                                D. Semua di atas</label>
                                                        </div>

                                                        <div
                                                            class="d-flex flex-row justify-content-between align-items-center p-3 bg-white"
                                                            >
                                                            <button
                                                                class="btn btn-primary border-success align-items-center btn-success btnNext"
                                                                type="button"
                                                                >
                                                                Seterusnya<i class="fa fa-angle-right ml-2"></i>
                                                            </button>
                                                        </div>

                                                        <div class="wrapper">
                                                            <%= msg1%>
                                                        </div>

                                                        <!--/. form element wrap -->
                                                    </div>
                                                    <div
                                                        class="tab-pane fade"
                                                        id="q2"
                                                        role="tabpanel"
                                                        aria-labelledby="q2"
                                                        >
                                                        <p>Soalan 2</p>
                                                        <h5>
                                                            2. Antara berikut yang manakah dikategorikan di bawah Transposition Cipher? <br>
                                                            I Rail Fence Cipher <br>
                                                            II Pigpen Cipher <br>
                                                            III Caesar Cipher <br >
                                                            IV Columnar Cipher <br>
                                                        </h5>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question2" value="a" id="question2a"/><label for="question2a">
                                                                A. I dan II</label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question2" value="b" id="question2b"/><label for="question2b">
                                                                B. II dan III</label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question2" value="c" id="question2c"/><label for="question2c">
                                                                C. I dan IV</label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question2" value="d" id="question2d"/><label for="question2d">
                                                                D. Semua di atas</label>
                                                        </div>

                                                        <div
                                                            class="d-flex flex-row justify-content-between align-items-center p-3 bg-white"
                                                            >
                                                            <button
                                                                class="btn btn-primary d-flex align-items-center btn-success btnPrevious"
                                                                type="button"
                                                                >
                                                                <i class="fa fa-angle-left mt-1 mr-1"></i
                                                                >&nbsp;Kembali
                                                            </button>
                                                            <button
                                                                class="btn btn-primary border-success align-items-center btn-success btnNext"
                                                                type="button"
                                                                >
                                                                Seterusnya<i class="fa fa-angle-right ml-2"></i>
                                                            </button>
                                                        </div>

                                                        <div class="wrapper">
                                                            <%= msg2%>
                                                        </div>
                                                        <!--/. form element wrap -->
                                                    </div>
                                                    <div
                                                        class="tab-pane fade"
                                                        id="q3"
                                                        role="tabpanel"
                                                        aria-labelledby="q3"
                                                        >
                                                        <p>Soalan 3</p>
                                                        <h5>
                                                            3. Apakah teks sifer yang terhasil apabila mesej di bawah disulitkan menggunakan Reverse Cipher (songsangan dilakukan berdasarkan abjad A-Z)?
                                                            <img src="/img/Picture1.png">
                                                        </h5>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question3" value="a" id="question3a"/> <label for="question3a">
                                                                A. KUMPULAN IALAH ZAMRUD JUARA</label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question3" value="b" id="question3b"/> <label for="question3b">
                                                                B. ARAUJ HALAI NALUPMUK DURMAZ</label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question3" value="c" id="question3c"/> <label for="question3c">
                                                                C. DURMAZ NALUPMUK HALAI ARAUJ </label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question3" value="d" id="question3d"/> <label for="question3d">
                                                                D. QFZIZ RZOZS PFNKFOZM AZNIFW</label>
                                                        </div>

                                                        <div
                                                            class="d-flex flex-row justify-content-between align-items-center p-3 bg-white"
                                                            >
                                                            <button
                                                                class="btn btn-primary d-flex align-items-center btn-success btnPrevious"
                                                                type="button"
                                                                >
                                                                <i class="fa fa-angle-left mt-1 mr-1"></i
                                                                >&nbsp;Kembali
                                                            </button>
                                                            <button
                                                                class="btn btn-primary border-success align-items-center btn-success btnNext"
                                                                type="button"
                                                                >
                                                                Seterusnya<i class="fa fa-angle-right ml-2"></i>
                                                            </button>

                                                        </div>

                                                        <div class="wrapper">
                                                            <%= msg3%>
                                                        </div>
                                                        <!--/. form element wrap -->
                                                    </div>
                                                    <div
                                                        class="tab-pane fade"
                                                        id="q4"
                                                        role="tabpanel"
                                                        aria-labelledby="q4"
                                                        >
                                                        <p>Soalan 4</p>
                                                        <h5>
                                                            4. Apakah teks sifer yang terhasil apabila mesej di bawah disulitkan menggunakan Pigpen Cipher? <br>
                                                            <img src="/img/Picture2.png">
                                                        </h5>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question4" value="a" id="question4a"/> <label for="question4a">
                                                                A. SERONOK BELAJAR</label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question4" value="b" id="question4b"/> <label for="question4b">
                                                                B. GEMBIRA BERMAIN</label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question4" value="c" id="question4c"/> <label for="question4c">
                                                                C. GEMBIRA BELAJAR</label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question4" value="d" id="question4d"/> <label for="question4d">
                                                                D. SERONOK MEMBACA </label>
                                                        </div>

                                                        <div
                                                            class="d-flex flex-row justify-content-between align-items-center p-3 bg-white"
                                                            >
                                                            <button
                                                                class="btn btn-primary d-flex align-items-center btn-success btnPrevious"
                                                                type="button"
                                                                >
                                                                <i class="fa fa-angle-left mt-1 mr-1"></i
                                                                >&nbsp;Kembali
                                                            </button>
                                                            <button
                                                                class="btn btn-primary border-success align-items-center btn-success btnNext"
                                                                type="button"
                                                                >
                                                                Seterusnya<i class="fa fa-angle-right ml-2"></i>
                                                            </button>
                                                        </div>
                                                        <div class="wrapper">
                                                            <%= msg4%>
                                                        </div>
                                                        <!--/. form element wrap -->
                                                    </div>
                                                    <div
                                                        class="tab-pane fade"
                                                        id="q5"
                                                        role="tabpanel"
                                                        aria-labelledby="q5"
                                                        >
                                                        <p>Soalan 5</p>
                                                        <h5>
                                                            5. Apakah teks sifer yang terhasil apabila mesej di bawah disulitkan menggunakan Caesar Cipher dengan kunci 3? <br>
                                                            <img src="/img/Picture3.png">
                                                        </h5>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question5" value="a" id="question5a"/> <label for="question5a">
                                                            A. YBOGVXV
                                                            </label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question5" value="b" id="question5b"/> <label for="question5b">
                                                            B. VXVGOBY
                                                            </label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question5" value="c" id="question5c"/> <label for="question5c">
                                                            C. YBOGXVX
                                                            </label>
                                                        </div>
                                                        <div class="wrapper">
                                                            <input type="radio" name="question5" value="d" id="question5d"/> <label for="question5d">
                                                            D. GXBOVYX
                                                            </label>
                                                        </div>

                                                        <div
                                                            class="d-flex flex-row justify-content-between align-items-center p-3 bg-white"
                                                            >
                                                            <button
                                                                class="btn btn-primary d-flex align-items-center btn-success btnPrevious"
                                                                type="button"
                                                                >
                                                                <i class="fa fa-angle-left mt-1 mr-1"></i
                                                                >&nbsp;Kembali
                                                            </button>
                                                            <a href="/viewFA?v=3" 
                                                               class="btn btn-primary d-flex align-items-center btn-success btnPrevious"
                                                               style="display: <%= reattempt%>!important"
                                                               >
                                                                Kembali
                                                            </a>
                                                            <input
                                                                class="btn btn-primary border-success align-items-center btn-success btnSubmit"
                                                                style="display: <%=show%>"
                                                                type="submit"
                                                                value="Hantar"
                                                                />
                                                        </div>
                                                        <div class="wrapper">
                                                            <%= msg5%>
                                                        </div>
                                                        <!--/. form element wrap -->
                                                    </div>
                                                </div>
                                                <!-- END Content -->
                                            </form>
                                        </div>
                                    </div>
                                </div>
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

        <script>
            $(document).ready(function () {
                $(".btnNext").click(function () {
                    $(".nav-tabs .active").parent().next("li").find("a").trigger("click");
                });

                $(".btnPrevious").click(function () {
                    $(".nav-tabs .active").parent().prev("li").find("a").trigger("click");
                });
            });
        </script>

        <!-- Bootstrap core JavaScript-->
        <script src="/vendor/jquery/jquery.min.js"></script>
        <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="/js/sb-admin-2.min.js"></script>
    </body>
</html>
