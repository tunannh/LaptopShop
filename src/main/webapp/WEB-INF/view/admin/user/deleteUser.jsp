<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
                    <h3>Delete User with ID: ${id}</h3>

                    <hr>

                    <div class="alert alert-danger" role="alert">
                        Are you sure you want to delete this user?
                    </div>
                    <form:form action="/admin/user/delete" method="post" modelAttribute="user">
                        <div class="mb-3" style="display: none">
                            <label for="iden" class="form-label">Id</label>
                            <form:input type="text" class="form-control" id="iden" path="id" />
                        </div>
                        <button type="submit" class="btn btn-danger">Confirm</button>
                    </form:form>
                </div>
            </body>

            </html>