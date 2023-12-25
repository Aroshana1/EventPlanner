<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@ page import="com.event.Request" %>
<%@ page import="java.util.List" %>

	<%	
	if (session == null || session.getAttribute("email") == null) {
        // User is not logged in, redirect to the login page
        response.sendRedirect("login.jsp");
    }else {
        String email = (String) session.getAttribute("email"); // Retrieve the email from the session

		List<Request> requestDetails = com.event.RequestDBUtil.getRequestDetailsByEmail(email);
		request.setAttribute("requestDetails", requestDetails);
    }
	%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>My Event Requests</title>
    <!-- Add Bootstrap CSS link -->

</head>

<body>



<div class="container mt-5">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h2 class="text-center">Event Requests</h2>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Event Name</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact No</th>
                        <th>Assigned Planner ID</th>
                        <th>Message</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="r" items="${requestDetails}">
                        <tr>
                            <td>${r.rid}</td>
                            <td>${r.ename}</td>
                            <td>${r.username}</td>
                            <td>${r.rEmail}</td>
                            <td>${r.rphone}</td>
                            <td>${r.pid}</td>
                            <td>${r.rmessage}</td>
                            <td>${r.rdate}</td>
                            <td>${r.rstatus}</td>
                          <td>
						    <div class="btn-group" role="group">
						        <a href="editrequest.jsp?rid=${r.rid}&rphone=${r.rphone}&rmessage=${r.rmessage}" class="btn btn-primary">Edit</a>
						        <a href="cancelrequest.jsp?rid=${r.rid}&ename=${r.ename}" class="btn btn-danger">Remove</a>
						    </div>
						</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Add Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<br><br>
<%@ include file="footer.jsp" %>
</body>
</html>
