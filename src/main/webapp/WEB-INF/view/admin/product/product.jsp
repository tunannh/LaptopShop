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
                <title>Product</title>
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
                                <h1 class="mt-4">Manage Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Manage Product</li>
                                </ol>

                                <!-- CONTENT -->
                                <div class="px-4">
                                    <div class="d-flex justify-content-between">
                                        <h3>List Products</h3>
                                        <a href="/admin/product/create"><button class="btn btn-primary">Create
                                                product</button></a>
                                    </div>
                                    <hr>
                                    <div>
                                        <table class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th scope=" col">ID</th>
                                                    <th scope="col">Product name</th>
                                                    <th scope="col">Manufacturer</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Sold</th>
                                                    <th scope="col">Remaining</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="product" items="${listProduct}">
                                                    <tr>
                                                        <th scope="row">${product.id}</th>
                                                        <td>${product.name}</td>
                                                        <td>${product.manufacturer}</td>
                                                        <td>
                                                            <fmt:formatNumber value="${product.price}" type="number" />
                                                            đ
                                                        </td>
                                                        <td>${product.sold}</td>
                                                        <td>${product.quantity}</td>
                                                        <td>
                                                            <a href="/admin/product/${product.id}"
                                                                class="btn btn-sm btn-success">View</a>
                                                            <a href="/admin/product/update/${product.id}"
                                                                class="btn btn-sm btn-warning mx-2">Update</a>
                                                            <a href="/admin/product/delete/${product.id}"
                                                                class="btn btn-sm btn-danger">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                    <a class="page-link" href="/admin/product?page=${currentPage - 1}"
                                                        aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <c:forEach var="i" begin="1" end="${totalPages}">
                                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                        <a class="page-link" href="/admin/product?page=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                    <a class="page-link" href="/admin/product?page=${currentPage + 1}"
                                                        aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
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