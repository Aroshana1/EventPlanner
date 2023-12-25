<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="header.jsp" %>
    <meta charset="UTF-8">
    <title>Add Event</title>

</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Add New Event</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="addevent" method="post" id="eventForm" onsubmit="return validateForm()">
                <div class="form-group">
                
                    Event Name:<input type="text" id="ename" name="ename" class="form-control" placeholder="Event Name" required>
                </div>
                <div class="form-group">
                    Event Category/Type:<input type="text" id="ecategory" name="ecategory" class="form-control" placeholder="Event Category/Type" required>
                </div>
                <div class="form-group">
                    Event Description:<input type="text" id="edesc" name="edesc" class="form-control" placeholder="Event Description"required>
                </div>
                <div class="form-group">
                    Estimate Price:<input type="number" id="eprice" name="eprice" class="form-control" placeholder="Estimate Price" required>
                </div>
                <div class="form-check">
                    <input type="checkbox" id="confirm" name="confirm" class="form-check-input" checked required>
                    <label class="form-check-label" for="confirm">I confirm the event details are accurate</label>
                </div>
                <button type="submit" name="submit" class="btn btn-primary mt-3">Add Event</button>
            </form>
        </div>
    </div>
</div>


<script src="./js/adevent.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>