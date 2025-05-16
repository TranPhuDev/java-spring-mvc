<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Product Management</title>
                    <!-- Latest compiled and minified CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet" />

                    <!-- Latest compiled JavaScript -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                    <!-- Font Awesome -->
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

                    <link href="/css/styles.css" rel="stylesheet" />
                    <style>
                        .product-image {
                            width: 80px;
                            height: 80px;
                            object-fit: cover;
                            border-radius: 8px;
                        }

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

                        .status-badge {
                            padding: 0.35em 0.65em;
                            font-size: 0.75em;
                            font-weight: 600;
                            border-radius: 0.25rem;
                        }

                        .status-in-stock {
                            background-color: #d1e7dd;
                            color: #0f5132;
                        }

                        .status-low-stock {
                            background-color: #fff3cd;
                            color: #856404;
                        }

                        .status-out-of-stock {
                            background-color: #f8d7da;
                            color: #842029;
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
                                        <h1 class="mb-0">Product Management</h1>
                                        <a href="/admin/product/create" class="btn btn-primary">
                                            <i class="fas fa-plus"></i> Add New Product
                                        </a>
                                    </div>

                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Products</li>
                                    </ol>

                                    <c:if test="${not empty successMessage}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            ${successMessage}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                aria-label="Close"></button>
                                        </div>
                                    </c:if>

                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-table me-1"></i>
                                            Product List
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 60px">Image</th>
                                                            <th>Name</th>
                                                            <th>Price</th>
                                                            <th>Stock</th>
                                                            <th>Sold</th>
                                                            <th>Status</th>
                                                            <th style="width: 200px">Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${product}" var="product">
                                                            <tr>
                                                                <td class="text-center">
                                                                    <img src="/images/product/${product.image}"
                                                                        alt="${product.name}" class="product-image">
                                                                </td>
                                                                <td>
                                                                    <div class="fw-bold">${product.name}</div>
                                                                    <small class="text-muted">ID: ${product.id}</small>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" /> đ
                                                                </td>
                                                                <td>${product.quantity}</td>
                                                                <td>${product.sold}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${product.quantity > 10}">
                                                                            <span
                                                                                class="status-badge status-in-stock">In
                                                                                Stock</span>
                                                                        </c:when>
                                                                        <c:when test="${product.quantity > 0}">
                                                                            <span
                                                                                class="status-badge status-low-stock">Low
                                                                                Stock</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span
                                                                                class="status-badge status-out-of-stock">Out
                                                                                of Stock</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                                <td class="action-buttons">
                                                                    <a href="/admin/product/${product.id}"
                                                                        class="btn btn-info btn-sm"
                                                                        title="View Details">
                                                                        <i class="fas fa-eye"></i>
                                                                    </a>
                                                                    <a href="/admin/product/update/${product.id}"
                                                                        class="btn btn-warning btn-sm"
                                                                        title="Edit Product">
                                                                        <i class="fas fa-edit"></i>
                                                                    </a>
                                                                    <a href="/admin/product/delete/${product.id}"
                                                                        class="btn btn-danger btn-sm"
                                                                        title="Delete Product">
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