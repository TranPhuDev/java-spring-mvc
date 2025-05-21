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
                    <title>Order Details</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
                        rel="stylesheet">
                    <style>
                        .product-image {
                            width: 80px;
                            height: 80px;
                            object-fit: cover;
                            border-radius: 8px;
                            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                        }

                        .product-name {
                            color: #2c3e50;
                            text-decoration: none;
                            font-weight: 500;
                        }

                        .product-name:hover {
                            color: #3498db;
                        }

                        .quantity-input {
                            width: 80px;
                            text-align: center;
                            border: 1px solid #e9ecef;
                            border-radius: 6px;
                            padding: 0.375rem;
                        }

                        .back-btn {
                            transition: all 0.3s;
                        }

                        .back-btn:hover {
                            transform: translateX(-5px);
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
                                        <h1 class="h3 mb-0 text-gray-800">Order Details</h1>
                                        <div class="breadcrumb mb-0">
                                            <ol class="breadcrumb mb-0">
                                                <li class="breadcrumb-item"><a href="/admin"
                                                        class="text-decoration-none">Dashboard</a></li>
                                                <li class="breadcrumb-item"><a href="/admin/order"
                                                        class="text-decoration-none">Orders</a></li>
                                                <li class="breadcrumb-item active">Details</li>
                                            </ol>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col-12">
                                            <div class="card shadow-sm">
                                                <div class="card-header bg-white py-3">
                                                    <h5 class="card-title mb-0">
                                                        <i class="fas fa-shopping-cart me-2 text-primary"></i>
                                                        Order #${id} Details
                                                    </h5>
                                                </div>
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover align-middle">
                                                            <thead class="table-light">
                                                                <tr>
                                                                    <th>Product</th>
                                                                    <th>Name</th>
                                                                    <th>Price</th>
                                                                    <th>Quantity</th>
                                                                    <th>Total</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:if test="${empty orderDetails}">
                                                                    <tr>
                                                                        <td colspan="5" class="text-center py-4">
                                                                            <div class="text-muted">
                                                                                <i
                                                                                    class="fas fa-shopping-cart fa-2x mb-3"></i>
                                                                                <p class="mb-0">No products in this
                                                                                    order</p>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:if>
                                                                <c:forEach var="orderDetail" items="${orderDetails}">
                                                                    <tr>
                                                                        <td>
                                                                            <img src="/images/product/${orderDetail.product.image}"
                                                                                class="product-image"
                                                                                alt="${orderDetail.product.name}">
                                                                        </td>
                                                                        <td>
                                                                            <a href="/product/${orderDetail.product.id}"
                                                                                class="product-name" target="_blank">
                                                                                ${orderDetail.product.name}
                                                                            </a>
                                                                        </td>
                                                                        <td>
                                                                            <span class="fw-semibold">
                                                                                <fmt:formatNumber type="number"
                                                                                    value="${orderDetail.price}" /> đ
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <div class="quantity-input">
                                                                                ${orderDetail.quantity}
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <span class="fw-bold text-primary">
                                                                                <fmt:formatNumber type="number"
                                                                                    value="${orderDetail.price * orderDetail.quantity}" />
                                                                                đ
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="mt-4">
                                                        <a href="/admin/order" class="btn btn-outline-primary back-btn">
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