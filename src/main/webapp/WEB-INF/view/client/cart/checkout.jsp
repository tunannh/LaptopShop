<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Checkout</title>
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

                    <!-- Checkout Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div>
                                <div class="mb-5">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item"><a href="/cart">Cart</a></li>
                                            <li class="breadcrumb-item active">Checkout</li>
                                        </ol>
                                    </nav>
                                </div>
                                <div class="row g-5">
                                    <!-- product list -->
                                    <div class="col-md-12 col-lg-8 col-xl-7">
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
                                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                                        <tr>
                                                            <th scope="row" class="align-middle">
                                                                <div class="d-flex align-items-center mt-2">
                                                                    <img src="/images/product/${cartDetail.product.image}"
                                                                        alt="Product Image"
                                                                        class="img-fluid me-5 rounded-circle"
                                                                        style="width: 70px; height: 70px;" alt="">
                                                                </div>
                                                            </th>
                                                            <td class="align-middle">${cartDetail.product.name}</td>
                                                            <td class="align-middle">
                                                                <fmt:formatNumber value="${cartDetail.product.price}"
                                                                    type="number" /> đ
                                                            </td>
                                                            <td class="align-middle text-center">${cartDetail.quantity}
                                                            </td>
                                                            <td class="align-middle">
                                                                <fmt:formatNumber
                                                                    value="${cartDetail.product.price * cartDetail.quantity}"
                                                                    type="number" /> đ
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- end product list -->
                                    <!-- form -->
                                    <div class="col-md-12 col-lg-4 col-xl-5">
                                        <form:form action="/place-order" method="post">
                                            <div class="row g-3">
                                                <h3>Recipient information</h3>
                                                <div class="form-item">
                                                    <label class="form-label my-2">Name<sup>*</sup></label>
                                                    <input type="text" class="form-control" name="receiverName"
                                                        required>
                                                </div>
                                                <div class="form-item">
                                                    <label class="form-label my-2">Email address<sup>*</sup></label>
                                                    <input type="email" class="form-control" name="receiverEmail"
                                                        required>
                                                </div>
                                                <div class="form-item">
                                                    <label class="form-label my-2">Address<sup>*</sup></label>
                                                    <input type="text" class="form-control" name="receiverAddress"
                                                        required>
                                                </div>
                                                <div class="form-item">
                                                    <label class="form-label my-2">Phone Number<sup>*</sup></label>
                                                    <input type="text" class="form-control" name="receiverPhone"
                                                        required>
                                                </div>
                                            </div>
                                            <div class="row g-4 mt-5">
                                                <div class="col-12">
                                                    <div class="bg-light rounded">
                                                        <div class="p-4">
                                                            <h4 class="display-6 mb-4">Payment <span
                                                                    class="fw-normal">Information</span>
                                                            </h4>
                                                            <div class="d-flex justify-content-between mb-4">
                                                                <h5 class="mb-0 me-4">Shipping Fee:</h5>
                                                                <p class="mb-0" data-total-amount="${totalAmount}">
                                                                    0 đ
                                                                </p>
                                                            </div>
                                                            <div class="d-flex justify-content-between">
                                                                <h5 class="mb-0 me-4">Receiving method:</h5>
                                                                <div class="">
                                                                    <p class="mb-0">Cash on Delivery (COD)</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                            class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                            <h5 class="mb-0 ps-4 me-4">Total:</h5>
                                                            <p class="mb-0 pe-4" data-total-amount="${totalAmount}">
                                                                <fmt:formatNumber value="${totalAmount}"
                                                                    type="number" /> đ
                                                            </p>
                                                        </div>
                                                        <button
                                                            class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                                            type="submit">Place Order
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form:form>
                                    </div>
                                    <!-- end form -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Checkout Page End -->


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