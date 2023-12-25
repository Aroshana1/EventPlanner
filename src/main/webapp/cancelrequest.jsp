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
	String ename = request.getParameter("ename");

	%>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title>Cancel Request</title>

</head>

<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-primary text-white text-center">
                    <h2>Cancel Request</h2>
                </div>
                <div class="card-body">
                    <form action="cancelrequest" method="post">
                        <div class="form-group">
                            <label for="rid">Request ID:</label>
                            <input type="text" class="form-control" id="rid" name="rid" value="<%=rid%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="ename">Event:</label>
                            <input type="text" class="form-control" id="ename" name="ename" value="<%= ename%>" readonly>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="confirm" name="confirm" checked="checked" required>
                            <label class="form-check-label" for="confirm">Are you sure to Cancel Request</label>
                        </div>
                        <button type="submit" class="btn btn-danger btn-block" name="submit">Cancel Request</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<br><br>
<%@ include file="footer.jsp" %>
</body>

</html>


