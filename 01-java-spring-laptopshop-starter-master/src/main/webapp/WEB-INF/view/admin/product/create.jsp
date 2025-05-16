<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Create Product</title>
                    <!-- Latest compiled and minified CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet" />
                    <!-- Latest compiled JavaScript -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script>
                        $(document).ready(() => {
                            const productImages = $("#productImages");
                            productImages.change(function (e) {
                                const imgURL = URL.createObjectURL(e.target.files[0]);
                                $("#productPreview").attr("src", imgURL);
                                $("#productPreview").css({ display: "block" });
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

                        .specs-container {
                            border: 1px solid #dee2e6;
                            border-radius: 8px;
                            padding: 1rem;
                            margin-bottom: 1rem;
                        }

                        .specs-header {
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            margin-bottom: 1rem;
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
                                    <h1 class="mt-4">Manage Products</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item">
                                            <a href="/admin/product">Products</a>
                                        </li>
                                        <li class="breadcrumb-item active">Create Product</li>
                                    </ol>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h3 class="mb-0">Create New Product</h3>
                                                </div>
                                                <div class="card-body">
                                                    <form:form method="post" action="/admin/product/create"
                                                        modelAttribute="newProduct" enctype="multipart/form-data">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <c:set var="errorName">
                                                                        <form:errors path="name"
                                                                            cssClass="invalid-feedback" />
                                                                    </c:set>
                                                                    <label class="form-label">Name</label>
                                                                    <form:input type="text"
                                                                        class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                                        path="name" />
                                                                    ${errorName}
                                                                </div>
                                                                <div class="mb-3">
                                                                    <c:set var="errorPrice">
                                                                        <form:errors path="price"
                                                                            cssClass="invalid-feedback" />
                                                                    </c:set>
                                                                    <label class="form-label">Price</label>
                                                                    <form:input type="number"
                                                                        class="form-control  ${not empty errorPrice ? 'is-invalid' : ''}"
                                                                        path="price" />
                                                                    ${errorPrice}
                                                                </div>
                                                                <div class="mb-3">
                                                                    <c:set var="errorQuantity">
                                                                        <form:errors path="quantity"
                                                                            cssClass="invalid-feedback" />
                                                                    </c:set>
                                                                    <label class="form-label">Quantity</label>
                                                                    <form:input type="number"
                                                                        class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                                        path="quantity" />
                                                                    ${errorQuantity}
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label class="form-label">Factory</label>
                                                                    <form:select class="form-select" path="factory">
                                                                        <form:option value="APPLE">Apple(MacBook)
                                                                        </form:option>
                                                                        <form:option value="DELL">Dell</form:option>
                                                                        <form:option value="LG">LG</form:option>
                                                                        <form:option value="ACER">Acer</form:option>
                                                                    </form:select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Target</label>
                                                                    <form:select class="form-select" path="target">
                                                                        <form:option value="GAMING">Gaming</form:option>
                                                                        <form:option value="SINHVIEN-VANPHONG">Sinh viên
                                                                            -
                                                                            Văn Phòng</form:option>
                                                                        <form:option value="THIET-KE-DO-HOA">Thiết kế độ
                                                                            họa
                                                                        </form:option>
                                                                        <form:option value="MONG-NHE">Mỏng nhẹ
                                                                        </form:option>
                                                                        <form:option value="DOANH-NHAN">Doanh nhân
                                                                        </form:option>
                                                                    </form:select>

                                                                    <div class="mb-3">
                                                                        <c:set var="errorDetailDesc">
                                                                            <form:errors path="detailDesc"
                                                                                cssClass="invalid-feedback" />
                                                                        </c:set>
                                                                        <label class="form-label">Detail
                                                                            Description</label>
                                                                        <form:textarea
                                                                            class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                                                                            path="detailDesc" rows="4" />
                                                                        ${errorDetailDesc}
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <c:set var="errorShortDesc">
                                                                            <form:errors path="shortDesc"
                                                                                cssClass="invalid-feedback" />
                                                                        </c:set>
                                                                        <label class="form-label">Short
                                                                            Description</label>
                                                                        <form:input
                                                                            class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
                                                                            path="shortDesc" />
                                                                        ${errorShortDesc}
                                                                    </div>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label class="form-label">Images</label>
                                                                    <input class="form-control" type="file"
                                                                        id="productImages" accept=".png, .jpg, .jpeg"
                                                                        name="uploadFile" multiple />
                                                                </div>
                                                                <div class="mb-3">
                                                                    <div
                                                                        class="d-flex justify-content-center align-items-center h-100">
                                                                        <img style="max-height: 200px; display: none"
                                                                            id="productPreview" alt="Product preview"
                                                                            class="img-thumbnail" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-flex justify-content-between mt-4">
                                                            <button type="submit" class="btn btn-primary">
                                                                <i class="fas fa-save me-2"></i>Create Product
                                                            </button>
                                                            <a href="/admin/product" class="btn btn-secondary">
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
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                    <!-- Font Awesome -->
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

                </body>

                </html>