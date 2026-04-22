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
                <title>Create Product</title>
                <link href="/css/dashboardStyles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const pImage = $("#pImage");
                        pImage.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#imagePreview").attr("src", imgURL);
                            $("#imagePreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                                <h1 class="mt-4">Create Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Manage Product</a></li>
                                    <li class="breadcrumb-item active">Create Product</li>
                                </ol>

                                <!-- CONTENT -->
                                <div class="px-4">
                                    <div class="row">
                                        <div class="col-12 col-md-8 col-lg-6 mx-auto">
                                            <h3>Create Product</h3>
                                            <hr>
                                            <form:form action="/admin/product/create" method="post"
                                                modelAttribute="newProduct" class="row" enctype="multipart/form-data">
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="nameError">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="pName" class="form-label">Product
                                                        name</label>
                                                    <form:input id="pName" path="name"
                                                        class="form-control ${not empty nameError? 'is-invalid' : ''}"
                                                        type="text" />
                                                    ${nameError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="priceError">
                                                        <form:errors path="price" class="invalid-feedback" />
                                                    </c:set>
                                                    <label for="pPrice" class="form-label">Price</label>
                                                    <form:input id="pPrice"
                                                        class="form-control ${not empty priceError? 'is-invalid' : ''}"
                                                        type="number" path="price" />
                                                    ${priceError}
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <c:set var="detailDescError">
                                                        <form:errors path="detailDesc" class="invalid-feedback" />
                                                    </c:set>
                                                    <label for="detaildesc" class="form-label">Detail
                                                        description</label>
                                                    <form:textarea id="detaildesc" path="detailDesc"
                                                        class="form-control ${not empty detailDescError? 'is-invalid' : ''}" />
                                                    ${detailDescError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="shortDescError">
                                                        <form:errors path="shortDesc" class="invalid-feedback" />
                                                    </c:set>
                                                    <label for="shortdesc" class="form-label">Short description</label>
                                                    <form:input id="shortdesc" type="text" path="shortDesc"
                                                        class="form-control ${not empty shortDescError? 'is-invalid' : ''}" />
                                                    ${shortDescError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="quantityError">
                                                        <form:errors path="quantity" class="invalid-feedback" />
                                                    </c:set>
                                                    <label for="pQuantity" class="form-label">Quantity</label>
                                                    <form:input id="pQuantity"
                                                        class="form-control ${not empty quantityError? 'is-invalid' : ''}"
                                                        type="number" path="quantity" />
                                                    ${quantityError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="manufacturerError">
                                                        <form:errors path="manufacturer" class="invalid-feedback" />
                                                    </c:set>

                                                    <label for="manufacturer" class="form-label">Manufacturer</label>
                                                    <form:select
                                                        class="form-select ${not empty manufacturerError? 'is-invalid' : ''}"
                                                        aria-label="Select manufacturer" id="manufacturer"
                                                        path="manufacturer">
                                                        <form:option value="APPLE">APPLE</form:option>
                                                        <form:option value="LG">LG</form:option>
                                                        <form:option value="DELL">DELL</form:option>
                                                        <form:option value="ACER">ACER</form:option>
                                                        <form:option value="LENOVO">LENOVO</form:option>
                                                        <form:option value="ASUS">ASUS</form:option>
                                                    </form:select>
                                                    ${manufacturerError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="targetError">
                                                        <form:errors path="target" class="invalid-feedback" />
                                                    </c:set>

                                                    <label for="target" class="form-label">Target</label>
                                                    <form:select
                                                        class="form-select ${not empty targetError? 'is-invalid' : ''}"
                                                        aria-label="Select target" id="target" path="target">
                                                        <form:option value="GAMING">Gaming</form:option>
                                                        <form:option value="STUDENT-OFFICE">Student/Office</form:option>
                                                        <form:option value="GRAPHIC">Graphic design</form:option>
                                                        <form:option value="THIN-LIGHT">Thin and light</form:option>
                                                        <form:option value="BUSINESS">Business</form:option>
                                                    </form:select>
                                                    ${targetError}
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <c:set var="imageError">
                                                        <form:errors path="image" class="invalid-feedback" />
                                                    </c:set>
                                                    <label for="pImage" class="form-label">Product
                                                        image</label>
                                                    <input
                                                        class="form-control ${not empty imageError ? 'is-invalid' : ''}"
                                                        type="file" id="pImage" accept=".png, .jpg, .jpeg"
                                                        name="pImage" />
                                                    ${imageError}
                                                </div>

                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;" id="imagePreview"
                                                        alt="Product Image Preview">
                                                </div>
                                                <div class="mb-5 col-12">
                                                    <button type="submit" class="btn btn-primary">Create</button>
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