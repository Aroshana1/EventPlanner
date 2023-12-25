<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./styles/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
    .bg-cyan {
      background-color: #0066ff;
    }
    .bg-image {
      background-image: url('./images/1.png');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
    }
    .rounded-square {
      text-align: center;
      border: 2px solid #ccc;
      border-radius: 15px;
      padding: 20px;
      color: blue;
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-cyan">
  <div class="container">
    <a class="navbar-brand" href="index.jsp"><img src="./images/logo.png" width="200px" alt="Momentous"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link text-white" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="events.jsp">Events</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="#">Contact Us</a>
        </li>
        <li class="nav-item">
          <%
            if (session == null || session.getAttribute("email") == null) {
          %>
            <a class="nav-link text-white" href="login.jsp">Login</a>
          <%
            } else {
          %>
          <a class="nav-link text-white" href="userprofile.jsp">My Profile</a>
          </li>
            
         <li class="nav-item">
          <a class="nav-link text-white" href="LogOutServlet">Log Out</a>
        </li>
            
          <%
            }
          %>

      </ul>
    </div>
  </div>
</nav>

