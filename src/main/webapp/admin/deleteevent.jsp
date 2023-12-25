<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Event</title>
    <%@ include file="header.jsp" %>
</head>
<body>

<%
	String eid = request.getParameter("eid");
	String ename = request.getParameter("ename");
	String ecategory = request.getParameter("ecategory");
	String edesc = request.getParameter("edesc");
	String eprice = request.getParameter("eprice");
%>

<div class="container mt-5">
<h2>Delete Event</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="delevent" method="post" id="eventForm">
                <div class="form-group">
                    <label for="eid">Event ID</label>
                    <input type="text" id="eid" name="eid" value="<%= eid %>" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="ename">Event Name</label>
                    <input type="text" id="ename" name="ename" value="<%= ename %>" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="ecategory">Event Category/Type</label>
                    <input type="text" id="ecategory" name="ecategory" value="<%= ecategory %>" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="edesc">Event Description</label>
                    <input type="text" id="edesc" name="edesc" value="<%= edesc %>" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="eprice">Estimate Price</label>
                    <input type="text" id="eprice" name="eprice" value="<%= eprice %>" class="form-control" readonly>
                </div>
                <div class="form-check">
                    <input type="checkbox" id="confirm" name="confirm" class="form-check-input" checked required>
                    <label class="form-check-label" for="confirm">Confirm and Delete</label>
                </div>
                <button type="submit" name="submit" class="btn btn-danger mt-3">Delete Event</button>
            </form>
        </div>
    </div>
</div>

<!-- Include Bootstrap and jQuery scripts at the end of the body for improved performance -->
<script src="path/to/jquery.js"></script>
<script src="path/to/bootstrap.js"></script>
</body>
</html>
