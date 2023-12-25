<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ page import="com.event.admin.Event" %>
       <%@ page import="java.util.List" %>
       <%@ include file="header.jsp" %>
    
	<%


        // Retrieve and store event details
        List<Event> eventDetails = com.event.admin.EventDBUtil.getEventDetails();
		request.setAttribute("eventDetails", eventDetails);
 
	%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Momentous: Online Event Planner</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
    .bg-cyan {
      background-color: #0066ff;
    }
    .bg-image {
      background-image: url('./images/2.png');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
    }
    .rounded-square {
      text-align: center;
      border: 5px solid #0066ff;
      border-radius: 15px;
      padding: 20px;
      margin-bottom:30px;
      color: blue;
    }
  </style>
</head>
<body>


  <div class="jumbotron jumbotron-fluid text-center bg-image">
    <div class="container">
      <h1 class="display-4 text-white">About Event Planning</h1>
      <p class="lead text-white">Momentous Your Event Planner.</p>
      <p><a href="register.jsp" class="btn btn-primary btn-lg">Sign Up</a> <a href="register.jsp" class="btn btn-success btn-lg">Get Started</a></p>
    </div>
  </div>

  <div class="container my-5">
    <div class="row">
    <c:forEach var="event" items="${eventDetails}">
      <div class="col-md-4">
        <div class="rounded-square">
           <h3>${event.ename}</h3>
          <img src="./images/event1.png" width = "100px" alt="Image 3">
          <p>${event.edesc}</p>
           <a href="requestevent.jsp?id=${event.eid}" class="btn btn-primary">Request Event</a>
        </div>
      </div>
      </c:forEach>

    </div>
  </div>


<%@ include file="footer.jsp" %>
</body>
</html>
