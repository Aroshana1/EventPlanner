<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="header.jsp" %>
    
    <%@ page import="com.event.Customer" %>
    <%@ page import="java.util.List" %>
    
	<%
	if (session == null || session.getAttribute("email") == null) {
        // admin is not logged in, redirect to the login page
        response.sendRedirect("login.jsp");
    }else {
        String email = (String) session.getAttribute("email"); // Retrieve the email from the session


        // Retrieve and store customer details
        List<Customer> cusDetails = com.event.CustomerDBUtil.getCustomer(email);
        request.setAttribute("cusDetails", cusDetails);
    }
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<style>
    .bg-cyan {
      background-color: #0066ff;
    }
    .bg-image {
      background-image: url('./images/2.png');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
    }
    .rounded-square {
      text-align: center;
      border: 2px solid #ccc;
      border-radius: 15px;
      padding: 20px;
      color: blue;
    }
  </style>
</head>




<body>
<c:forEach var="cus" items="${cusDetails}">
<div class="jumbotron jumbotron-fluid text-center bg-image">
    <div class="container">
      <h1 class="display-4 text-white" >Hello ${cus.name}</h1>
      <p class="lead text-white">The Momentous Your Event Planner.</p>
      <p><a href="myrequests.jsp" class="btn btn-primary btn-lg">My Requests</a>      <a href="events.jsp" class="btn btn-success btn-lg">Get Started</a>     <a href="LogOutServlet" class="btn btn-danger btn-lg">Log Out</a></p>
    </div>
    

  </div>

    <div class="container text-center mt-5">
        <h2>User Profile</h2>
        <a href="LogOutServlet" class="btn btn-primary">Logout</a>
        <table class="table table-bordered mt-4">
           
            <c:set var = "id" value = "${cus.id}"/>
			<c:set var = "name" value = "${cus.name}"/>
			<c:set var = "email" value = "${cus.email}"/>
			<c:set var = "phone" value = "${cus.phone}"/>
			<c:set var = "address" value = "${cus.address}"/>
			<c:set var = "password" value = "${cus.password}"/>
                <tr>
                    <th>User ID</th>
                    <td>${cus.id}</td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>${cus.name}</td>
                </tr>
                <tr>
                    <th>User Email</th>
                    <td>${cus.email}</td>
                </tr>
                <tr>
                    <th>User Phone</th>
                    <td>${cus.phone}</td>
                </tr>
                <tr>
                    <th>User Address</th>
                    <td>${cus.address}</td>
                </tr>

              
            
        </table>
        <div class="text-center">
            <c:url value="updateprofile.jsp" var="userupdate">
                <c:param name="id" value="${id}" />

            </c:url>
            <a href="${userupdate}" class="btn btn-primary">Update My Profile</a>

            <c:url value="deleteaccount.jsp" var="deleteaccount">
                <c:param name="id" value="${id}" />
                <c:param name="name" value="${name}" />
                <c:param name="email" value="${email}" />
            </c:url>
            <a href="${deleteaccount}" class="btn btn-danger">Delete My Account</a>
        </div>
    </div>
    
   </c:forEach>
   
   

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <br><br>
    <%@ include file="footer.jsp" %>
</body>
</html>