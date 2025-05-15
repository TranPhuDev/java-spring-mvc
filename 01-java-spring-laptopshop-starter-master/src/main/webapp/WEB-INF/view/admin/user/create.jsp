<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>


            </head>

            <body class="sb-nav-fixed">

                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Create a user</h3>
                                        <form:form method="post" action="/admin/user/create" modelAttribute="newUser">
                                            <hr>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="mb-3">
                                                        <label class="form-label">Email</label>
                                                        <form:input type="email" class="form-control" path="email" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="mb-3">
                                                        <label class="form-label">Password</label>
                                                        <form:input type="password" class="form-control"
                                                            path="password" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <div class="mb-3">
                                                        <label for="exampleInputPhoneNumber1" class="form-label">Phone
                                                            number</label>
                                                        <form:input type="text" class="form-control" path="phone" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="mb-3">
                                                        <label for="exampleInputFullName1" class="form-label">Full
                                                            name</label>
                                                        <form:input type="text" class="form-control" path="fullName" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <label for="exampleInputAddress1" class="form-label">Address</label>
                                                <form:input type="text" class="form-control" path="address" />
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form-label">Role:</label>
                                                    <select class="form-select">
                                                        <option value="ADMIN">ADMIN</option>
                                                        <option value="USER">USER</option>
                                                    </select>
                                                </div>
                                                <div class="col"> <label for="avatarFile"
                                                        class="form-label">Avatar:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg">
                                                </div>
                                            </div>
                                            <div class="row ">
                                                <div class="col mt-4 d-flex justify-content-center">
                                                    <img style="max-height: 250px; display: none;" id="avatarPreview"
                                                        alt="avatar preview">
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-primary mt-5">Create</button>
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
            </body>

            </html>