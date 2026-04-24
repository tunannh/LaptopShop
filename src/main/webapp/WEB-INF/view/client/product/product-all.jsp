<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Laptop Shop</title>
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


                <!-- Fruits Shop Start-->
                <div class="container-fluid fruite py-5">
                    <div class="container py-5">
                        <div class="mb-5">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="/">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active">Products</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row g-4">
                            <div class="col-12 col-md-4">
                                <div class="row g-4">
                                    <div class="col-12">
                                        <div class="attribute">
                                            <div class="mb-2">Manufacturer</div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="f-1" value="APPLE">
                                                <label for="f-1" class="form-check-label">Apple</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="f-2" value="ASUS">
                                                <label for="f-2" class="form-check-label">Asus</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="f-3" value="LENOVO">
                                                <label for="f-3" class="form-check-label">Lenovo</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="f-4" value="DELL">
                                                <label for="f-4" class="form-check-label">Dell</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="f-5" value="LG">
                                                <label for="f-5" class="form-check-label">LG</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="f-6" value="ACER">
                                                <label for="f-6" class="form-check-label">Acer</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="attribute">
                                            <div class="mb-2">Use for</div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="u-1" value="GAMING">
                                                <label for="u-1" class="form-check-label">Gaming</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="u-2"
                                                    value="STUDENT-OFFICE">
                                                <label for="u-2" class="form-check-label">Student-Office</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="u-3"
                                                    value="GRAPHIC">
                                                <label for="u-3" class="form-check-label">Graphic design</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="u-4"
                                                    value="THIN-LIGHT">
                                                <label for="u-4" class="form-check-label">Thin and light</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="u-5"
                                                    value="BUSINESS">
                                                <label for="u-5" class="form-check-label">Business</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="attribute">
                                            <div class="mb-2">Price</div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="p-1"
                                                    value="Under-10">
                                                <label for="p-1" class="form-check-label">Under 10 million</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="p-2"
                                                    value="STUDENT-OFFICE">
                                                <label for="p-2" class="form-check-label">From 10-15 million</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="p-3"
                                                    value="GRAPHIC">
                                                <label for="p-3" class="form-check-label">From 10-15 million</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="p-4"
                                                    value="THIN-LIGHT">
                                                <label for="p-4" class="form-check-label">Over 20 million</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-8">
                                <div class="row g-4 text-center">
                                    <c:forEach var="product" items="${allProducts}">
                                        <div class="col-md-6 col-lg-4">

                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="/images/product/${product.image}"
                                                        class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                    style="top: 10px; left: 10px;">Laptop</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <a href="/product/${product.id}">
                                                        <h4 style="font-size: 15px;">
                                                            ${product.name}</h4>
                                                        <p style="font-size: 13px;" class="text-dark">
                                                            ${product.shortDesc}
                                                        </p>
                                                    </a>
                                                    <div class="">
                                                        <p class=" text-dark fw-bold mb-2"
                                                            style="text-align: center; font-size: 20px;">
                                                            <fmt:formatNumber value="${product.price}" type="number" />
                                                            đ
                                                        </p>
                                                        <form action="/add-product-to-cart/${product.id}" method="post">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}">
                                                            <button type="submit"
                                                                class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                    class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                Add to cart</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="col-12">
                                        <div class="pagination d-flex justify-content-center mt-5">
                                            <a href="/products?page=${currentPage-1}"
                                                class="rounded ${currentPage==1? 'disabled' : ''}">&laquo;</a>
                                            <c:forEach var="i" begin="1" end="${totalPages}">
                                                <a href="/products?page=${i}"
                                                    class="rounded ${i == currentPage? 'active' : ''}">${i}</a>
                                            </c:forEach>

                                            <a href="/products?page=${currentPage+1}"
                                                class="rounded ${currentPage==totalPages? 'disabled' : ''}">&raquo;</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fruits Shop End-->

                <!-- Footer Start -->
                <jsp:include page="../layout/footer.jsp" />
                <!-- Footer End -->

                <!-- Copyright Start -->
                <!-- <div class="container-fluid copyright bg-dark py-4">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your
                                    Site Name</a>, All right reserved.</span>
                        </div>
                        <div class="col-md-6 my-auto text-center text-md-end text-white">
                            Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed
                            By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div> -->
                <!-- Copyright End -->



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