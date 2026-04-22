<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Laptop shop project" />
                <meta name="author" content="Atun" />
                <title>Delete Order</title>
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
                                <h1 class="mt-4">Delete Order</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/order">Manage Order</a></li>
                                    <li class="breadcrumb-item active">Delete Order</li>
                                </ol>

                                <!-- CONTENT -->
                                <div class="px-4">
                                    <h3>Delete Order with ID = ${order.id}</h3>

                                    <hr>

                                    <div class="alert alert-danger" role="alert">
                                        Are you sure you want to delete this order?
                                    </div>
                                    <form:form action="/admin/order/delete" method="post" modelAttribute="order">
                                        <div class="mb-3" style="display: none">
                                            <label for="iden" class="form-label">Id</label>
                                            <form:input type="text" class="form-control" id="iden" path="id" />
                                        </div>
                                        <button type="submit" class="btn btn-danger">Confirm</button>
                                    </form:form>
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