<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Planner Management</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="../styles/bootstrap.min.css">
    <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">-->
</head>
<body>
    <%@ page import="com.event.admin.EventPlanner" %>
	<%@ page import="java.util.List" %>
	

	<%
		List<EventPlanner> eventPlannerDetails = com.event.admin.EventPlannerDBUtil.getEventPlannerDetails();
		request.setAttribute("eventPlannerDetails", eventPlannerDetails);
	%>

    <div class="container">
        <h2 class="mt-5">Manage Event Planner</h2>
        <table class="table table-bordered table-striped mt-3">
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
            <tbody>
                <c:forEach var="p" items="${eventPlannerDetails}">
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
                            <a href="updateeventplanner.jsp?pid=${p.pid}&pname=${p.pname}&pexperience=${p.pexperience}&peventtype=${p.peventtype}&pphone=${p.pphone}"
                                class="btn btn-primary">Update Event Planner</a>
                            <a href="removeeventplanner.jsp?pid=${p.pid}&pname=${p.pname}&pexperience=${p.pexperience}&peventtype=${p.peventtype}&pphone=${p.pphone}"
                                class="btn btn-danger">Remove Event Planner</a>
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
