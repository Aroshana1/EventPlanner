<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Event</title>
    <!-- Include Bootstrap CSS -->
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
    <h2 class="text-center">Edit Event</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="editevent" method="post" id="eventForm" onsubmit="return validateForm()">
                <div class="form-group">
                    <input type="text" id="eid" name="eid" value="<%= eid %>" class="form-control" readonly>
                </div>
                <div class="form-group">
                    Event Name:<input type="text" id="ename" name="ename" value="<%= ename %>" class="form-control" required>
                </div>
                <div class="form-group">
                    Event Category/Type:<input type="text" id="ecategory" name="ecategory" value="<%= ecategory %>" class="form-control" required>
                </div>
                <div class="form-group">
                    Event Description:<input type="text" id="edesc" name="edesc" value="<%= edesc %>" class="form-control" required>
                </div>
                <div class="form-group">
                    Price:<input type="number" id="eprice" name="eprice" value="<%= eprice %>" class="form-control" required>
                </div>
                <div class="form-check">
                    <input type="checkbox" id="confirm" name="confirm" class="form-check-input" checked required>
                    <label class="form-check-label" for="confirm">Confirm Details</label>
                </div>
                <button type="submit" name="submit" class="btn btn-primary mt-3">Save</button>
            </form>
        </div>
    </div>
</div>


<script src="./js/addevent.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
