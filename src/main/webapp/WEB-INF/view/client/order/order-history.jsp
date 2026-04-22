<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Order History</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">
            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->


                <!-- Navbar start -->
                <jsp:include page="../layout/header.jsp" />
                <!-- Navbar End -->

                <!-- Cart Page Start -->
                <div class="container-fluid mt-5 py-5">
                    <div class="container py-3">
                        <div class="mb-5">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="/">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active">Order History</li>
                                </ol>
                            </nav>
                        </div>
                        <c:if test="${empty orders}">
                            <div>
                                <!-- <h4 class="mb-4">Giỏ hàng của bạn đang trống!</h4> -->
                                <div class="alert alert-warning">You have no orders.</div>
                                <a href="/" class="btn btn-primary rounded-pill px-4 py-2 text-white">Continue
                                    shopping</a>
                            </div>
                        </c:if>
                        <c:forEach var="order" items="${orders}" varStatus="status">
                            <div class="table-responsive col-12 col-md-7 mb-5">
                                <div class="d-flex gap-5" style="margin-bottom: 15px;">
                                    <h3>Order ID ${order.id}</h3>
                                    <a class="py-2 btn btn-primary" href="/order-history/${order.id}">
                                        <span class="text-white">View Details</span>
                                    </a>
                                </div>

                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Number of Items</th>
                                            <th scope="col">Total Price</th>
                                            <th scope="col">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">
                                                ${order.quantity}
                                            </th>
                                            <td class="align-middle">
                                                <fmt:formatNumber value="${order.totalPrice}" type="number" /> đ
                                            </td>
                                            <td>
                                                ${order.status}
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Cart Page End -->


                <!-- Footer Start -->
                <jsp:include page="../layout/footer.jsp" />
                <!-- Footer End -->

                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>