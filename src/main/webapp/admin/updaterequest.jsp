<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="com.event.admin.EventPlanner" %>
    <%@ page import="java.util.List" %>
    
	<%	
	if (session == null || session.getAttribute("username") == null) {
        // admin is not logged in, redirect to the login page
        response.sendRedirect("login.jsp");
    }
	
	String rid = request.getParameter("rid");
	String pid = request.getParameter("pid");
	String rstatus = request.getParameter("rstatus");
	
	//get event planner details
	 // Retrieve and store Event Planners details
    List<EventPlanner> eventPlannerDetails = com.event.admin.EventPlannerDBUtil.getEventPlannerDetails();
	request.setAttribute("eventPlannerDetails", eventPlannerDetails);
	
	%>
	
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Event Request</title>
<%@ include file="header.jsp" %>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Update Request</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="UpdateEventRequest" method="post" onsubmit="return validateForm();">
                <div class="form-group">
                    <label for="rid">Request ID:</label>
                    <input type="text" class="form-control" id="rid" name="rid" value="<%= rid %>" readonly>
                </div>
                <div class="form-group">
                    <label for="rstatus">Status:</label>
                    <input type="text" class="form-control" id="rstatus" name="rstatus" value="<%= rstatus %>" required>
                </div>
                <div class="form-group">
                    <label for="pid">Assign Event Planner ID:</label>
                    <input type="number" class="form-control" id="pid" name="pid" value="<%= pid %>" required>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="confirm" name="confirm" checked="checked" required>
                    <label class="form-check-label" for="confirm">Confirm Event Request</label>
                </div>
                <button type="submit" class="btn btn-primary mt-3" name="submit">Confirm</button>
            </form>
        </div>
    </div>

<br>
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
                
            </tr>
        </thead>
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

            </tr>
        </c:forEach>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function validateForm() {
    var rstatus = document.getElementById("rstatus").value;
    var pid = document.getElementById("pid").value;

    if (rstatus === "" || pid === "") {
        alert("All fields must be filled out.");
        return false;
    }

    return true;
}
</script>
</body>
</html>
