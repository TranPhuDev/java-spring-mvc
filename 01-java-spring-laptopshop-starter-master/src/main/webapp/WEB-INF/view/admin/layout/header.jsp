<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Document</title>
    </head>

    <body>
      <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/admin">
          <i class="fas fa-laptop me-2"></i>
          Laptopshop
        </a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
          <i class="fas fa-bars"></i>
        </button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
          <span style="color: white">Welcome
            <!-- <c:out value="${sessionScope.fullName}" /> -->
          </span>
          <!-- <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                    aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                        class="fas fa-search"></i></button>
            </div> -->
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" id="navbarDropdown" href="#" role="button"
              data-bs-toggle="dropdown" aria-expanded="false">
              <div class="d-flex align-items-center">
                <img class="rounded-circle me-2" style="width: 32px; height: 32px; object-fit: cover"
                  src="/images/avatar/${sessionScope.avatar}" onerror="this.src='/images/avatar/default.jpg'" />
                <span class="d-none d-md-inline-block">
                  <c:out value="${sessionScope.fullName}" />
                </span>
              </div>
            </a>
            <ul class="dropdown-menu dropdown-menu-end shadow-lg" aria-labelledby="navbarDropdown">
              <li class="px-3 py-2">
                <div class="d-flex align-items-center">
                  <img class="rounded-circle me-3" style="width: 48px; height: 48px; object-fit: cover"
                    src="/images/avatar/${sessionScope.avatar}" onerror="this.src='/images/avatar/default.jpg'" />
                  <div>
                    <div class="fw-bold">
                      <c:out value="${sessionScope.fullName}" />
                    </div>
                    <small class="text-muted">Administrator</small>
                  </div>
                </div>
              </li>
              <li>
                <hr class="dropdown-divider" />
              </li>
              <li>
                <a class="dropdown-item d-flex align-items-center" href="#!">
                  <i class="fas fa-cog me-2"></i>
                  Settings
                </a>
              </li>
              <li>
                <a class="dropdown-item d-flex align-items-center" href="#!">
                  <i class="fas fa-user me-2"></i>
                  Profile
                </a>
              </li>
              <li>
                <hr class="dropdown-divider" />
              </li>
              <li>
                <form action="/logout" method="post">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <button type="submit" class="dropdown-item d-flex align-items-center text-danger">
                    <i class="fas fa-sign-out-alt me-2"></i>
                    Đăng xuất
                  </button>
                </form>
              </li>
            </ul>
          </li>
        </ul>
      </nav>

      <style>
        .dropdown-menu {
          min-width: 280px;
          padding: 0.5rem 0;
          border: none;
          border-radius: 0.5rem;
        }

        .dropdown-item {
          padding: 0.5rem 1rem;
          transition: all 0.2s;
        }

        .dropdown-item:hover {
          background-color: #f8f9fa;
        }

        .dropdown-item.text-danger:hover {
          background-color: #dc3545;
          color: white !important;
        }

        .navbar-brand {
          font-weight: 600;
          letter-spacing: 0.5px;
        }

        .nav-link {
          padding: 0.5rem 1rem;
        }

        .nav-link img {
          border: 2px solid rgba(255, 255, 255, 0.2);
          transition: all 0.2s;
        }

        .nav-link:hover img {
          border-color: rgba(255, 255, 255, 0.5);
        }
      </style>
    </body>

    </html>