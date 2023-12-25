<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="com.event.admin.EventPlanner" %>
    <%@ page import="java.util.List" %>
    <%@ include file="header.jsp" %>
    <%
 // Retrieve and store Event Planners details
    List<EventPlanner> eventPlannerDetails = com.event.admin.EventPlannerDBUtil.getEventPlannerDetails();
	request.setAttribute("eventPlannerDetails", eventPlannerDetails);
    
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Event Planner</title>

</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Manage Event Planner</h2>
    <a href="addeventplanner.jsp" class="btn btn-primary">Add New Event Planner</a><br>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>Planner ID</th>
                <th>Planner Name</th>
                <th>Experience</th>
                <th>Specified Events</th>
                <th>Contact No</th>
                <th>Action</th>
            </tr>
        </thead>
        <c:forEach var="p" items="${eventPlannerDetails}"> <!---->
            <c:set var="pid" value="${p.pid}" />
            <c:set var="pname" value="${p.pname}" />
            <c:set var="pexperience" value="${p.pexperience}" />
            <c:set var="peventtype" value="${p.peventtype}" />
            <c:set var="pphone" value="${p.pphone}" />
            <tr>
                <td>${p.pid}</td>
                <td>${p.pname}</td>
                <td>${p.pexperience}</td>
                <td>${p.peventtype}</td>
                <td>${p.pphone}</td>
                <td>
                    <c:url value="updateeventplanner.jsp" var="updateeventplanner">
                        <c:param name="pid" value="${p.pid}" />
                        <c:param name="pname" value="${p.pname}" />
                        <c:param name="pexperience" value="${p.pexperience}" />
                        <c:param name="peventtype" value="${p.peventtype}" />
                        <c:param name="pphone" value="${p.pphone}" />
                    </c:url>
                    <a href="${updateeventplanner}" class="btn btn-primary btn-sm">Update Event Planner</a>
                    <c:url value="removeeventplanner.jsp" var="removeeventplanner">
                        <c:param name="pid" value="${p.pid}" />
                        <c:param name="pname" value="${p.pname}" />
                        <c:param name="pexperience" value="${p.pexperience}" />
                        <c:param name="peventtype" value="${p.peventtype}" />
                        <c:param name="pphone" value="${p.pphone}" />
                    </c:url>
                    <a href="${removeeventplanner}" class="btn btn-danger btn-sm">Remove Event Planner</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
