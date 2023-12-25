<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="com.event.Customer" %>
    <%@ page import="java.util.List" %>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>

</head>
<body>
<%
	if (session == null || session.getAttribute("email") == null) {
	    // User is not logged in, redirect to the login page
	    response.sendRedirect("login.jsp");
	}

    String id = request.getParameter("id");
    
    // Retrieve and store customer details
    List<Customer> cusDetails = com.event.CustomerDBUtil.getCustomerDetails(id);
    request.setAttribute("cusDetails", cusDetails);
%>

<div class="container mt-5">
    <center><h2>Update Profile</h2></center>
    <c:forEach var="cus" items="${cusDetails}">
   <div class="form">
    <form action="update" method="post" id="update-form">
        <div class="form-group">
            <label for="id">User ID</label>
            <input type="text" class="form-control" id="id" name="id" value="${cus.id}" readonly>
        </div>
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="${cus.name}">
            <div class="error" id="name-error">Please enter your name.</div>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" class="form-control" id="email" name="email" value="${cus.email}">
            <div class="error" id="email-error">Please enter a valid email address.</div>
        </div>
        <div class="form-group">
            <label for="phone">Contact No</label>
            <input type="text" class="form-control" id="phone" name="phone" value="${cus.phone}">
            <div class="error" id="phone-error">Please enter a valid phone number with 10 digits.</div>
        </div>
        <div class="form-group">
            <label for = "address">Address</label>
            <input type="text" class="form-control" id="address" name="address" value="${cus.address}">
            <div class="error" id="address-error">Please enter your address.</div>
        </div>
        <div class="form-group">
            <label for="pwd">Password</label>
            <input type="password" class="form-control" id="pwd" name="pwd" value="${cus.password}">
            <div class="error" id="pwd-error">Please enter your password.</div>
        </div>

        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="confirm" name="confirm" checked="checked" required>
            <label class="form-check-label" for="confirm">Confirm Details</label>
            <div class="error" id="confirm-error">Please Confirm details before update</div>
        </div>

        <button type="submit" class="btn btn-primary" name="submit">Update Account</button>
    </form>
 </div>
</c:forEach>
</div>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="./js/update-validation.js"></script>
    <br>
    <%@ include file="footer.jsp" %>
 
</body>
</html>
