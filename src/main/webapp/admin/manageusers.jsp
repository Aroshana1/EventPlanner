<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
    <%@ page import="com.event.Customer" %>
    <%@ page import="java.util.List" %>
    <%@ include file="header.jsp" %>
    
	<%


        // Retrieve and store customer details
        List<Customer> cusDetails = com.event.CustomerDBUtil.getCustomerDetails();
        request.setAttribute("cusDetails", cusDetails);
 
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Users</title>
 

</head>
<body>



    <div class="container text-center mt-5">
        <h2>Manage Users</h2>
        <a href="adduser.jsp" class="btn btn-primary">Add New User</a>
        
        <table class="table table-bordered mt-4">
        
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>User Email</th>
                    <th>User Phone</th>
                    <th>User Address</th>
                </tr>
           <c:forEach var="cus" items="${cusDetails}">
            <c:set var = "id" value = "${cus.id}"/>
			<c:set var = "name" value = "${cus.name}"/>
			<c:set var = "email" value = "${cus.email}"/>
			<c:set var = "phone" value = "${cus.phone}"/>
			<c:set var = "address" value = "${cus.address}"/>
			<c:set var = "password" value = "${cus.password}"/>

                <tr>
                    
                    <td>${cus.id}</td>
                    <td>${cus.name}</td>
                    <td>${cus.email}</td>
                    <td>${cus.phone}</td>
                    <td>${cus.address}</td>
                    <td>
                    <div class="text-center">
            			<c:url value="edituser.jsp" var="edituser">
                			<c:param name="id" value="${id}" />

            			</c:url>
            			<a href="${edituser}" class="btn btn-primary">Update</a>

            			<c:url value="removeuser.jsp" var="removeuser">
                			<c:param name="id" value="${id}" />
                			<c:param name="name" value="${name}" />
                			<c:param name="email" value="${email}" />
            			</c:url>
            			<a href="${removeuser}" class="btn btn-danger">Remove</a>
        			</div>
                    
                    
                    </td>
                    
                </tr>
              
              </c:forEach>
    
        </table>

    </div>
    

   

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>