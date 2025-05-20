<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Account - Laptopshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
      rel="stylesheet"
    />

    <!-- Icon Font Stylesheet -->
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link
      href="/client/lib/owlcarousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet" />
  </head>

  <body>
    <!-- Spinner Start -->
    <div
      id="spinner"
      class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center"
    >
      <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <jsp:include page="../layout/header.jsp" />

    <!-- Account Page Start -->
    <div class="container-fluid py-5">
      <!-- Toast Container -->
      <div class="position-fixed top-0 end-0 p-3" style="z-index: 11">
        <div
          id="successToast"
          class="toast align-items-center text-white bg-success border-0"
          role="alert"
          aria-live="assertive"
          aria-atomic="true"
        >
          <div class="d-flex">
            <div class="toast-body">
              <i class="fas fa-check-circle me-2"></i>
              <span id="toastMessage"></span>
            </div>
            <button
              type="button"
              class="btn-close btn-close-white me-2 m-auto"
              data-bs-dismiss="toast"
              aria-label="Close"
            ></button>
          </div>
        </div>
      </div>

      <div class="container" style="margin-top: 150px">
        <div class="row g-4">
          <!-- Profile Card -->
          <div class="col-lg-4">
            <div class="card border-0 shadow-sm">
              <div class="card-header bg-primary text-white py-4">
                <div class="text-center">
                  <img
                    src="/images/avatar/${user.avatar}"
                    alt="Profile"
                    class="rounded-circle mb-3"
                    style="
                      width: 120px;
                      height: 120px;
                      object-fit: cover;
                      border: 3px solid white;
                    "
                  />
                  <h5 class="mb-1">${user.fullName}</h5>
                  <p class="mb-0 opacity-75">${user.email}</p>
                </div>
              </div>
              <div class="card-body">
                <div
                  class="nav flex-column nav-pills"
                  id="v-pills-tab"
                  role="tablist"
                >
                  <button
                    class="nav-link ${empty showPasswordForm ? 'active' : ''} mb-2"
                    data-bs-toggle="pill"
                    data-bs-target="#profile"
                    type="button"
                  >
                    <i class="fas fa-user me-2"></i>Profile Information
                  </button>
                  <button
                    class="nav-link ${not empty showPasswordForm ? 'active' : ''}"
                    data-bs-toggle="pill"
                    data-bs-target="#password"
                    type="button"
                  >
                    <i class="fas fa-lock me-2"></i>Change Password
                  </button>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Area -->
          <div class="col-lg-8">
            <div class="card border-0 shadow-sm">
              <div class="card-body p-4">
                <div class="tab-content" id="v-pills-tabContent">
                  <!-- Profile Information -->
                  <div
                    class="tab-pane fade ${empty showPasswordForm ? 'show active' : ''}"
                    id="profile"
                  >
                    <h4 class="mb-4">Profile Information</h4>
                    <form:form
                      method="post"
                      action="/account/update"
                      modelAttribute="user"
                    >
                      <div class="row g-3">
                        <div class="col-md-6">
                          <label class="form-label">Full Name</label>
                          <form:input
                            type="text"
                            class="form-control"
                            path="fullName"
                          />
                        </div>
                        <div class="col-md-6">
                          <label class="form-label">Email</label>
                          <form:input
                            type="email"
                            class="form-control"
                            path="email"
                            readonly="true"
                          />
                        </div>
                        <div class="col-md-6">
                          <label class="form-label">Phone Number</label>
                          <form:input
                            type="tel"
                            class="form-control"
                            path="phone"
                          />
                        </div>
                        <div class="col-12">
                          <label class="form-label">Address</label>
                          <form:textarea
                            class="form-control"
                            path="address"
                            rows="3"
                          />
                        </div>
                        <div class="col-12">
                          <button type="submit" class="btn btn-primary px-4">
                            <i class="fas fa-save me-2"></i>Save Changes
                          </button>
                        </div>
                      </div>
                    </form:form>
                  </div>

                  <!-- Change Password -->
                  <div
                    class="tab-pane fade ${not empty showPasswordForm ? 'show active' : ''}"
                    id="password"
                  >
                    <h4 class="mb-4">Change Password</h4>
                    <form:form
                      method="post"
                      action="/account/change-password"
                      modelAttribute="passwordChange"
                    >
                      <div class="row g-3">
                        <div class="col-12">
                          <label class="form-label">Current Password</label>
                          <div class="position-relative">
                            <c:set var="errorCurrentPassword">
                              <form:errors
                                path="currentPassword"
                                cssClass="invalid-feedback"
                              />
                            </c:set>
                            <form:password
                              class="form-control ${not empty errorCurrentPassword ? 'is-invalid' : ''}"
                              path="currentPassword"
                            />
                            ${errorCurrentPassword}
                            <c:if test="${empty errorCurrentPassword}">
                              <i
                                class="fas fa-eye position-absolute end-0 top-50 translate-middle-y me-3"
                                style="cursor: pointer"
                                onclick="togglePassword(this)"
                              ></i>
                            </c:if>
                          </div>
                        </div>
                        <div class="col-12">
                          <label class="form-label">New Password</label>
                          <div class="position-relative">
                            <c:set var="errorNewPassword">
                              <form:errors
                                path="newPassword"
                                cssClass="invalid-feedback"
                              />
                            </c:set>
                            <form:password
                              class="form-control ${not empty errorNewPassword ? 'is-invalid' : ''}"
                              path="newPassword"
                            />
                            ${errorNewPassword}
                            <c:if test="${empty errorNewPassword}">
                              <i
                                class="fas fa-eye position-absolute end-0 top-50 translate-middle-y me-3"
                                style="cursor: pointer"
                                onclick="togglePassword(this)"
                              ></i>
                            </c:if>
                          </div>
                        </div>
                        <div class="col-12">
                          <label class="form-label">Confirm New Password</label>
                          <div class="position-relative">
                            <c:set var="errorConfirmPassword">
                              <form:errors
                                path="confirmPassword"
                                cssClass="invalid-feedback"
                              />
                            </c:set>
                            <form:password
                              class="form-control ${not empty errorConfirmPassword ? 'is-invalid' : ''}"
                              path="confirmPassword"
                            />
                            ${errorConfirmPassword}
                            <c:if test="${empty errorConfirmPassword}">
                              <i
                                class="fas fa-eye position-absolute end-0 top-50 translate-middle-y me-3"
                                style="cursor: pointer"
                                onclick="togglePassword(this)"
                              ></i>
                            </c:if>
                          </div>
                        </div>
                        <div class="col-12">
                          <button type="submit" class="btn btn-primary px-4">
                            <i class="fas fa-key me-2"></i>Update Password
                          </button>
                        </div>
                      </div>
                    </form:form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Account Page End -->

    <script>
      function togglePassword(icon) {
        const input = icon.previousElementSibling;
        if (input.type === "password") {
          input.type = "text";
          icon.classList.remove("fa-eye");
          icon.classList.add("fa-eye-slash");
        } else {
          input.type = "password";
          icon.classList.remove("fa-eye-slash");
          icon.classList.add("fa-eye");
        }
      }
    </script>

    <jsp:include page="../layout/footer.jsp" />

    <!-- Back to Top -->
    <a
      href="#"
      class="btn btn-primary border-3 border-primary rounded-circle back-to-top"
      ><i class="fa fa-arrow-up"></i
    ></a>

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/client/js/main.js"></script>
  </body>
</html>
