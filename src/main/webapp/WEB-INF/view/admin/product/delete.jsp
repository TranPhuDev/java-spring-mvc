<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Delete Product</title>
    <!-- Latest compiled and minified CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

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
            <h1 class="mt-4">Delete Product</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item">
                <a href="/admin/product">Products</a>
              </li>
              <li class="breadcrumb-item active">Delete Product</li>
            </ol>

            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-trash me-1"></i>
                Confirm Product Deletion
              </div>
              <div class="card-body">
                <div class="alert alert-warning">
                  <i class="fas fa-exclamation-triangle me-2"></i>
                  Warning: This action cannot be undone. Are you sure you want
                  to delete this product?
                </div>

                <div class="row mb-4">
                  <div class="col-md-4">
                    <div class="text-center">
                      <img
                        src="/images/product/${product.image}"
                        class="img-fluid rounded"
                        alt="${product.name}"
                        style="max-height: 200px"
                      />
                    </div>
                  </div>
                  <div class="col-md-8">
                    <div class="table-responsive">
                      <table class="table table-bordered">
                        <tbody>
                          <tr>
                            <th style="width: 200px">Product ID</th>
                            <td>${product.id}</td>
                          </tr>
                          <tr>
                            <th>Name</th>
                            <td>${product.name}</td>
                          </tr>
                          <tr>
                            <th>Price</th>
                            <td>$${product.price}</td>
                          </tr>
                          <tr>
                            <th>Quantity in Stock</th>
                            <td>${product.quantity}</td>
                          </tr>
                          <tr>
                            <th>Units Sold</th>
                            <td>${product.sold}</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>

                <form:form
                  action="/admin/product/delete/${product.id}"
                  method="POST"
                  modelAttribute="product"
                >
                  <form:hidden path="id" value="${product.id}" />
                  <div class="d-flex justify-content-between">
                    <a href="/admin/product" class="btn btn-secondary">
                      <i class="fas fa-arrow-left"></i> Cancel
                    </a>
                    <button
                      type="submit"
                      class="btn btn-danger"
                      onclick="return confirm('Are you sure you want to delete this product?');"
                    >
                      <i class="fas fa-trash"></i> Delete Product
                    </button>
                  </div>
                </form:form>
              </div>
            </div>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/scripts.js"></script>
    <script
      src="https://kit.fontawesome.com/your-font-awesome-kit.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
