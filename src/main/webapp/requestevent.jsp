<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request Event</title>
    <!-- Add Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ page import="com.event.admin.Event" %>
    <%@ page import="java.util.List" %>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <% 
                    if (session == null || session.getAttribute("email") == null) {
                        // User is not logged in, redirect to the login page
                        response.sendRedirect("login.jsp");
                    }
                    String eventid = request.getParameter("id");
                    String eMail = (String) session.getAttribute("email");

                    List<Event> eventDetails = com.event.admin.EventDBUtil.getEventDetailsByID(eventid);
                    request.setAttribute("eventDetails", eventDetails);
                %>

                <c:forEach var="event" items="${eventDetails}">
                    <c:set var="eid" value="${event.eid}" />
                    <c:set var="eName" value="${event.ename}" />
                    <c:set var="ecategory" value="${event.ecategory}" />
                    <c:set var="edesc" value="${event.edesc}" />
                    <c:set var="eprice" value="${event.eprice}" />
                </c:forEach>

                <img src="./images/eventbg.png" class="img-fluid" alt="Event Background Image">
                <h2>Request ${eName} Event</h2>
                <p>${edesc}</p>
                <p>Rs. ${eprice}.00</p>

                <div class="e-form">
                    <form action="requestevent" method="post" id="requestForm">
                        Event ID:<input type="text" id="eid" name="eid" value="<%= eventid %>" readonly><br><br>
                        Event Name:<input type="text" id="ename" name="ename" value="${eName}" readonly><br><br>
                        Your Email:<input type="text" id="remail" name="remail" value="<%= eMail %>" readonly><br><br>
                        <div class="mb-3">
                            <label for="username" class="form-label">Your Name</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="rphone" class="form-label">Contact No</label>
                            <input type="number" class="form-control" id="rphone" name="rphone" required>
                            <small id="phoneHelp" class="form-text text-danger"></small>
                        </div>
                        <div class="mb-3">
                            <label for="rmessage" class="form-label">Your Request</label>
                            <input type="text" class="form-control" id="rmessage" name="rmessage" required>
                        </div>
                        <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input" id="confirm" name="confirm" checked="checked" required>
                            <label class="form-check-label" for="confirm">Confirm Details</label>
                        </div>
                        <button type="submit" name="submit" class="btn btn-primary">Request Event</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- custom JavaScript for phone number validation -->
    <script>
        document.getElementById("requestForm").addEventListener("submit", function (event) {
            var phoneNumberInput = document.getElementById("rphone");
            var phoneHelp = document.getElementById("phoneHelp");
            var phoneNumber = phoneNumberInput.value;

            if (phoneNumber.length !== 10 || !/^\d+$/.test(phoneNumber)) {
                phoneHelp.textContent = "Please enter a valid 10-digit phone number.";
                event.preventDefault();
            } else {
                phoneHelp.textContent = "";
            }
        });
    </script>
    <br><br>
<%@ include file="footer.jsp" %>
</body>
</html>