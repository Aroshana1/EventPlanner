<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="header.jsp" %>
    
	<%	
	if (session == null || session.getAttribute("email") == null) {
        // User is not logged in, redirect to the login page
        response.sendRedirect("login.jsp");
    }else {
        String email = (String) session.getAttribute("email"); // Retrieve the email from the session
    }
	
	String rid = request.getParameter("rid");
	String rphone = request.getParameter("rphone");
	String rmessage = request.getParameter("rmessage");
	%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Request</title>

</head>
<body>

<div class="container mt-5">
    <center><h2>Edit Request</h2></center>
    <div class="card">
        <div class="card-body">
            <form action="editrequest" method="post">
                <div class="form-group">
                    <label for="rid">Request ID:</label>
                    <input type="text" class="form-control" id="rid" name="rid" value="<%= rid %>" readonly>
                </div>
                <div class="form-group">
                    <label for="rphone">Contact No:</label>
                    <input type="text" class="form-control" id="rphone" name="rphone" value="<%= rphone %>">
                </div>
                <div class="form-group">
                    <label for="rmessage">Message:</label>
                    <input type="text" class="form-control" id="rmessage" name="rmessage" value="<%= rmessage %>">
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="confirm" name="confirm" checked="checked" required>
                    <label class="form-check-label" for="confirm">Confirm Details</label>
                </div>
                <button type="submit" class="btn btn-primary" name="submit">Update Request</button>
            </form>
        </div>
    </div>
</div>
<br><br>
<%@ include file="footer.jsp" %>
</body>
</html>