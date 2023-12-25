<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="com.event.Customer" %>
    <%@ page import="java.util.List" %>
 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>
<%@ include file="header.jsp" %>

</head>
<body>
<%


    String id = request.getParameter("id");
    
    // Retrieve and store customer details
    List<Customer> cusDetails = com.event.CustomerDBUtil.getCustomerDetails(id);
    request.setAttribute("cusDetails", cusDetails);
%>

<div class="container mt-5">
	<h2>Edit User</h2>
    <c:forEach var="cus" items="${cusDetails}">
   <div class="form">
    <form action="edituser" method="post" id="update-form">
        <div class="form-group">
            <label for="id">User ID</label>
            <input type="text" class="form-control" id="id" name="id" value="${cus.id}" readonly>
        </div>
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="${cus.name}">
            <div class="error" id="name-error">enter name.</div>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" class="form-control" id="email" name="email" value="${cus.email}">
            <div class="error" id="email-error">enter a valid email address.</div>
        </div>
        <div class="form-group">
            <label for="phone">Contact No</label>
            <input type="text" class="form-control" id="phone" name="phone" value="${cus.phone}">
            <div class="error" id="phone-error">enter a valid phone number with 10 digits.</div>
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" id="address" name="address" value="${cus.address}">
            <div class="error" id="address-error">enter  address.</div>
        </div>
        <div class="form-group">
            <label for="pwd">Password</label>
            <input type="password" class="form-control" id="pwd" name="pwd" value="${cus.password}">
            <div class="error" id="pwd-error">enter password.</div>
        </div>

        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="confirm" name="confirm" checked="checked" required>
            <label class="form-check-label" for="confirm">Confirm Details</label>
            <div class="error" id="confirm-error">Confirm details before update</div>
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
 
</body>
</html>
