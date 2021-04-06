<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Boolean loggedIn = (Boolean) request.getAttribute("loggedIn");
String formatif_1, formatif_2, formatif_3, formatif_4, formatif_5, formatif_6, sumatif;
formatif_1 = formatif_2 = formatif_3 = formatif_4 = formatif_5 = formatif_6 = sumatif = "";

String sumatif_end = "</div></div></div>";

String a = "<a href=\"";
String b = "\" class=\"btn btn-success btn-icon-split\">" +
                "<span class=\"icon text-white-50\">" +
                    "<i class=\"fas fa-edit\"></i>"+
                "</span>"+
                "<span class=\"text\">";
String c = "</span></a>";

String penilaian_f = b + "Penilaian Formatif" + c;
String penilaian_s = b + "Penilaian Sumatif" + c;

String loginReminder = "<div class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">" +
                    "Sila <b>log masuk</b> untuk menduduki Penilaian Formatif dan Penilaian Sumatif." +
                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                    "<span aria-hidden=\"true\">&times;</span>"+
                    "</button>" +
                    "</div>";

if(loggedIn){
    sumatif = "<div class=\"card shadow mb-4\">" +
        "<div class=\"card-header py-3 cursor-pointer\" data-toggle=\"collapse\" data-target=\"#chapter2_sumatif\">" +
        "<h6 class=\"m-0 font-weight-bold text-primary\">Penilaian Sumatif</h6>" +
        "</div>" +
        "<div id=\"chapter2_sumatif\" class=\"collapse show\">"+
        "<div class=\"card-footer text-muted\">";
    formatif_1 = a+"viewFA?v=1"+penilaian_f;
    formatif_2 = a+"viewFA?v=2"+penilaian_f;
    formatif_3 = a+"viewFA?v=3"+penilaian_f;
    formatif_4 = a+"viewFA?v=4"+penilaian_f;
    formatif_5 = a+"viewFA?v=5"+penilaian_f;
    formatif_6 = a+"viewFA?v=6"+penilaian_f;
    sumatif += a + "attemptSummativeForm" + penilaian_s + sumatif_end;
    loginReminder = "";
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Bahan Pembelajaran - SistemPPD</title>
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

    
</head>

<body id="page-top">
    <div id="wrapper">
        <jsp:include page="sidebar.jsp"></jsp:include>
        
        <div id="content-wrapper" class="d-flex flex-column content-wrapper-pl">
            <div id="content">
                <jsp:include page="navbar.jsp"></jsp:include>
                
                <%= loginReminder %>
                
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Bab 2: PERWAKILAN DATA</h1>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <!-- 2.1.1 Kriptografi dalam Pengkomputeran -->
                            <div class="card shadow mb-4" id="card_chapter2_1_1">
                                <div class="card-header py-3 cursor-pointer" data-toggle="collapse" data-target="#chapter2_1_1">
                                    <h6 class="m-0 font-weight-bold text-primary">2.1.1 Kriptografi dalam Pengkomputeran</h6>
                                </div>
                                
                                <div id="chapter2_1_1" class="collapse show">
                                    <div class="card-body font-14">
                                        <p class="font-weight-bold">Kriptografi (Cryptography)</p>
                                        <ul>
                                            <li>Berasal daripada a bahasa Yunani "kriptos" dan "graphein"</li>
                                            <li>"Kriptos" bermaksud sembunyi</li>
                                            <li>"Graphein" bermaksud untuk tulis</li>
                                            <li>Kajian tentang teknik kerahsiaan atau dikenali sebagai keselamatan komunikasi data.</li>
                                        </ul>

                                        <p class="font-weight-bold">Tujuan Kriptografi</p>
                                        <ul>
                                            <li>Untuk melindungi informasi daripada terdedah dan dipintas oleh pihak lain."</li>
                                            <li>Untuk mengatasi masalah pencerobohan maklumat penting atau sulit individu, masyarakat dan negara.</li>
                                        </ul>

                                        <p class="font-weight-bold">Kepentingan Perkhidmatann Keselamatan Data Kriptografi</p>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img1.jpeg" alt="Perkhidmatann Keselamatan Data Kriptografi">
                                        <ul>
                                            <li><b>Kerahsiaan (Confidentiality): </b>Kesulitan sesuatu maklumat yang dihantar melalui rangkaian komputer yang perlu dilindungi supaya maklumat tersebut tidak diketahui oleh pihak lain selain penerima.</li>
                                            <li><b>Pengesahan (Authentication): </b>Pengenalpastian pihak-pihak yang terlibat dalam suatu komunikasi agar maklumat dihantar oleh pihak yang disahkan.</li>
                                            <li><b>Integriti (Integrity): </b>Perkhidmatan keselamatan yang mengenal pasti sebarang perubahan terhadap maklumat atau data oleh pihak lain.</li>
                                            <li><b>Tiada sangkalan (Non-repudiation): </b>Untuk membuktikan bahawa penghantar dan penerima maklumat tidak menafikan bahawa mereka menghantar dan menerima maklumat tersebut.</li>
                                        </ul>
                                    </div>
                                    <div class="card-footer text-muted">
                                        <a href="https://youtu.be/68Pqir_moqA" target="_blank" class="btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-video"></i>
                                            </span>
                                            <span class="text">Video 1</span>
                                        </a>
                                        <a href="https://drive.google.com/file/d/1q69CcwshSaNwXDiilYu_82b3MRHgdBye/view?usp=drivesdk" target="_blank" class="btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-video"></i>
                                            </span>
                                            <span class="text">Video 2</span>
                                        </a>
                                        <%= formatif_1 %>
                                    </div>
                                </div>
                            </div>
                            <!-- 2.1.2 Proses Sifer (Cipher) -->
                            <div class="card shadow mb-4" id="card_chapter2_1_2">
                                <div class="card-header py-3 cursor-pointer" data-toggle="collapse" data-target="#chapter2_1_2">
                                    <h6 class="m-0 font-weight-bold text-primary">2.1.2 Proses Sifer (Cipher)</h6>
                                </div>
                                <div id="chapter2_1_2" class="collapse show">
                                    <div class="card-body font-14">
                                        <p class="font-weight-bold">2 Jenis Sifer</p>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img2.png" alt="Jenis Sifer">

                                        <p class="font-weight-bold">Penyulitan (Encryption)</p>
                                        <ul>
                                            <li>proses penukaran teks biasa kepada teks sifer dengan menggunakan algoritma dan kunci penyulitan</li>
                                        </ul>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img3.png" alt="Penyulitan">

                                        <p class="font-weight-bold">Langkah-langkah penyulitan</p>
                                        <ol>
                                            <li>Pengirim menghantar mesej (teks biasa) kepada penerima.</li>
                                            <li>Mesej ini akan disulitkan menggunakan satu kunci dan algoritma penyulitan.</li>
                                            <li>Teks sifer, iaitu teks yang tidak bermakna akan terhasil.</li>
                                        </ol>
                                        
                                        <p class="font-weight-bold">Nyahsulit (Decryption)</p>
                                        <ul>
                                            <li>proses nyahsulit akan berlaku terhadap teks sifer untuk mendapatkan kembali teks biasa yang asal.</li>
                                        </ul>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img4.PNG" alt="Nyahsulit">
                                        
                                        <p class="font-weight-bold">Langkah-langkah nyahsulit adalah seperti berikut</p>
                                        <ol>
                                            <li>Teks sifer yang telah disulitkan akan dinyahsulit menggunakan satu kunci dan algoritma nyahsulit.</li>
                                            <li>Teks sifer akan menjadi teks biasa.</li>
                                            <li>Penerima akan menerima teks biasa yang dapat dibaca.</li>
                                        </ol>
                                    </div>
                                    <div class="card-footer text-muted">
                                        <a href="https://youtu.be/r4HQ8Bp-pfw" target="_blank" class="btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-video"></i>
                                            </span>
                                            <span class="text">Video 1</span>
                                        </a>
                                        <a href="https://youtu.be/AQDCe585Lnc" target="_blank" class="btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-video"></i>
                                            </span>
                                            <span class="text">Video 2</span>
                                        </a>
                                        <%= formatif_2 %>
                                    </div>
                                </div>
                            </div>
                            <!-- 2.1.3 Menghasil dan Menterjemah Mesej Menggunakan Kaedah Sifer -->
                            <div class="card shadow mb-4" id="card_chapter2_1_3">
                                <div class="card-header py-3 cursor-pointer" data-toggle="collapse" data-target="#chapter2_1_3">
                                    <h6 class="m-0 font-weight-bold text-primary">2.1.3 Menghasil dan Menterjemah Mesej Menggunakan Kaedah Sifer</h6>
                                </div>
                                <div id="chapter2_1_3" class="collapse show">
                                    <div class="card-body font-14">
                                        <p class="font-weight-bold">Kaedah-kaedah sifer</p>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img5.PNG" alt="Kaedah Sifer">

                                        <p class="font-weight-bold">Reverse Cipher</p>
                                        <ul>
                                            <li>kaedah sifer yang paling mudah</li>
                                            <li>menggunakan cara songsangan untuk menyulitkan mesej</li>
                                        </ul>

                                        <p class="font-weight-bold">3 Jenis Reverse Cipher</p>
                                        <ul>
                                            <li>Songsangan dilakukan berdasarkan abjad (A–Z)</li>
                                            <li>Songsangan dilakukan berdasarkan perkataan</li>
                                            <li>Songsangan dilakukan berdasarkan seluruh mesej</li>
                                        </ul>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img6.PNG" alt="Reverse Cipher">
                                        
                                        <p class="font-weight-bold">Substitution Cipher</p>
                                        <ul>
                                            <li>Menggantikan satu unit teks biasa dengan satu unit teks yang lain (sifer)</li>
                                            <li>Satu unit bermaksud satu abjad, pasangan abjad atau kumpulan abjad</li>
                                        </ul>
                                        
                                        <p class="font-weight-bold">Jenis Substitution Cipher</p>
                                        <ul>
                                            <li>Monoalphabetic substitution: </li>
                                            <ul>
                                                <li>Caesar Cipher</li>
                                                <li>Pigpen Cipher</li>
                                            </ul>
                                        </ul>
                                        
                                        <p class="font-weight-bold">Caesar Cipher</p>
                                        <ul>
                                            <li>Juga disebut sebagai shift cipher (sifer anjakan)</li>
                                            <li>Kaedah sifer yang paling awal digunakan oleh manusia untuk menyulitkan mesej</li>
                                            <li>Penyulitan teks biasa (plaintext) dilakukan dengan menggantikan setiap abjad dalam teks itu dengan abjad yang lain dalam susunan abjad, iaitu dengan menganjakkan abjad dalam susunan abjad</li>
                                            <li>Bilangan anjakan ini dikenali sebagai kunci dan boleh diwakili dengan sebarang simbol</li>
                                        </ul>
                                        
                                        <p class="font-weight-bold">Contoh:</p>
                                        <h6>K = 5 bermaksud anjakan sebanyak lima tempat ke kanan dilakukan pada senarai abjad.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img7.PNG" alt="Caesar Cipher">
                                        <h6>Pengirim mesej akan menentukan nilai K yang akan dijadikan sebagai kunci penyulitan.</h6>
                                        
                                        <p class="font-weight-bold">Pigpen Cipher</p>
                                        <ul>
                                            <li>Setiap abjad digantikan dengan simbol grafik yang sepadan</li>
                                            <li>Mudah digunakan kerana penyulitan dan nyahsulit dapat dilakukan dengan mudah jika simbol-simbol grafik diketahui</li>
                                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img8.PNG" alt="Pigpen Cipher">
                                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img9.PNG" alt="Pigpen Cipher">
                                        </ul>
                                        <p class="font-weight-bold">Contoh:</p>
                                        <h6>Mesej SELAMAT PAGI dapat disulitkan menggunakan Pigpen Cipher dengan mudah seperti yang ditunjukan dalam diagram di bawah.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img10.PNG" alt="Pigpen Cipher Contoh">
                                        <h6>Pigpen Cipher mempunyai variasi berlainan yang melibatkan penggunaan nombor 0 hingga 9. Variasi Pigpen Cipher ini dicipta oleh Thomas Hunter II. Berikut menunjukkan grid variasi Pigpen Cipher ini.</h6>
                                        <h6>(Sumber: https://thomashunter.name/blog/extended-pigpen-cipher-to-include-numbers/)</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img11.PNG" alt="Pigpen Cipher Contoh">
                                        
                                        <p class="font-weight-bold">Transposition Cipher</p>
                                        <ul>
                                            <li>Mengubah kedudukan abjad dalam teks biasa</li>
                                            <li>Perubahan yang berlaku ini juga dikenali sebagai pemutaran atau pencampuran (scrambling)</li>
                                            <li>penyulitan dan nyahsulit menggunakan Transposition cipher ini memerlukan penggunaan kunci</li>
                                        </ul>
                                        <p class="font-weight-bold">Jenis Transpoition Cipher</p>
                                        <ul>
                                            <li>Columnar Transposition</li>
                                            <li>Rail Fence Cipher</li>
                                        </ul>
                                        
                                        <p class="font-weight-bold">Columnar Cipher</p>
                                        <ul>
                                            <li>menyulitkan satu mesej dengan menulisnya dalam jadual secara mendatar (horizontal) dengan bilangan lajur (column) yang telah ditetapkan</li>
                                            <li>Satu perkataan dipilih untuk dijadikan kunci penyulitan</li>
                                            <li>Satu perkataan dipilih untuk dijadikan kunci penyulitan</li>
                                            <li>Abjad-abjad yang ada dalam kunci akan menentukan cara bagi mengubah urutan abjad-abjad dalam mesej</li>
                                            <li>Setiap abjad dalam mesej akan ditulis pada setiap petak dalam jadual.</li>
                                        </ul>
                                        <p class="font-weight-bold"><u>Contoh: Penyulitan menggunakan Columnar Transposition</u></p>
                                        <h6>Langkah-langkah untuk menyulitkan teks biasa: MAKLUMAT MESYUARAT AKADEMIK.</h6>
                                        <p class="font-weight-bold">Langkah 1:</p>
                                        <h6>Kenal pasti kunci yang ingin digunakan. Katakan perkataan BOLA digunakan sebagai kunci. Bina satu jadual seperti di bawah. Kemudian, isikan baris yang seterusnya dengan nombor berdasarkan susunan abjad, iaitu abjad A = 1, B = 2, L = 3 dan O = 4.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img12.PNG" alt="Columnar Cipher Langkah 1">
                                        <p class="font-weight-bold">Langkah 2:</p>
                                        <h6>Gunakan formula yang berikut untuk menghitung bilangan baris yang diperlukan dalam jadual.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img13.PNG" alt="Columnar Cipher Langkah 2">
                                        <h6>Kembangkan jadual dalam langkah 1 seperti jadual berikut. Kemudian, isikan semua abjad dalam teks biasa ke dalam petak-petak kosong dari kiri ke kanan baris demi baris.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img14.PNG" alt="Columnar Cipher Langkah 2">
                                        <p class="font-weight-bold">Langkah 3:</p>
                                        <h6>Teks sifer akan ditulis berdasarkan jadual yang dihasilkan dalam langkah 2. Mulai dari lajur 1, abjad ditulis dari atas ke bawah. Ini diikuti dengan lajur-lajur yang seterusnya.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img15.PNG" alt="Columnar Cipher Langkah 3">
                                        <h6>Teks sifer dihasilkan dengan mencantumkan semua abjad dari lajur 1, 2, 3 dan 4.</h6>
                                        <h6><b>Teks sifer anda ialah: L T Y A A I Z M U M U T D K K A S R K M T A M E A A E X</b></h6>
                                        <p class="font-weight-bold"><u>Contoh: Nyahsulit menggunakan Columnar Transposition</u></p>
                                        <h6>Ramli menerima teks sifer dan kunci daripada pelatih bola sepaknya seperti yang ditunjukkan di bawah:</h6>
                                        <h6>Teks sifer: E I E A L A N P K I A K S A D M O P A E P N S X R N E B E X </h6>
                                        <h6>Kunci: PINTU</h6>
                                        <p class="font-weight-bold">Langkah 1:</p>
                                        <h6>Bina satu jadual dan isikan abjad-abjad kunci seperti di bawah. Kemudian, isikan baris yang seterusnya dengan nombor berdasarkan susunan abjad, iaitu abjad I = 1 dan seterusnya.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img16.PNG" alt="Nyahsulit Columnar Transposition">
                                        <p class="font-weight-bold">Langkah 2:</p>
                                        <h6>Bilangan baris yang diperlukan dapat diperoleh daripada formula yang berikut:</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img17.PNG" alt="Nyahsulit Columnar Transposition">
                                        <h6>Kembangkan jadual dalam langkah 2 dengan tambahan enam baris. Kemudian, isikan abjad-abjad teks sifer ke dalam jadual di bawah secara menegak (vertical) berdasarkan kepada urutan nombor.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img18.PNG" alt="Nyahsulit Columnar Transposition">
                                        <p class="font-weight-bold">Langkah 3:</p>
                                        <h6>Berdasarkan jadual dari langkah 2, anda dapat menuliskan teks biasa dari kiri ke kanan secara mendatar (horizontal) bermula dengan baris pertama.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img19.PNG" alt="Nyahsulit Columnar Transposition">
                                        <h6><b>Bilangan baris yang diperlukan dapat diperoleh daripada formula yang berikut:</b></h6>
                                        
                                        <p class="font-weight-bold">Rail Fence Cipher</p>
                                        <ul>
                                            <li>Juga disebut sebagai zig-zag cipher</li>
                                            <li>abjad-abjad dalam teks biasa ditulis semula mengikut susunan baris demi baris dan mengikut corak zig-zag seperti pagar</li>
                                            <li>perlu dinyatakan kunci untuk penyulitan dan nyahsulit berlaku</li>
                                            <li>Nilai kunci merujuk kepada bilangan baris yang digunakan</li>
                                        </ul>
                                        <p class="font-weight-bold">Contoh: Penyulitan teks biasa menggunakan Rail Fence Cipher</p>
                                        <h6>Penyulitan teks biasa JUMPA DI PINTU 1 PUKUL 1 menggunakan Rail Fence Cipher dengan kunci = 2.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img20.PNG" alt="Penyulitan teks biasa menggunakan Rail Fence Cipher">
                                        <p class="font-weight-bold">Contoh: : Nyahsulit menggunakan Rail Fence Cipher</p>
                                        <h6>Rizal telah menerima teks sifer KMDENAIUICMRAGMREL berserta kunci = 3 daripada seorang rakan. Kaedah yang digunakan oleh rakannya ialah Rail Fence Cipher. Bantu Rizal nyahsulitkan mesej ini.</h6>
                                        <p class="font-weight-bold">Langkah 1:</p>
                                        <h6>Kunci yang diterima mewakili baris bagi jadual, iaitu 3. Bagi menentukan bilangan lajur, hitungkan jumlah abjad dalam teks sifer, iaitu 18. Ini bermaksud 18 lajur diperlukan. Bina satu jadual yang mempunyai tiga baris dan 18 lajur, seperti yang ditunjukkan di bawah.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img21.PNG" alt="Penyulitan teks biasa menggunakan Rail Fence Cipher">
                                        <p class="font-weight-bold">Langkah 2:</p>
                                        <h6>Tandakan petak menggunakan simbol “-” supaya menjadi corak zig-zag. Petak yang bertanda akan digunakan untuk mengisi abjad-abjad dalam teks sifer yang diberikan. Langkah ini dapat mengelakkan kesilapan mengisi abjad teks sifer.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img22.PNG" alt="Penyulitan teks biasa menggunakan Rail Fence Cipher">
                                        <p class="font-weight-bold">Langkah 3:</p>
                                        <h6>Pindahkan teks sifer KMDENAIUICMRAGMREL ke dalam jadual. Bermula dengan baris pertama, abjad diisi satu demi satu seperti yang ditunjukkan di bawah</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img23.PNG" alt="Penyulitan teks biasa menggunakan Rail Fence Cipher">
                                        <p class="font-weight-bold">Langkah 4:</p>
                                        <h6>Selepas baris pertama, abjad-abjad yang seterusnya diisi di baris kedua dan baris ketiga sehingga semua abjad selesai diisi seperti yang ditunjukkan di bawah.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img24.PNG" alt="Penyulitan teks biasa menggunakan Rail Fence Cipher">
                                        <p class="font-weight-bold">Langkah 5:</p>
                                        <h6>Baca mesej yang dinyahsulit mengikut corak zig-zag seperti yang ditunjukkan di bawah.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img25.PNG" alt="Penyulitan teks biasa menggunakan Rail Fence Cipher">
                                        <h6><b>Mesej yang diperoleh ialah KAMIMURIDCEMERLANG. Ruang kosong diisi sendiri semasa membaca mesej, iaitu KAMI MURID CEMERLANG.</b></h6>
                                    </div>
                                    <div class="card-footer text-muted">
                                        <a href="https://youtu.be/o6TPx1Co_wg" target="_blank" class="btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-video"></i>
                                            </span>
                                            <span class="text">Video 1</span>
                                        </a>
                                        <a href="https://youtu.be/prPo0Xh66gw" target="_blank" class="btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-video"></i>
                                            </span>
                                            <span class="text">Video 2</span>
                                        </a>
                                        <a href="https://youtu.be/VRiN9M0v3ZQ" target="_blank" class="btn btn-danger btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-video"></i>
                                            </span>
                                            <span class="text">Video 3</span>
                                        </a>
                                        <a href="https://nrich.maths.org/7940" target="_blank" class="btn btn-primary btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="far fa-window-maximize"></i>
                                            </span>
                                            <span class="text">Laman Web</span>
                                        </a>
                                        <%= formatif_3 %>
                                    </div>
                                </div>
                            </div>
                            <!-- 2.1.4 Membanding Kaedah Sifer -->
                            <div class="card shadow mb-4" id="card_chapter2_1_4">
                                <div class="card-header py-3 cursor-pointer" data-toggle="collapse" data-target="#chapter2_1_4">
                                    <h6 class="m-0 font-weight-bold text-primary">2.1.4 Membanding Kaedah Sifer</h6>
                                </div>
                                <div id="chapter2_1_4" class="collapse show">
                                    <div class="card-body font-14">
                                        <h6>Sebelum seorang pengirim menghantar sesuatu mesej sulit, pengirim perlu mempertimbangkan kekuatan dan kelemahan kaedah sifer yang dipilih. Tujuannya adalah untuk memastikan mesej sulit yang dihantar oleh pengirim selamat, iaitu tidak mudah diceroboh dan mesej sulit tersebut boleh dinyahsulit oleh penerima. Dalam subtopik sebelum ini, anda telah mempelajari tiga jenis kaedah sifer, iaitu Reverse cipher, Substitution cipher dan Transposition cipher.</h6>
                                        
                                        <p class="font-weight-bold">Contoh: Perbandingan untuk kaedah-kaedah sifer yang dipelajari</p>
                                        <h6>Cikgu Ramesh meminta murid-murid kelasnya untuk membandingkan kaedah-kaedah sifer yang telah dipelajari, iaitu Reverse cipher, Caesar Cipher, Pigpen Cipher, Rail Fence Cipher dan Columnar Transposition. Teks biasa yang perlu disulitkan ialah <b>JAGA KEBERSIHAN KELAS</b></h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img26.PNG" alt="Perbandingan untuk kaedah-kaedah sifer yang dipelajari">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img27.PNG" alt="Perbandingan untuk kaedah-kaedah sifer yang dipelajari">
                                    </div>
                                    <div class="card-footer text-muted">
                                        <%= formatif_4 %>
                                    </div>
                                </div>
                            </div>
                            <!-- 2.1.5 Pemilihan Kaedah Sifer Terbaik -->
                            <div class="card shadow mb-4" id="card_chapter2_1_5">
                                <div class="card-header py-3 cursor-pointer" data-toggle="collapse" data-target="#chapter2_1_5">
                                    <h6 class="m-0 font-weight-bold text-primary">2.1.5 Pemilihan Kaedah Sifer Terbaik</h6>
                                </div>
                                <div id="chapter2_1_5" class="collapse show">
                                    <div class="card-body font-14">
                                        <ul>
                                            <li>Pemilihan penggunaan kaedah sifer untuk penyulitan sesuatu mesej adalah bergantung kepada situasi</li>
                                            <li>Pengirim boleh memilih kaedah sifer yang hendak digunakan mengikut tahap kerahsiaan sesuatu mesej</li>
                                        </ul>
                                        
                                        <p class="font-weight-bold">1. Mesej yang kurang penting atau tahap kerahsiaannya rendah</p>
                                        <ul>
                                            <li>Reverse cipher</li>
                                            <li>Pigpen cipher</li>
                                        </ul>
                                        
                                        <p class="font-weight-bold">2. Mesej yang dikategorikan sebagai tahap kerahsiaan sederhana dan tinggi</p>
                                        <ul>
                                            <li>Caesar cipher</li>
                                            <li>Rail Fence cipher</li>
                                            <li>Columnar Transposition</li>
                                        </ul>
                                        
                                        <p class="font-weight-bold"><u>Contoh 1: Pemilihan kaedah sifer yang sesuai untuk mesej yang mempunyai tahap kerahsiaan rendah</u></p>
                                        <h6>Salim dan Hock Chuan ialah rakan sekelas. Mereka saling membantu semasa mengulang kaji pelajaran. Mereka juga selalu berkomunikasi melalui mesej yang dihantar di dalam kelas untuk menetapkan masa mengulang kaji pelajaran. Setelah mereka mempelajari kaedah-kaedah sifer, mereka ingin menyulitkan mesej mereka kerana tidak ingin diganggu semasa mengulang kaji.</h6>
                                        <h6>Penentuan tahap kerahsiaan:</h6>
                                        <h6>1. Mesej yang perlu disulitkan ialah tempat dan masa mengulang kaji. Tahap kerahsiaan adalah rendah.</h6>
                                        <h6>2. Masa untuk menyulit dan menyahsulit mesej tidak boleh mengambil masa yang lama kerana dilakukan di dalam kelas.</h6>
                                        <p class="font-weight-bold">Pilihan kaedah sifer yang sesuai ialah kaedah Reverse cipher. Hal ini kerana kaedah ini boleh dilakukan dengan mudah tanpa kegunaan kunci.</p>
                                        <br>
                                        
                                        <p class="font-weight-bold"><u>Contoh 2: Pemilihan kaedah sifer yang sesuai untuk mesej yang mempunyai tahap kerahsiaan sederhana</u></p>
                                        <h6>Cikgu Faizal mengadakan mesyuarat tentang pemilihan pengawas sekolah bersama-sama dengan beberapa orang guru. Keputusan mesyuarat yang diperoleh perlu disimpan sebaiknya sehingga hari perhimpunan sekolah. Cikgu Faizal memasukkan nama-nama pengawas yang terpilih di dalam satu fail. Nama fail tersebut disulitkan supaya tidak ada sesiapa yang mengetahui bahawa fail tersebut mengandungi nama-nama pengawas yang terpilih.</h6>
                                        <h6>Penentuan tahap kerahsiaan:</h6>
                                        <h6>Mesej yang perlu disulitkan ialah nama fail yang mengandungi nama-nama pengawas. Tahap kerahsiaan adalah sederhana.</h6>
                                        <p class="font-weight-bold">Pilihan kaedah sifer yang sesuai ialah kaedah Caesar Cipher atau Rail Fence Cipher yang mempunyai kunci.</p>
                                        <br>
                                        
                                        <p class="font-weight-bold"><u>Contoh 3: Pemilihan kaedah sifer yang sesuai untuk mesej yang mempunyai tahap kerahsiaan tinggi</u></p>
                                        <h6>Seorang pegawai di cawangan sebuah bank ingin menghantar maklumat kepada pegawai bank induk mengenai status pendapatan suku tahunan. Maklumat ini diklasifikasikan sebagai terlalu sulit. Oleh itu, pegawai cawangan mengambil keputusan untuk melakukan penyulitan maklumat tersebut sebelum disampaikan kepada pegawai bank induk.</h6>
                                        <h6>Penentuan tahap kerahsiaan:</h6>
                                        <h6>1. Mesej yang perlu disulitkan ialah status pendapatan suku tahunan bank. Tahap kerahsiaan adalah tinggi.</h6>
                                        <h6>2. Masa yang diperlukan untuk menyulit dan menyahsulit adalah lama kerana maklumat tersebut amat penting.</h6>
                                        <br>
                                        <h6><b>Kaedah yang paling sesuai digunakan ialah kaedah sifer yang mempunyai kunci, seperti Columnar Transposition yang rumit untuk dinyahsulit. Kaedah Caesar Cipher dan Rail Fence Cipher juga boleh digunakan.</b></h6>
                                        <br>
                                        <h6><i>Berdasarkan ketiga-tiga situasi dalam Contoh 1, 2 dan 3, pengirim perlu memilih kaedah yang mempunyai kunci bagi maklumat yang diklasifikasikan sebagai tahap sederhana dan tinggi. Hal ini demikian kerana, kaedah sifer yang mempunyai kunci lebih selamat serta sukar diceroboh oleh pihak lain selain sukar untuk dinyahsulit melainkan dengan penggunaan kunci.</i></h6>                               
                                    </div>
                                    <div class="card-footer text-muted">
                                        <a href="https://resources.infosecinstitute.com/topic/role-of-cryptography/#gref" target="_blank" class="btn btn-primary btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="far fa-window-maximize"></i>
                                            </span>
                                            <span class="text">Laman Web</span>
                                        </a>
                                        <%= formatif_5 %>
                                    </div>
                                </div>
                            </div>
                            <!-- 2.1.6 Kaedah Sifer dalam Penyelesaian Masalah -->
                            <div class="card shadow mb-4" id="card_chapter2_1_6">
                                <div class="card-header py-3 cursor-pointer" data-toggle="collapse" data-target="#chapter2_1_6">
                                    <h6 class="m-0 font-weight-bold text-primary">2.1.6 Kaedah Sifer dalam Penyelesaian Masalah</h6>
                                </div>
                                <div id="chapter2_1_6" class="collapse show">
                                    <div class="card-body font-14">
                                        <ol class="pl-2 font-16">
                                            <li>Dalam dunia yang serba moden ini, manusia sangat bergantung kepada pelbagai kemudahan sedia ada seperti Internet, rangkaian komputer, pangkalan data, telefon pintar, kad debit, kad kredit dan sebagainya.</li>
                                            <li>Kemudahan seperti ini kadangkala memberikan peluang kepada pihak lain untuk menceroboh maklumat yang terkandung seperti kata laluan e-mel, nombor pin kad debit, maklumat peribadi, rahsia syarikat dan sebagainya.</li>
                                            <li>Peggunaan kaedah sifer yang kompleks akan menyukarkan pihak lain menceroboh maklumat yang ingin dilindungi.</li>
                                            <li>Walau bagaimanapun, kaedah sifer hanya salah satu daripada kaedah keselamatan siber (cyber security) yang digunakan untuk menjaga keselamatan data dan sistem komputer.</li>
                                            <li>Setiap individu boleh menghasilkan kaedah sifer mereka yang unik untuk kegunaan sendiri mengikut keperluan.</li>
                                            <li>Dalam proses penghasilan kaedah sifer yang baharu, dua perkara perlu dititikberatkan:</li>
                                            <ul>
                                                <li>kelebihan sifer yang akan dibangunkan</li>
                                                <li>kelemahan sifer yang akan dibangunkan</li>
                                            </ul>
                                        </ol>
                                        
                                        <p class="font-weight-bold"><u>Contoh: Penghasilan kaedah sifer yang baharu</u></p>
                                        <h6>Safri, selaku Pengerusi Kelab Komputer pada tahun ini telah diminta untuk mencadangkan nama pengganti yang berpotensi menjawat jawatan pengerusi kelab tersebut bagi tahun hadapan. Dalam proses menamakan calon-calon yang sesuai, beliau harus memastikan bahawa maklumat ini adalah sulit sehingga disampaikan kepada guru penasihat kelab. Bagi memastikan maklumat sulit ini tidak diceroboh, Safri telah mencipta satu kaedah sifer baharu yang berjenis Substitution cipher.</h6>
                                        <br>
                                        <h6>Jadual berikut menunjukkan simbol-simbol yang akan digunakan oleh Safri dan guru penasihatnya untuk menyulit dan nyahsulit maklumat berkaitan pemilihan pengerusi baharu. Kaedah sifer baharu ini menggunakan nombor 1 hingga 6 sebagai kunci dan setiap kunci mewakili simbol 1 yang unik dan simbol 2 yang umum.</h6>
                                        <figure class="figure">
                                            <img src="/img/img28.PNG" class="figure-img img-fluid px-3 px-sm-4" alt="Jadual 2.4">
                                            <figcaption class="figure-caption text-center">Jadual 2.4</figcaption>
                                        </figure>
                                        <h6>Safri akan mula menyulitkan nama-nama calon yang dicadangkan melalui langkah-langkah berikut.</h6>
                                        
                                        
                                        <p class="font-weight-bold">Langkah 1:</p>
                                        <h6>Andaikan, Safri menggunakan kunci (k) = 2 untuk menyulitkan maklumat yang hendak dihantar, maka beliau akan membina satu jadual asas yang berikut berdasarkan kunci pilihan. Baris pertama dimulai dengan k = 2 dan diikuti dengan nombor k yang seterusnya iaitu 3 hingga 6 dan diulangi semula dengan k = 1.</h6>
                                        <figure class="figure">
                                            <img src="/img/img29.PNG" class="figure-img img-fluid px-3 px-sm-4" alt="Jadual 2.5">
                                            <figcaption class="figure-caption text-center">Jadual 2.5</figcaption>
                                        </figure>
                                        
                                        <p class="font-weight-bold">Langkah 2:</p>
                                        <h6>Setiap abjad (A – Z) diwakili dengan simbol daripada Jadual 2.4. Simbol-simbol bagi empat abjad pertama (A – D) dibentuk dengan menggabungkan simbol 1 dan 2 dari baris pertama, iaitu k = 2. Abjad A diwakili dengan melukiskan simbol 1 ke dalam kotak simbol 2. Abjad B diwakili dengan melukiskan simbol 1 yang dipusing 90° mengikut arah jam ke dalam kotak simbol 2. Abjad C diwakili dengan melukiskan simbol 1 yang dipusing 180° mengikut arah jam ke dalam kotak simbol 2. Abjad D diwakili dengan melukiskan simbol 1 yang dipusing 270° mengikut arah jam ke dalam kotak simbol 2. Jadual 2.6 menunjukkan hasil lukisan yang akan diperoleh.</h6>
                                        <figure class="figure">
                                            <img src="/img/img30.PNG" class="figure-img img-fluid px-3 px-sm-4" alt="Jadual 2.6">
                                            <figcaption class="figure-caption text-center">Jadual 2.6</figcaption>
                                        </figure>
                                        <h6>Bagi 4 abjad yang seterusnya (E – H), ulangi proses yang sama dengan menggunakan simbol 1 dan simbol 2 bagi k = 3. Langkah ini diulangi sehingga semua simbol daripada semua kunci (1 – 6) habis digunakan. Anda akan mendapati bahawa hanya abjad Y dan Z yang belum diwakili dengan simbol. Abjad Y akan diwakili oleh simbol 1 dari k = 2. Manakala abjad Z akan diwakili oleh simbol 2 sahaja. Jadual 2.7 menunjukkan abjad dan perwakilan simbol yang berpadanan.</h6>
                                        <figure class="figure">
                                            <img src="/img/img31.PNG" class="figure-img img-fluid px-3 px-sm-4" alt="Jadual 2.7">
                                            <figcaption class="figure-caption text-center">Jadual 2.7</figcaption>
                                        </figure>
                                        
                                        <p class="font-weight-bold">Langkah 3:</p>
                                        <h6>Menyulitkan teks biasa kepada teks sifer dengan merujuk kepada Jadual 2.7.</h6>
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="/img/img32.PNG" alt="Menyulitkan teks biasa kepada teks sifer dengan merujuk kepada Jadual 2.7">
                                        <h6>Maka, Safri akan menggunakan teks sifer 1 dan 2 sebagai nama calon untuk berkongsi dengan guru penasihatnya.</h6>
                                    </div>
                                    <div class="card-footer text-muted">
                                        <a href="https://codemoji.org/#/welcome" target="_blank" class="btn btn-primary btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="far fa-window-maximize"></i>
                                            </span>
                                            <span class="text">Laman Web</span>
                                        </a>
                                        <%= formatif_6 %>
                                    </div>
                                </div>
                            </div>
                            <!-- Penilaian Sumatif -->
                            <%= sumatif %>
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