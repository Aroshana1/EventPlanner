<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
</head>
<body>

    <%@ page import="com.event.Customer" %>
    <%@ page import="java.util.List" %>
    

	<%
	if (session == null || session.getAttribute("email") == null) {
        // User is not logged in, redirect to the login page
        response.sendRedirect("login.jsp");
    }else {
        String email = (String) session.getAttribute("email"); // Retrieve the email from the session

   

        // Retrieve and store customer details
        List<Customer> cusDetails = com.event.CustomerDBUtil.getCustomer(email);
        request.setAttribute("cusDetails", cusDetails);
        
    }

	%>


<h2>User Profile</h2>
<a href="LogOutServlet">Logout</a><br>
<table>
<c:forEach var="cus" items = "${cusDetails}">

<c:set var = "id" value = "${cus.id}"/>
<c:set var = "name" value = "${cus.name}"/>
<c:set var = "email" value = "${cus.email}"/>
<c:set var = "phone" value = "${cus.phone}"/>
<c:set var = "address" value = "${cus.address}"/>
<c:set var = "password" value = "${cus.password}"/>

<tr>
	<td>User ID</td>
	<td>${cus.id}</td>
</tr>
<tr>
	<td>Name</td>
	<td>${cus.name}</td>
</tr>
<tr>
	<td>User Email</td>
	<td>${cus.email}</td>
</tr>
<tr>
	<td>User Phone</td>
	<td>${cus.phone}</td>
</tr>
<tr>
	<td>User Address</td>
	<td>${cus.address}</td>
</tr>
	

	${cus.password}

</c:forEach>
</table>

<c:url value = "updateprofile.jsp" var = "userupdate">
	<c:param name = "id" value = "${id}"/>
	<c:param name = "name" value = "${name}"/>
	<c:param name = "email" value = "${email}"/>
	<c:param name = "phone" value = "${phone}"/>
	<c:param name = "address" value = "${address}"/>
	<c:param name = "password" value = "${password}"/>
</c:url>

<a href="${userupdate}">
<input type = "button" name = "update" value = "Update My Profile">
</a>
<br>

<c:url value = "deleteaccount.jsp" var = "deleteaccount">
	<c:param name = "id" value = "${id}"/>
	<c:param name = "name" value = "${name}"/>
	<c:param name = "email" value = "${email}"/>
</c:url>

<a href="${deleteaccount}">
<input type = "button" name = "delete" value = "Delete My Account">
</a>

</body>
</html>