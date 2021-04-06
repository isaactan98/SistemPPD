<% 
String name = (String)session.getAttribute("name");
String gender = (String) session.getAttribute("gender");
String userImg = "<i class=\"fas fa-user-circle font-24\"></i>";
String profile = "<a class=\"dropdown-item\" href=\"displayUser\"><i class=\"fas fa-user fa-sm fa-fw mr-2 text-gray-400\"></i> Profil</a>";
String login = "<a class=\"dropdown-item\" href=\"login\">"+
            "<i class=\"fas fa-sign-in-alt fa-sm fa-fw mr-2 text-gray-400\"></i>"+
            "Log masuk</a>";
String logout = "";

if(name == null){
    name = "";
    profile = "";
}
else{
    login = "";
    logout = "<a class=\"dropdown-item\" href=\"#\" data-toggle=\"modal\" data-target=\"#logoutModal\">" +
            "<i class=\"fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400\"></i>" +
            "Log keluar</a>";
}

if(gender != null){
    if(gender.equals("male")){
        userImg = "<img class=\"img-profile rounded-circle\" src=\"/img/undraw_profile.svg\"/>";
    }
    else{
        userImg = "<img class=\"img-profile rounded-circle\" src=\"/img/undraw_profile_1.svg\"/>";
    }
}

%>

<nav
  class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
>
  <!-- Sidebar Toggle (Topbar) -->
  <button
    id="sidebarToggleTop"
    class="btn btn-link d-md-none rounded-circle mr-3"
  >
    <i class="fa fa-bars"></i>
  </button>

  

  <!-- Topbar Navbar -->
  <ul class="navbar-nav ml-auto">
    <!-- Nav Item - helpdesk -->
    <li class="nav-item mx-1">
      <a
        class="nav-link"
        href="helpdesk"
        title="Meja Bantuan"
      >
        <i class="fas fa-question"></i>
      </a>
    </li>
    
    <!-- Nav Item - user manual -->
    <li class="nav-item mx-1">
      <a
        class="nav-link"
        href="userManual"
        title="Panduan Pengguna"
      >
        <i class="fas fa-chalkboard-teacher"></i>
      </a>
    </li>

    <div class="topbar-divider d-none d-sm-block"></div>

    <!-- Nav Item - User Information -->
    <li class="nav-item dropdown no-arrow">
      <a
        class="nav-link dropdown-toggle"
        href="#"
        id="userDropdown"
        role="button"
        data-toggle="dropdown"
        aria-haspopup="true"
        aria-expanded="false"
        title="Menu"
      >
        <span class="mr-2 d-none d-lg-inline text-gray-600 small">
          <%= name %>
        </span>
        <%= userImg %>
      </a>
      <!-- Dropdown - User Information -->
      <div
        class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
        aria-labelledby="userDropdown"
      >
        <a class="dropdown-item" href="material">
          <i class="fas fa-home fa-sm fa-fw mr-2 text-gray-400"></i>
         Bahan Pembelajaran
        </a>
        
        <%= profile %>

        <div class="dropdown-divider"></div>
        <%= login %>
        <%= logout %>    
      </div>
    </li>
  </ul>
</nav>
      
<!--logout modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Bersedia untuk log keluar?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">X</span>
                </button>
            </div>
            <div class="modal-body">Pilih "Log Keluar" di bawah jika anda bersedia untuk mengakhiri sesi anda sekarang.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Batal</button>
                <a class="btn btn-primary" href="logout">Log Keluar</a>
            </div>
        </div>
    </div>
</div>