<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Event Planner</title>
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
    <h2 class="text-center">Update Event Planner</h2>
    <div class="login-form">
        <form action="updateeventplanner" method="post" id="eventPlannerForm">
            <div class="form-group">
                <label for="pid">ID:</label>
                <input type="text" id="pid" name="pid" value="<%= pid %>" class="form-control" readonly>
            </div>
            <div class="form-group">
                <label for="pname">Event Planner Name:</label>
                <input type="text" id="pname" name="pname" value="<%= pname %>" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="pexperience">Experience (Years):</label>
                <input type="number" id="pexperience" name="pexperience" value="<%= pexperience %>" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="peventtype">Specified Event Category:</label>
                <input type="text" id="peventtype" name="peventtype" value="<%= peventtype %>" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="pphone">Contact No:</label>
                <input type="text" id="pphone" name="pphone" value="<%= pphone %>" class="form-control" required>
            </div>
            <div class="form-check">
                <input type="checkbox" id="confirm" name="confirm" class="form-check-input" checked="checked" required>
                <label class="form-check-label" for="confirm">Confirm Details & Update</label>
            </div>
            <button type="submit" name="submit" class="btn btn-primary">Update Event Planner</button>
        </form>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // JavaScript validation for pphone field (10-digit number)
    document.getElementById('eventPlannerForm').addEventListener('submit', function (e) {
        const pphoneInput = document.getElementById('pphone');
        const pphoneValue = pphoneInput.value;

        if (pphoneValue.length !== 10 || isNaN(pphoneValue)) {
            e.preventDefault(); // Prevent form submission
            alert('Please enter a valid 10-digit phone number.');
            pphoneInput.focus();
        }
    });
</script>

</body>
</html>