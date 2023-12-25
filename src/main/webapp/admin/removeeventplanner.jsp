<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Remove Event Planner</title>

     <%@ include file="header.jsp" %>
</head>
<body>
<%
    String pid = request.getParameter("pid");
    String pname = request.getParameter("pname");
    String pexperience = request.getParameter("pexperience");
    String peventtype = request.getParameter("peventtype");
    String pphone = request.getParameter("pphone");
%>

<div class="container mt-5">
    <h2 class="text-center">Remove Event Planner</h2>

    <div class="login-form">
        <form action="removeeventplanner" method="post">
            <div class="form-group">
               ID: <input type="text" id="pid" name="pid" value="<%= pid %>" class="form-control" readonly>
            </div>
            <div class="form-group">
               Name: <input type="text" id="pname" name="pname" value="<%= pname %>" class="form-control" readonly>
            </div>
            <div class="form-group">
               Experience: <input type="text" id="pexperience" name="pexperience" value="<%= pexperience %>" class="form-control" readonly>
            </div>
            <div class="form-group">
                Specified Event Category:<input type="text" id="peventtype" name="peventtype" value="<%= peventtype %>" class="form-control" readonly>
            </div>
            <div class="form-group">
                Contact No:<input type="text" id="pphone" name="pphone" value="<%= pphone %>" class="form-control" readonly>
            </div>
            <div class="form-check">
                <input type="checkbox" id="confirm" name="confirm" class="form-check-input" checked="checked" required>
                <label class="form-check-label" for="confirm">Confirm and Delete</label>
            </div>
            <button type="submit" name="submit" class="btn btn-danger">Delete Event Planner</button>
        </form>
    </div>
</div>

<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
