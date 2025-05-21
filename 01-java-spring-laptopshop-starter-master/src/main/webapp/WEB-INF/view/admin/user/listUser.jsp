<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>User Management</title>
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <!-- Latest compiled JavaScript -->
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
        <link href="/css/styles.css" rel="stylesheet" />
        <style>
          .action-buttons .btn {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
            width: 32px;
            height: 32px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin: 0 2px;
          }

          .action-buttons .btn i {
            margin: 0;
          }

          .table th {
            background-color: #f8f9fa;
            font-weight: 600;
          }

          .role-badge {
            padding: 0.35em 0.65em;
            font-size: 0.75em;
            font-weight: 600;
            border-radius: 0.25rem;
          }

          .role-admin {
            background-color: #cfe2ff;
            color: #084298;
          }

          .role-user {
            background-color: #d1e7dd;
            color: #0f5132;
          }

          .user-avatar {
            width: 40px;
            height: 40px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
          }
        </style>
      </head>

      <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp" />
        <div id="layoutSidenav">
          <jsp:include page="../layout/sidebar.jsp" />

          <div id="layoutSidenav_content">
            <main>
              <div class="container-fluid px-4">
                <div class="d-flex justify-content-between align-items-center mt-4">
                  <h1 class="mb-0">User Management</h1>
                  <a href="/admin/user/create" class="btn btn-primary">
                    <i class="fas fa-user-plus"></i> Add New User
                  </a>
                </div>

                <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                  <li class="breadcrumb-item active">Users</li>
                </ol>

                <c:if test="${not empty successMessage}">
                  <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                  </div>
                </c:if>

                <div class="card mb-4">
                  <div class="card-header">
                    <i class="fas fa-users me-1"></i>
                    User List
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-hover table-bordered">
                        <thead>
                          <tr>
                            <th style="width: 60px">Avatar</th>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>Role</th>
                            <th style="width: 150px">Actions</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="user" items="${user1}">
                            <tr>
                              <td class="text-center">
                                <img src="/images/avatar/${user.avatar}" alt="${user.fullName}" class="user-avatar"
                                  onerror="this.src='/images/avatar/default.jpg'">
                              </td>
                              <td>${user.id}</td>
                              <td>
                                <div class="fw-bold">${user.email}</div>
                                <small class="text-muted">User ID: ${user.id}</small>
                              </td>
                              <td>${user.fullName}</td>
                              <td>
                                <span class="role-badge ${user.role.name == 'ADMIN' ? 'role-admin' : 'role-user'}">
                                  ${user.role.name}
                                </span>
                              </td>
                              <td class="action-buttons">
                                <a href="/admin/user/${user.id}" class="btn btn-info btn-sm" title="View Details">
                                  <i class="fas fa-eye"></i>
                                </a>
                                <a href="/admin/user/update/${user.id}" class="btn btn-warning btn-sm"
                                  title="Edit User">
                                  <i class="fas fa-edit"></i>
                                </a>
                                <a href="/admin/user/delete/${user.id}" class="btn btn-danger btn-sm"
                                  title="Delete User">
                                  <i class="fas fa-trash"></i>
                                </a>
                              </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>

                <!-- Pagination -->
                <div class="d-flex justify-content-center mt-4">
                  <nav aria-label="Page navigation" style="white-space: nowrap;">
                    <ul class="pagination" style="display: inline-flex; flex-wrap: nowrap;">
                      <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <c:choose>
                          <c:when test="${currentPage == 1}">
                            <span class="page-link" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </span>
                          </c:when>
                          <c:otherwise>
                            <a class="page-link" href="/admin/user?page=${currentPage - 1}" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </c:otherwise>
                        </c:choose>
                      </li>
                      <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                        <li class="page-item">
                          <a class="page-link ${loop.index eq currentPage ? 'active' : ''}"
                            href="/admin/user?page=${loop.index}">${loop.index}</a>
                        </li>
                      </c:forEach>
                      <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <c:choose>
                          <c:when test="${currentPage == totalPages}">
                            <span class="page-link" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </span>
                          </c:when>
                          <c:otherwise>
                            <a class="page-link" href="/admin/user?page=${currentPage + 1}" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </a>
                          </c:otherwise>
                        </c:choose>
                      </li>
                    </ul>
                  </nav>
                </div>
              </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
          </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
      </body>

      </html>