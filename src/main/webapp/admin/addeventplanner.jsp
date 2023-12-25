<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Event Planner</title>
     <%@ include file="header.jsp" %>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Add New Event Planner</h2>
    <div class="login-form">
        <form action="addeventplanner" method="post" id="eventPlannerForm">
            <div class="form-group">
                <label for="pname">Event Planner Name:</label>
                <input type="text" id="pname" name="pname" class="form-control" placeholder="Event Planner Name" required>
            </div>
            <div class="form-group">
                <label for="pexperience">Experience (years):</label>
                <input type="number" id="pexperience" name="pexperience" class="form-control" placeholder="Experience" required>
            </div>
            <div class="form-group">
                <label for="peventtype">Specified Event Category:</label>
                <input type="text" id="peventtype" name="peventtype" class="form-control" placeholder="Specified Event Category/Type">
            </div>
            <div class="form-group">
                <label for="pphone">Contact No:</label>
                <input type="number" id="pphone" name="pphone" class="form-control" placeholder="Contact No" required>
            </div>
            <div class="form-check">
                <input type="checkbox" id="confirm" name="confirm" class="form-check-input" checked="checked" required>
                <label class="form-check-label" for="confirm">Confirm and Add</label>
            </div>
            <button type="submit" name="submit" class="btn btn-primary">Add Event Planner</button>
        </form>
    </div>
</div>

<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // Custom JavaScript validation for pphone field (10-digit number)
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