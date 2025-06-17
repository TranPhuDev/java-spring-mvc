<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Phu Dev - Dự án laptopshop" />
                <meta name="author" content="Phu Dev" />
                <title>Delete Order</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
                    rel="stylesheet" />
                <style>
                    .delete-icon {
                        font-size: 4rem;
                        color: #dc3545;
                        margin-bottom: 1rem;
                    }

                    .delete-btn {
                        padding: 0.6rem 2rem;
                        border-radius: 8px;
                        transition: all 0.3s;
                    }

                    .delete-btn:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 4px 8px rgba(220, 53, 69, 0.2);
                    }

                    .cancel-btn {
                        padding: 0.6rem 2rem;
                        border-radius: 8px;
                        transition: all 0.3s;
                    }

                    .cancel-btn:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 4px 8px rgba(108, 117, 125, 0.2);
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
                                    <h1 class="h3 mb-0 text-gray-800">Delete Order</h1>
                                    <div class="breadcrumb mb-0">
                                        <ol class="breadcrumb mb-0">
                                            <li class="breadcrumb-item">
                                                <a href="/admin" class="text-decoration-none">Dashboard</a>
                                            </li>
                                            <li class="breadcrumb-item">
                                                <a href="/admin/order" class="text-decoration-none">Orders</a>
                                            </li>
                                            <li class="breadcrumb-item active">Delete</li>
                                        </ol>
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <div class="col-md-6 col-lg-4 mx-auto">
                                        <div class="card shadow-sm">
                                            <div class="card-body text-center p-5">
                                                <i class="fas fa-exclamation-triangle delete-icon"></i>
                                                <h4 class="mb-4">Delete Order #${id}</h4>
                                                <p class="text-muted mb-4">
                                                    Are you sure you want to delete this order? This action
                                                    cannot be undone.
                                                </p>

                                                <form:form method="post" action="/admin/order/delete"
                                                    modelAttribute="newOrder">
                                                    <div class="mb-3" style="display: none">
                                                        <form:input value="${id}" type="text" class="form-control"
                                                            path="id" />
                                                    </div>

                                                    <div class="d-flex justify-content-center gap-3">
                                                        <a href="/admin/order" class="btn btn-secondary cancel-btn">
                                                            <i class="fas fa-times me-2"></i>Cancel
                                                        </a>
                                                        <button type="submit" class="btn btn-danger delete-btn">
                                                            <i class="fas fa-trash me-2"></i>Delete
                                                        </button>
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
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>