<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ page import="com.event.admin.Event" %>
       <%@ page import="java.util.List" %>
       <%@ include file="header.jsp" %>
    
	<%


        // Retrieve and store event details
        List<Event> eventDetails = com.event.admin.EventDBUtil.getEventDetails();
		request.setAttribute("eventDetails", eventDetails);
 
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Events</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="path/to/bootstrap.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Manage Events</h2>
    <a href="addevent.jsp" class="btn btn-primary">Add New Event</a>
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Event ID</th>
                <th>Event Name</th>
                <th>Event Category</th>
                <th>Event Description</th>
                <th>Event Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        
        	<!--Assigning earlier retrieved data to the new variables -->
            <c:forEach var="event" items="${eventDetails}">
                <c:set var="eid" value="${event.eid}" />
                <c:set var="ename" value="${event.ename}" />
                <c:set var="ecategory" value="${event.ecategory}" />
                <c:set var="edesc" value="${event.edesc}" />
                <c:set var="eprice" value="${event.eprice}" />

                <tr>
                    <td>${event.eid}</td>
                    <td>${event.ename}</td>
                    <td>${event.ecategory}</td>
                    <td>${event.edesc}</td>
                    <td>${event.eprice}</td>
                    <td>
                    
                    <div class="btn-group" role="group">
                    <!-- Generating URL for the button including required data to be passed -->
                        <c:url value="editevent.jsp" var="editevent">
                            <c:param name="eid" value="${eid}" />
                            <c:param name="ename" value="${ename}" />
                            <c:param name="ecategory" value="${ecategory}" />
                            <c:param name="edesc" value="${edesc}" />
                            <c:param name="eprice" value="${eprice}" />
                        </c:url>
                        
                        <a href="${editevent}" class="btn btn-primary">Edit Event</a>

                        <c:url value="deleteevent.jsp" var="deleteevent">
                            <c:param name="eid" value="${eid}" />
                            <c:param name="ename" value="${ename}" />
                            <c:param name="ecategory" value="${ecategory}" />
                            <c:param name="edesc" value="${edesc}" />
                            <c:param name="eprice" value="${eprice}" />
                        </c:url>

                        <a href="${deleteevent}" class="btn btn-danger">Delete Event</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
