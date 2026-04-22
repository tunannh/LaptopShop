<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Laptop shop project" />
                <meta name="author" content="Atun" />
                <title>Order Detail</title>
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
                                <h1 class="mt-4">Order Detail</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/order">Orders</a></li>
                                    <li class="breadcrumb-item active">Order Detail</li>
                                </ol>

                                <!-- CONTENT -->
                                <div class="px-4">
                                    <div class="mb-5">
                                        <div class="d-flex justify-content-between">
                                            <h3>Order Information</h3>
                                        </div>
                                        <hr>
                                        <div>
                                            <table class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th scope=" col">Order ID</th>
                                                        <th scope="col">Total price</th>
                                                        <th scope="col">Status</th>
                                                        <th scope="col">Number of items</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">${order.id}</th>
                                                        <td>
                                                            <fmt:formatNumber value="${order.totalPrice}"
                                                                type="number" /> đ
                                                        </td>
                                                        <td>${order.status}</td>
                                                        <td>${order.quantity}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="mb-5">
                                        <div class="d-flex justify-content-between">
                                            <h3>Receiver Information</h3>
                                        </div>
                                        <hr>
                                        <div>
                                            <table class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th scope=" col">User ID</th>
                                                        <th scope="col">Phone</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col">Address</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">${order.user.id}</th>
                                                        <td>${order.receiverPhone}</td>
                                                        <td>${order.receiverEmail}</td>
                                                        <td>${order.receiverAddress}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="mb-5">
                                        <div class="d-flex justify-content-between">
                                            <h3>List Items</h3>
                                        </div>
                                        <hr>
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Product</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Price</th>
                                                            <th scope="col">Quantity</th>
                                                            <th scope="col">Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="orderDetail" items="${orderDetails}">
                                                            <tr>
                                                                <th scope="row" class="align-middle">
                                                                    <div class="d-flex align-items-center mt-2">
                                                                        <img src="/images/product/${orderDetail.product.image}"
                                                                            alt="Product Image"
                                                                            class="img-fluid me-5 rounded-circle"
                                                                            style="width: 70px; height: 70px;" alt="">
                                                                    </div>
                                                                </th>
                                                                <td class="py-5"><a
                                                                        href="/admin/product/${orderDetail.product.id}">${orderDetail.product.name}</a>
                                                                </td>
                                                                <td class="py-5">
                                                                    <fmt:formatNumber
                                                                        value="${orderDetail.product.price}"
                                                                        type="number" /> đ
                                                                </td>
                                                                <td class="py-5">${orderDetail.quantity}
                                                                </td>
                                                                <td class="py-5">
                                                                    <fmt:formatNumber
                                                                        value="${orderDetail.product.price * orderDetail.quantity}"
                                                                        type="number" /> đ
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
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