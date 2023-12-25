<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Account</title>
	<%@ include file="header.jsp" %>
</head>

<body>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
%>

<div class="container mt-5">
    <h2>Delete User</h2>
    <div class="login-form">
        <form action="removeuser" method="post">
            <div class="form-group">
                <input type="text" class="form-control" id="id" name="id" value="<%= id %>" readonly>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="name" name="name" value="<%= name %>" readonly>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="email" name="email" value="<%= email %>" readonly>
            </div>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="confirm" name="confirm" checked="checked" required>
                <label class="form-check-label" for="confirm">Confirm to delete User</label>
            </div>
            <button type="submit" class="btn btn-danger" name="submit">Delete User</button>
        </form>
    </div>
</div>

<!-- Add Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
