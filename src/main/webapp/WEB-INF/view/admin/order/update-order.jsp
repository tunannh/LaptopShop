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
                <title>Update Order</title>
                <link href="/css/dashboardStyles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                                <h1 class="mt-4">Update Order</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/order">Manage Order</a></li>
                                    <li class="breadcrumb-item active">Update Order</li>
                                </ol>

                                <!-- CONTENT -->
                                <div class="px-4">
                                    <div class="row">
                                        <div class="col-12 col-md-8 col-lg-6 mx-auto">
                                            <h3>Update Order</h3>
                                            <hr>
                                            <form:form action="/admin/order/update" method="post" modelAttribute="order"
                                                class="row">
                                                <div class="mb-3 col-12 col-md-6 d-none">
                                                    <label for="iden" class="form-label">ID</label>
                                                    <form:input type="text" class="form-control" id="iden" path="id" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="iden" class="form-label">ID2</label>
                                                    <input type="text" class="form-control" id="iden" value="${id}"
                                                        disabled="true" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="price" class="form-label">Total price</label>
                                                    <form:input id="price" path="totalPrice" class="form-control"
                                                        type="text" disabled="true" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="status" class="form-label">Status</label>
                                                    <form:select class="form-select" aria-label="Select status"
                                                        id="status" path="status">
                                                        <form:option value="PENDING">Pending</form:option>
                                                        <form:option value="SHIPPED">Shipped</form:option>
                                                        <form:option value="DELIVERED">Delivered</form:option>
                                                        <form:option value="CANCELLED">Cancelled</form:option>
                                                    </form:select>
                                                </div>

                                                <div class="mb-5 col-12">
                                                    <button type="submit" class="btn btn-warning">Update</button>
                                                </div>
                                            </form:form>
                                        </div>
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