<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.event.Request" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>
	<%	
	List<Request> requestDetails = com.event.RequestDBUtil.getRequestDetails();
	request.setAttribute("requestDetails", requestDetails);
	
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Requests</title>
    
    
</head>
<body>


    

    <div class="container">
        <h2 class="mt-5">Event Requests</h2>
        <table class="table table-bordered table-striped mt-3">
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
			            <a href="updaterequest.jsp?rid=${r.rid}&pid=${r.pid}&rstatus=${r.rstatus}"
			                class="btn btn-primary">Update</a><br>
			            <a href="cancelrequest.jsp?rid=${r.rid}&ename=${r.ename}&username=${r.username}"
			                class="btn btn-danger">Remove</a>
			        </div>
			        </td>
			    </tr>
			</c:forEach>

            </tbody>
        </table>
    </div>

    <!-- Add Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>