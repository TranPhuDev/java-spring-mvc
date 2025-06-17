<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Update Product</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

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
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Update Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Products</a></li>
                                    <li class="breadcrumb-item active">Update Product</li>
                                </ol>

                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-edit me-1"></i>
                                        Edit Product Information
                                    </div>
                                    <div class="card-body">
                                        <form:form action="/admin/product/update/${newProduct.id}" method="POST"
                                            modelAttribute="newProduct" enctype="multipart/form-data">
                                            <form:hidden path="id" />

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <c:set var="errorName">
                                                            <form:errors path="name" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="name" class="form-label">Product Name</label>
                                                        <form:input path="name"
                                                            class="form-control ${not empty errorName ? 'is-invalid' : ''}" />
                                                        ${errorName}
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <c:set var="errorPrice">
                                                            <form:errors path="price" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="price" class="form-label">Price ($)</label>
                                                        <form:input path="price" type="number" step="0.01"
                                                            class="form-control ${not empty errorPrice ? 'is-invalid' : ''}" />
                                                        ${errorPrice}
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <c:set var="errorQuantity">
                                                            <form:errors path="quantity" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="quantity" class="form-label">Quantity in
                                                            Stock</label>
                                                        <form:input path="quantity" type="number"
                                                            class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}" />
                                                        ${errorQuantity}
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <c:set var="errorSold">
                                                            <form:errors path="sold" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="sold" class="form-label">Units Sold</label>
                                                        <form:input path="sold" type="number"
                                                            class="form-control ${not empty errorSold ? 'is-invalid' : ''}" />
                                                        ${errorSold}
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <c:set var="errorFactory">
                                                            <form:errors path="factory" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="factory" class="form-label">Factory</label>
                                                        <form:input path="factory"
                                                            class="form-control ${not empty errorFactory ? 'is-invalid' : ''}" />
                                                        ${errorFactory}
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <c:set var="errorTarget">
                                                            <form:errors path="target" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="target" class="form-label">Target Audience</label>
                                                        <form:input path="target"
                                                            class="form-control ${not empty errorTarget ? 'is-invalid' : ''}" />
                                                        ${errorTarget}
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <c:set var="errorShortDesc">
                                                            <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="shortDesc" class="form-label">Short
                                                            Description</label>
                                                        <form:textarea path="shortDesc"
                                                            class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
                                                            rows="2" />
                                                        ${errorShortDesc}
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <c:set var="errorDetailDesc">
                                                            <form:errors path="detailDesc"
                                                                cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="detailDesc" class="form-label">Detailed
                                                            Description</label>
                                                        <form:textarea path="detailDesc"
                                                            class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                                                            rows="4" />
                                                        ${errorDetailDesc}
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="uploadFile" class="form-label">Product Image</label>
                                                        <input type="file" name="uploadFile" id="uploadFile"
                                                            class="form-control" accept="image/*"
                                                            onchange="previewImage(this);" />
                                                        <small class="text-muted">Leave empty to keep current
                                                            image</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="form-label">Image</label>
                                                        <div class="d-flex justify-content-center">
                                                            <img id="imagePreview"
                                                                src="/images/product/${newProduct.image}"
                                                                class="img-fluid rounded" alt="${newProduct.name}"
                                                                style="max-height: 150px;">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mt-4">
                                                <div class="col-12">
                                                    <div class="d-flex justify-content-between">
                                                        <a href="/admin/product" class="btn btn-secondary">
                                                            <i class="fas fa-arrow-left"></i> Cancel
                                                        </a>
                                                        <button type="submit" class="btn btn-primary">
                                                            <i class="fas fa-save"></i> Update Product
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form:form>
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
                <script src="https://kit.fontawesome.com/your-font-awesome-kit.js" crossorigin="anonymous"></script>

                <script>
                    function previewImage(input) {
                        const preview = document.getElementById('imagePreview');
                        const file = input.files[0];

                        if (file) {
                            const reader = new FileReader();

                            reader.onload = function (e) {
                                preview.src = e.target.result;
                                preview.style.display = 'block';
                            }

                            reader.readAsDataURL(file);
                        } else {
                            // If no file is selected, show the original image
                            preview.src = "/images/product/${newProduct.image}";
                        }
                    }
                </script>
            </body>

            </html>