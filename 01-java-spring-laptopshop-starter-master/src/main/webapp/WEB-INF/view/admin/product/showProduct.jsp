<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Document</title>
                    <!-- Latest compiled and minified CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet" />

                    <!-- Latest compiled JavaScript -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                    <link href="/css/styles.css" rel="stylesheet" />
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />

                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container mt-5 mx-auto">
                                    <!-- Toast Notification -->
                                    <div class="position-fixed top-0 end-0 p-3" style="z-index: 10000">
                                        <div id="successToast" class="toast" role="alert" aria-live="assertive"
                                            aria-atomic="true" data-bs-autohide="true" data-bs-delay="3000">
                                            <div class="toast-header" id="toastHeader">
                                                <strong class="me-auto" id="toastTitle">Success</strong>
                                                <button type="button" class="btn-close btn-close-white"
                                                    data-bs-dismiss="toast" aria-label="Close"></button>
                                            </div>
                                            <div class="toast-body" id="toastBody">${successMessage}</div>
                                        </div>
                                    </div>
                                    <!-- Toast Notification -->
                                    <div class="position-fixed top-0 end-0 p-3" style="z-index: 10000">
                                        <div id="successToast" class="toast" role="alert" aria-live="assertive"
                                            aria-atomic="true" data-bs-autohide="true" data-bs-delay="3000">
                                            <div class="toast-header" id="toastHeader">
                                                <strong class="me-auto" id="toastTitle">Success</strong>
                                                <button type="button" class="btn-close btn-close-white"
                                                    data-bs-dismiss="toast" aria-label="Close"></button>
                                            </div>
                                            <div class="toast-body" id="toastBody">${successMessage}</div>
                                        </div>
                                    </div>

                                    <h1 class="mt-4">Manage Products</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Products</li>
                                    </ol>
                                    <div class="row mt-5">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>List Users</h3>
                                                <a href="/admin/product/create" class="btn btn-primary">Create
                                                    Product</a>
                                            </div>
                                        </div>
                                        <div class="col-12 mt-3">
                                            <table class="table table-hover table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Factory</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="product" items="${product}">
                                                        <tr>
                                                            <th>${product.id}</th>
                                                            <td>${product.name}</td>
                                                            <td>
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.price}" /> đ
                                                            </td>
                                                            <td>${product.factory}</td>
                                                            <td>
                                                                <a href="/admin/product/${product.id}" type="button"
                                                                    class="btn btn-success">View</a>
                                                                <a href="/admin/product/update/${product.id}"
                                                                    type="button" class="btn btn-danger mx-2">Update</a>
                                                                <a href="/admin/product/delete/${product.id}"
                                                                    type="button" class="btn btn-warning">Delete</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
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
                    <script>
                        // Show toast if there's a success message
                        document.addEventListener("DOMContentLoaded", function () {
                            const successMessage = "${successMessage}";
                            if (successMessage) {
                                const toastEl = document.getElementById("successToast");
                                const toastHeader = document.getElementById("toastHeader");
                                const toastTitle = document.getElementById("toastTitle");

                                // Set toast style based on message content
                                if (successMessage.includes("created")) {
                                    toastHeader.className = "toast-header bg-success text-white";
                                    toastTitle.textContent = "Success";
                                } else if (successMessage.includes("updated")) {
                                    toastHeader.className = "toast-header bg-primary text-white";
                                    toastTitle.textContent = "Updated";
                                } else if (successMessage.includes("deleted")) {
                                    toastHeader.className = "toast-header bg-danger text-white";
                                    toastTitle.textContent = "Deleted";
                                }

                                const toast = new bootstrap.Toast(toastEl, {
                                    autohide: true,
                                    delay: 3000,
                                });
                                toast.show();
                            }
                        });
                    </script>
                </body>

                </html>