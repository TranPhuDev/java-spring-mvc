<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create User</title>
    <!-- Latest compiled and minified CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="/css/styles.css" rel="stylesheet" />
    <script>
      $(document).ready(() => {
        const avatarFile = $("#avatarFile");
        avatarFile.change(function (e) {
          const imgURL = URL.createObjectURL(e.target.files[0]);
          $("#avatarPreview").attr("src", imgURL);
          $("#avatarPreview").css({ display: "block" });
        });
      });
    </script>
    <style>
      .card {
        border: none;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
      }
      .card-header {
        background: linear-gradient(135deg, #6b73ff 0%, #1a1b24 100%);
        color: white;
        border-radius: 15px 15px 0 0 !important;
        padding: 1.5rem;
      }
      .form-control,
      .form-select {
        border-radius: 8px;
        padding: 0.6rem 1rem;
      }
      .form-control:focus,
      .form-select:focus {
        box-shadow: 0 0 0 0.25rem rgba(107, 115, 255, 0.25);
        border-color: #6b73ff;
      }
      .btn {
        padding: 0.6rem 1.5rem;
        border-radius: 8px;
        font-weight: 500;
      }
      .btn-primary {
        background: linear-gradient(135deg, #6b73ff 0%, #1a1b24 100%);
        border: none;
      }
      .btn-primary:hover {
        background: linear-gradient(135deg, #5a62e0 0%, #15161d 100%);
      }
      .img-thumbnail {
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
              <li class="breadcrumb-item active">Create User</li>
            </ol>
            <div class="row">
              <div class="col-md-8 col-12 mx-auto">
                <div class="card">
                  <div class="card-header">
                    <h3 class="mb-0">Create New User</h3>
                  </div>
                  <div class="card-body">
                    <form:form
                      method="post"
                      action="/admin/user/create"
                      modelAttribute="newUser"
                      enctype="multipart/form-data"
                    >
                      <div class="row">
                        <div class="col-md-6">
                          <div class="mb-3">
                            <label class="form-label">Email</label>
                            <form:input
                              type="email"
                              class="form-control"
                              path="email"
                              required="true"
                            />
                          </div>
                          <div class="mb-3">
                            <label class="form-label">Password</label>
                            <form:input
                              type="password"
                              class="form-control"
                              path="password"
                              required="true"
                            />
                          </div>
                          <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <form:input
                              type="text"
                              class="form-control"
                              path="fullName"
                              required="true"
                            />
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="mb-3">
                            <label class="form-label">Phone Number</label>
                            <form:input
                              type="text"
                              class="form-control"
                              path="phone"
                              required="true"
                            />
                          </div>
                          <div class="mb-3">
                            <label class="form-label">Address</label>
                            <form:input
                              type="text"
                              class="form-control"
                              path="address"
                              required="true"
                            />
                          </div>
                          <div class="mb-3">
                            <label class="form-label">Role</label>
                            <form:select
                              class="form-select"
                              path="role.name"
                              required="true"
                            >
                              <form:option value="ADMIN">ADMIN</form:option>
                              <form:option value="USER">USER</form:option>
                            </form:select>
                          </div>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col-md-6">
                          <label class="form-label">Avatar</label>
                          <input
                            class="form-control"
                            type="file"
                            id="avatarFile"
                            accept=".png, .jpg, .jpeg"
                            name="uploadFile"
                            required="true"
                          />
                        </div>
                        <div class="col-md-6">
                          <div
                            class="d-flex justify-content-center align-items-center h-100"
                          >
                            <img
                              style="max-height: 200px; display: none"
                              id="avatarPreview"
                              alt="avatar preview"
                              class="img-thumbnail"
                            />
                          </div>
                        </div>
                      </div>
                      <div class="d-flex justify-content-between mt-4">
                        <button type="submit" class="btn btn-primary">
                          <i class="fas fa-save me-2"></i>Create User
                        </button>
                        <a href="/admin/user" class="btn btn-secondary">
                          <i class="fas fa-arrow-left me-2"></i>Back to List
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
