<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Laptop shop project" />
            <meta name="author" content="Atun" />
            <title>User Information</title>
            <link href="/css/dashboardStyles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <!-- HEADER -->
            <jsp:include page="../layout/header.jsp" />

            <div id="layoutSidenav">
                <!-- SIDEBAR -->
                <jsp:include page="../layout/sidebar.jsp" />

                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">User information</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin/dashboard">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="/admin/user">Manage User</a></li>
                                <li class="breadcrumb-item active">User Information</li>
                            </ol>

                            <!-- CONTENT -->
                            <div class="px-4">
                                <h3>User detail with ID= ${id}</h3>

                                <hr>

                                <div class="card" style="width: 40%;">
                                    <div class="card-header">
                                        User information
                                    </div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">Full Name: ${userInfo.name}</li>
                                        <li class="list-group-item">Email: ${userInfo.email}</li>
                                        <li class="list-group-item">Address: ${userInfo.address}</li>
                                        <li class="list-group-item">Phone: ${userInfo.phoneNumber}</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- END CONTENT -->

                        </div>
                    </main>

                    <!-- FOOTER -->
                    <jsp:include page="../layout/footer.jsp" />

                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="/js/scripts.js"></script>
        </body>

        </html>