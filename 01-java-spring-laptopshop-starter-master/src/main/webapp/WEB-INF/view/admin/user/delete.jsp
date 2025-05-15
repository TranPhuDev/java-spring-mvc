<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Delete User</title>
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
      .delete-card {
        border: none;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
        max-width: 500px;
        margin: 0 auto;
      }
      .delete-header {
        background: linear-gradient(135deg, #dc3545 0%, #1a1b24 100%);
        color: white;
        border-radius: 15px 15px 0 0 !important;
        padding: 1.5rem;
      }
      .warning-icon {
        font-size: 4rem;
        color: #dc3545;
        margin-bottom: 1rem;
      }
      .btn {
        padding: 0.6rem 1.5rem;
        border-radius: 8px;
        font-weight: 500;
      }
      .btn-danger {
        background: linear-gradient(135deg, #dc3545 0%, #1a1b24 100%);
        border: none;
      }
      .btn-danger:hover {
        background: linear-gradient(135deg, #bb2d3b 0%, #15161d 100%);
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
            <h1 class="mt-4">Manage Users</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item"><a href="/admin/user">Users</a></li>
              <li class="breadcrumb-item active">Delete User</li>
            </ol>
            <div class="row">
              <div class="col-12">
                <div class="card delete-card">
                  <div class="delete-header text-center">
                    <h3 class="mb-0">Delete User</h3>
                  </div>
                  <div class="card-body text-center p-4">
                    <div class="warning-icon">
                      <i class="fas fa-exclamation-triangle"></i>
                    </div>
                    <h4 class="mb-3">
                      Are you sure you want to delete this user?
                    </h4>
                    <p class="text-muted mb-4">
                      This action cannot be undone. All user data will be
                      permanently deleted.
                    </p>

                    <form:form
                      method="post"
                      action="/admin/user/delete"
                      modelAttribute="newUser"
                    >
                      <div style="display: none">
                        <form:input type="text" path="id" value="${id}" />
                      </div>
                      <div class="d-flex justify-content-center gap-3">
                        <button type="submit" class="btn btn-danger">
                          <i class="fas fa-trash me-2"></i>Delete User
                        </button>
                        <a href="/admin/user" class="btn btn-secondary">
                          <i class="fas fa-times me-2"></i>Cancel
                        </a>
                      </div>
                    </form:form>
                  </div>
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
