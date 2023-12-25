<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	if (session == null || session.getAttribute("username") == null) {
        // User is not logged in, redirect to the login page
        response.sendRedirect("login.jsp");
      
    }
%>
<h2>Dashboard</h2>
<a href="AdminLogoutServlet">Logout</a><br>

</body>
</html>