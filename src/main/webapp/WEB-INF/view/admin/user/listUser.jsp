<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>List Users</title>
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
                <div class="d-flex justify-content-between">
                    <h3>List Users</h3>
                    <a href="/admin/user/create"><button class="btn btn-primary">Create user</button></a>
                </div>

                <hr>

                <div>
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th scope=" col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${listUser}">
                                <tr>
                                    <th scope="row">${user.id}</th>
                                    <td>${user.name}</td>
                                    <td>${user.email}</td>
                                    <td>
                                        <a href="/admin/user/${user.id}" class="btn btn-sm btn-success">View</a>
                                        <a href="/admin/user/update/${user.id}"
                                            class="btn btn-sm btn-warning mx-2">Update</a>
                                        <button class="btn btn-sm btn-danger">Delete</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </body>

        </html>