<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update User</title>
    <!-- Latest compiled and minified CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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

    <link href="/css/styles.css" rel="stylesheet" />
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
              <li class="breadcrumb-item active">Update User</li>
            </ol>
            <div class="row">
              <div class="col-md-6 col-12 mx-auto">
                <div class="card">
                  <div class="card-header">
                    <h3 class="mb-0">Update User</h3>
                  </div>
                  <div class="card-body">
                    <form:form
                      method="post"
                      action="/admin/user/update"
                      modelAttribute="newUser"
                      enctype="multipart/form-data"
                    >
                      <div class="mb-3" style="display: none">
                        <label class="form-label">ID</label>
                        <form:input
                          type="text"
                          class="form-control"
                          path="id"
                        />
                      </div>
                      <div class="mb-3">
                        <label class="form-label">Email</label>
                        <form:input
                          type="email"
                          class="form-control"
                          path="email"
                          disabled="true"
                        />
                      </div>

                      <div class="mb-3">
                        <label for="exampleInputPhoneNumber1" class="form-label"
                          >Phone number</label
                        >
                        <form:input
                          type="text"
                          class="form-control"
                          path="phone"
                        />
                      </div>
                      <div class="mb-3">
                        <label for="exampleInputFullName1" class="form-label"
                          >Full name</label
                        >
                        <form:input
                          type="text"
                          class="form-control"
                          path="fullName"
                        />
                      </div>
                      <div class="mb-3">
                        <label for="exampleInputAddress1" class="form-label"
                          >Address</label
                        >
                        <form:input
                          type="text"
                          class="form-control"
                          path="address"
                        />
                      </div>
                      <div class="row mb-3">
                        <div class="col">
                          <label for="exampleInputRole1" class="form-label"
                            >Role</label
                          >
                          <form:select class="form-select" path="role.name">
                            <form:option value="ADMIN">ADMIN</form:option>
                            <form:option value="USER">USER</form:option>
                          </form:select>
                        </div>
                        <div class="col">
                          <label for="avatarFile" class="form-label"
                            >Avatar:</label
                          >
                          <input
                            class="form-control"
                            type="file"
                            id="avatarFile"
                            accept=".png, .jpg, .jpeg"
                            name="uploadFile"
                          />
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col d-flex justify-content-center">
                          <img
                            style="max-height: 250px; display: none"
                            id="avatarPreview"
                            alt="avatar preview"
                            class="img-thumbnail"
                          />
                        </div>
                      </div>
                      <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-primary">
                          Update
                        </button>
                        <a href="/admin/user" class="btn btn-secondary"
                          >Back to List</a
                        >
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
