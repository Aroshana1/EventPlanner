<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<%	

	String rid = request.getParameter("rid");
	String ename = request.getParameter("ename");
	String username = request.getParameter("username");

	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cancel Request</title>
<%@ include file="header.jsp" %>
</head>
<body>

<div class="container mt-5">
    <div class="text-center">
        <h2>Cancel Request</h2>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="removerequest" method="post">
                <div class="form-group">
                    <label for="rid">Request ID:</label>
                    <input type="text" class="form-control" id="rid" name="rid" value="<%= rid %>" readonly>
                </div>
                <div class="form-group">
                    <label for="username">User Name:</label>
                    <input type="text" class="form-control" id="username" name="username" value="<%= username %>" readonly>
                </div>
                <div class="form-group">
                    <label for="ename">Event:</label>
                    <input type="text" class="form-control" id="ename" name="ename" value="<%= ename %>" readonly>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="confirm" name="confirm" checked="checked" required>
                    <label class="form-check-label" for="confirm">Are you sure to Remove Request</label>
                </div>
                <button type="submit" class="btn btn-danger mt-3" name="submit">Remove Request</button>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
