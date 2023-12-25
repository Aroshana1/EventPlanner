<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
	if (session == null || session.getAttribute("username") == null) {
		response.sendRedirect("userprofile.jsp");
        // admin is not logged in, redirect to the login page

    }
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New User</title>
<%@ include file="header.jsp" %>
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2 class="text-center mt-4">Add New User</h2>
                <form action="adduser" method="post" id="signup-form" class="mt-4">
                    <div class="form-group">
                        <input type="text" id="name" name="name" placeholder="Name" required class="form-control">
                        <div class="error" id="name-error">enter name.</div>
                    </div>
                    <div class="form-group">
                        <input type="email" id="email" name="email" placeholder="Email" required class="form-control">
                        <div class="error" id="email-error">enter a valid email address.</div>
                    </div>
                    <div class="form-group">
                        <input type="number" id="phone" name="phone" placeholder="Phone" class="form-control">
                        <div class="error" id="phone-error">enter a valid phone number with 10 digits.</div>
                    </div>
                    <div class="form-group">
                        <input type="password" id="pwd" name="pwd" placeholder="Password" required class="form-control">
                        <div class="error" id="pwd-error"> enter  password.</div>
                    </div>
                    <div class="form-group">
                        <input type="text" id="address" name="address" placeholder="Address" required class="form-control">
                        <div class="error" id="address-error">enter  address.</div>
                    </div>
                    <div class="form-group">
                        <input type="checkbox" id="confirm" name="confirm" checked="checked" required>
                        Confirm Details
                        <div class="error" id="confirm-error">confirm details.</div>
                    </div>
                    <button type="submit" name="submit" class="btn btn-primary">Add User</button>
                </form>

            </div>

        </div>
    </div>

    <!-- Add Bootstrap and jQuery Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script src="./js/register.js"></script>

</body>
</html>