<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="utf-8" />
          <meta http-equiv="X-UA-Compatible" content="IE=edge" />
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
          <meta name="description" content="Phu Dev - Dự án laptopshop" />
          <meta name="author" content="Phu Dev" />
          <title>Update Order</title>
          <link href="/css/styles.css" rel="stylesheet" />
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
          <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
          <style>
            .form-label {
              font-weight: 500;
              color: #2c3e50;
            }

            .form-control,
            .form-select {
              border-radius: 8px;
              border: 1px solid #e9ecef;
              padding: 0.6rem 1rem;
            }

            .form-control:focus,
            .form-select:focus {
              border-color: #3498db;
              box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }

            .order-info {
              background-color: #f8f9fa;
              border-radius: 8px;
              padding: 1rem;
              margin-bottom: 1.5rem;
            }

            .order-info-label {
              color: #6c757d;
              font-size: 0.875rem;
            }

            .order-info-value {
              color: #2c3e50;
              font-weight: 500;
            }

            .update-btn {
              padding: 0.6rem 2rem;
              border-radius: 8px;
              transition: all 0.3s;
            }

            .update-btn:hover {
              transform: translateY(-2px);
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
                    <h1 class="h3 mb-0 text-gray-800">Update Order</h1>
                    <div class="breadcrumb mb-0">
                      <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                          <a href="/admin" class="text-decoration-none">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item">
                          <a href="/admin/order" class="text-decoration-none">Orders</a>
                        </li>
                        <li class="breadcrumb-item active">Update</li>
                      </ol>
                    </div>
                  </div>

                  <div class="row mt-4">
                    <div class="col-md-8 col-lg-6 mx-auto">
                      <div class="card shadow-sm">
                        <div class="card-header bg-white py-3">
                          <h5 class="card-title mb-0">
                            <i class="fas fa-edit me-2 text-warning"></i>
                            Update Order Information
                          </h5>
                        </div>
                        <div class="card-body">
                          <form:form method="post" action="/admin/order/update" modelAttribute="newOrder">
                            <div class="mb-3" style="display: none">
                              <form:input type="text" class="form-control" path="id" />
                            </div>

                            <div class="order-info">
                              <div class="row mb-2">
                                <div class="col-6">
                                  <div class="order-info-label">Order ID</div>
                                  <div class="order-info-value">#${newOrder.id}</div>
                                </div>
                                <div class="col-6">
                                  <div class="order-info-label">Total Price</div>
                                  <div class="order-info-value">
                                    <fmt:formatNumber type="number" value="${newOrder.totalPrice}" />
                                    đ
                                  </div>
                                </div>
                              </div>
                            </div>

                            <div class="mb-4">
                              <label class="form-label">Customer Name</label>
                              <div class="input-group">
                                <span class="input-group-text bg-light">
                                  <i class="fas fa-user text-primary"></i>
                                </span>
                                <form:input type="text" class="form-control" disabled="true" path="user.fullName" />
                              </div>
                            </div>

                            <div class="mb-4">
                              <label class="form-label">Order Status</label>
                              <div class="input-group">
                                <span class="input-group-text bg-light">
                                  <i class="fas fa-tag text-primary"></i>
                                </span>
                                <form:select class="form-select" path="status">
                                  <form:option value="PENDING">PENDING</form:option>
                                  <form:option value="SHIPPING">SHIPPING</form:option>
                                  <form:option value="COMPLETE">COMPLETE</form:option>
                                  <form:option value="CANCEL">CANCEL</form:option>
                                </form:select>
                              </div>
                            </div>

                            <div class="d-grid">
                              <button type="submit" class="btn btn-warning update-btn">
                                <i class="fas fa-save me-2"></i>Update Order
                              </button>
                            </div>
                          </form:form>
                          <div class="mt-3 text-center">
                            <a href="/admin/order" class="btn btn-outline-secondary cancel-btn">
                              <i class="fas fa-arrow-left me-2"></i>Back to Orders
                            </a>
                          </div>
                        </div>
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