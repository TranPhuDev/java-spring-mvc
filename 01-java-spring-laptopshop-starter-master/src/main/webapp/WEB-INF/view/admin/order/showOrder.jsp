<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Dự án laptopshop" />
        <meta name="author" content="Phu Dev" />
        <title>Manager Orders</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <style>
          .order-card {
            transition: transform 0.2s;
            border: none;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
          }

          .order-card:hover {
            transform: translateY(-5px);
          }

          .status-badge {
            padding: 0.5em 1em;
            border-radius: 50px;
            font-weight: 500;
          }

          .status-pending {
            background-color: #fff3cd;
            color: #856404;
          }

          .status-shipping {
            background-color: #cce5ff;
            color: #004085;
          }

          .status-complete {
            background-color: #d4edda;
            color: #155724;
          }

          .status-cancel {
            background-color: #f8d7da;
            color: #721c24;
          }

          .action-btn {
            padding: 0.5rem 1rem;
            border-radius: 50px;
            transition: all 0.3s;
          }

          .action-btn:hover {
            transform: scale(1.05);
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
                  <h1 class="h3 mb-0 text-gray-800">Order Management</h1>
                  <div class="breadcrumb mb-0">
                    <ol class="breadcrumb mb-0">
                      <li class="breadcrumb-item">
                        <a href="/admin" class="text-decoration-none">Dashboard</a>
                      </li>
                      <li class="breadcrumb-item active">Orders</li>
                    </ol>
                  </div>
                </div>

                <div class="row mt-4">
                  <div class="col-12">
                    <div class="card shadow-sm">
                      <div class="card-body">
                        <div class="table-responsive">
                          <table class="table table-hover align-middle">
                            <thead class="table-light">
                              <tr>
                                <th>ID</th>
                                <th>Total Price</th>
                                <th>User</th>
                                <th>Status</th>
                                <th>Payment</th>
                                <th class="text-center">Actions</th>
                              </tr>
                            </thead>
                            <tbody>
                              <c:choose>
                                <c:when test="${empty orders}">
                                  <tr>
                                    <td colspan="5" class="text-center py-4">
                                      <div class="text-muted">
                                        <i class="fas fa-shopping-cart me-2"></i>
                                        Không có dữ liệu đơn hàng
                                      </div>
                                    </td>
                                  </tr>
                                </c:when>
                                <c:otherwise>
                                  <c:forEach var="order" items="${orders}">
                                    <tr>
                                      <td class="fw-bold">#${order.id}</td>
                                      <td>
                                        <span class="fw-semibold">
                                          <fmt:formatNumber type="number" value="${order.totalPrice}" />
                                          đ
                                        </span>
                                      </td>
                                      <td>
                                        <div class="d-flex align-items-center">
                                          <i class="fas fa-user-circle me-2 text-primary"></i>
                                          ${order.user.fullName}
                                        </div>
                                      </td>
                                      <td>
                                        <span class="status-badge status-${order.status.toLowerCase()}">
                                          ${order.status}
                                        </span>
                                      </td>
                                      <td>
                                        <div class="">Status: ${order.paymentStatus}</div>
                                        <div class="">Ref: ${order.paymentRef}</div>
                                        <div class="">Method: ${order.paymentMethod}</div>
                                      </td>
                                      <td>
                                        <div class="d-flex justify-content-center gap-2">
                                          <a href="/admin/order/${order.id}"
                                            class="btn btn-sm btn-outline-primary action-btn">
                                            <i class="fas fa-eye me-1"></i> View
                                          </a>
                                          <a href="/admin/order/update/${order.id}"
                                            class="btn btn-sm btn-outline-warning action-btn">
                                            <i class="fas fa-edit me-1"></i> Edit
                                          </a>
                                          <a href="/admin/order/delete/${order.id}"
                                            class="btn btn-sm btn-outline-danger action-btn">
                                            <i class="fas fa-trash me-1"></i> Delete
                                          </a>
                                        </div>
                                      </td>
                                    </tr>
                                  </c:forEach>
                                </c:otherwise>
                              </c:choose>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>

                    <!-- Pagination -->
                    <div class="d-flex justify-content-center mt-4">
                      <nav aria-label="Page navigation" style="white-space: nowrap">
                        <ul class="pagination" style="display: inline-flex; flex-wrap: nowrap">
                          <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <c:choose>
                              <c:when test="${currentPage == 1}">
                                <span class="page-link" aria-label="Previous">
                                  <span aria-hidden="true">&laquo;</span>
                                </span>
                              </c:when>
                              <c:otherwise>
                                <a class="page-link" href="/admin/order?page=${currentPage - 1}" aria-label="Previous">
                                  <span aria-hidden="true">&laquo;</span>
                                </a>
                              </c:otherwise>
                            </c:choose>
                          </li>
                          <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                            <li class="page-item">
                              <a class="page-link ${loop.index eq currentPage ? 'active' : ''}"
                                href="/admin/order?page=${loop.index}">${loop.index}</a>
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
                                <a class="page-link" href="/admin/order?page=${currentPage + 1}" aria-label="Next">
                                  <span aria-hidden="true">&raquo;</span>
                                </a>
                              </c:otherwise>
                            </c:choose>
                          </li>
                        </ul>
                      </nav>
                    </div>
                  </div>
                </div>
              </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
          </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="/js/scripts.js"></script>
      </body>

      </html>