<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Detail ${id}</title>
    <!-- Latest compiled and minified CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="/css/styles.css" rel="stylesheet" />
    <style>
      .profile-header {
        background: linear-gradient(135deg, #6b73ff 0%, #1a1b24 100%);
        color: white;
        padding: 2rem;
        border-radius: 15px;
        margin-bottom: 2rem;
      }

      .avatar-container {
        width: 150px;
        height: 150px;
        margin: 0 auto;
        position: relative;
      }

      .avatar-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 50%;
        border: 4px solid white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .info-card {
        background: white;
        border-radius: 15px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        padding: 1.5rem;
        margin-bottom: 1rem;
      }

      .info-label {
        color: #6c757d;
        font-size: 0.9rem;
        margin-bottom: 0.25rem;
      }

      .info-value {
        color: #212529;
        font-size: 1.1rem;
        font-weight: 500;
      }

      .action-buttons {
        margin-top: 2rem;
      }

      .action-buttons .btn {
        margin-right: 0.5rem;
        padding: 0.5rem 1.5rem;
        border-radius: 8px;
      }
    </style>
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />

      <div id="layoutSidenav_content">
        <main>
          <div class="container mt-5">
            <h1 class="mt-4">User Details</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item"><a href="/admin/user">Users</a></li>
              <li class="breadcrumb-item active">User Details</li>
            </ol>

            <div class="row">
              <div class="col-12 mx-auto">
                <div class="profile-header text-center">
                  <div class="avatar-container mb-3">
                    <img
                      src="/images/avatar/${user.avatar}"
                      alt="User Avatar"
                      class="avatar-image"
                    />
                  </div>
                  <h2 class="mb-2">${user.fullName}</h2>
                  <p class="mb-0">${user.role.name}</p>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <div class="info-card">
                      <div class="info-label">Email Address</div>
                      <div class="info-value">${user.email}</div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="info-card">
                      <div class="info-label">User ID</div>
                      <div class="info-value">${user.id}</div>
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="info-card">
                      <div class="info-label">Address</div>
                      <div class="info-value">${user.address}</div>
                    </div>
                  </div>
                </div>

                <div class="action-buttons text-center">
                  <a
                    href="/admin/user/update/${user.id}"
                    class="btn btn-primary"
                  >
                    <i class="fas fa-edit"></i> Edit User
                  </a>
                  <a
                    href="/admin/user/delete/${user.id}"
                    class="btn btn-danger"
                  >
                    <i class="fas fa-trash"></i> Delete User
                  </a>
                  <a href="/admin/user" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back to List
                  </a>
                </div>
              </div>
            </div>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/scripts.js"></script>
    <!-- Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
  </body>
</html>
