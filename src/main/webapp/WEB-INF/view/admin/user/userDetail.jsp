<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>User Detail ${id}</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
                crossorigin="anonymous"></script>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <body>
            <div class="container mt-5 px-5">
                <h3>User detail with ID: ${id}</h3>

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
        </body>

        </html>