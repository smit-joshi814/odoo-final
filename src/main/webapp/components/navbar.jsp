<%@page import="com.odoo.combat.entities.Users"%>

<!-- Navbar -->
<header class="navbar navbar-expand-md d-print-none">
  <div class="container-xl">
    <h1 class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
      <a href=".">Public Library</a>
    </h1>
    <div class="navbar-nav flex-row order-md-last">
      <div class="nav-item d-none d-md-flex me-3"></div>
      <div class="d-none d-md-flex">
        <a href="?theme=dark" class="nav-link px-0 hide-theme-dark" title="Enable dark mode" data-bs-toggle="tooltip" data-bs-placement="bottom">
          <i class="bi bi-moon icon"></i>
        </a>
        <a href="?theme=light" class="nav-link px-0 hide-theme-light" bitle="Enable light mode" data-bs-toggle="toolbip" data-bs-placement="bottom">
          <i class="bi bi-brightness-high"></i>
        </a>
        <div class="nav-item dropdown d-none d-md-flex me-3">
          <a href="#" class="nav-link px-0" data-bs-toggle="dropdown" tabindex="-1" aria-label="Show notifications">
            <i class="bu bi-bell icon"></i>
            <span class="badge bg-red"></span>
          </a>
        </div>
      </div>
      <div class="nav-item dropdown">
        <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown" aria-label="Open user menu">
          <div class="d-none d-xl-block ps-2">
            <div>Smit Joshi</div>
            <div class="mt-1 small text-secondary">Librarian</div>
          </div>
        </a>
        <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
          <a href="settings.html" class="dropdown-item">Settings</a>
          <a href="sign-in.html" class="dropdown-item">Logout</a>
        </div>
      </div>
    </div>
  </div>
</header>
<header class="navbar-expand-md">
  <div class="collapse navbar-collapse" id="navbar-menu">
    <div class="navbar">
      <div class="container-xl">
        <div class="my-2 my-md-0 flex-grow-1 flex-md-grow-1 order-first order-md-last">
          <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebar-menu" aria-controls="sidebar-menu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <form action="/home" method="GET" autocomplete="off" novalidate>
            <div class="input-icon">
              <span class="input-icon-addon">
                <i class="bi bi-search"></i>
              </span>
              <input type="text" value="<%=request.getParameter("search")!=null?request.getParameter("search"):"" %>" class="form-control" placeholder="Search" name="search" aria-label="Search in website" />
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</header>
