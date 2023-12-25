<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<%
	if (session == null || session.getAttribute("username") == null) {
        // admin is not logged in, redirect to the login page
        response.sendRedirect("login.jsp");
    }
	%>
    
    <link rel="stylesheet" href="../styles/bootstrap.min.css">
</head>
<body>
    <div class="container-fluid">
        <!-- Header Section -->
        <div class="row bg-dark text-white">
            <div class="col-6">
                <a href = "index.jsp"><img src="../images/logo.png" width = "200px" alt="Logo"></a>
            </div>
            <div class="col-6 text-right">
                <a href="AdminLogoutServlet" class="btn btn-danger">Logout</a>
            </div>
        </div>

        
        <!-- Main Content -->
        <div class="row">
            <!-- Side Nav Bar -->
            <nav class="col-md-2 bg-light sidebar">
	    <ul class="nav flex-column">
	        <li class="nav-item">
	            <a class="nav-link" href="index.jsp">
	                Dashboard
	            </a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" href="manageusers.jsp">
	                Manage Users
	            </a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" href="managerequests.jsp">
	                Manage Event Requests
	            </a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" href="manageevents.jsp">
	                Manage Events 
	            </a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" href="manageeventplanner.jsp">
	                Manage Event Planners
	            </a>
	        </li>
	        
	    </ul>
	</nav>




</body>
</html>