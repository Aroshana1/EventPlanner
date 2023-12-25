<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%
	if (session == null || session.getAttribute("username") == null) {

    }else{
    	response.sendRedirect("index.jsp");
    }
	%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="../styles/bootstrap.min.css">
    <style>
        body {
            background-image: url("../images/eventbg.png"); 
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: white;
        }

        .login-form {
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            padding: 40px;
            text-align: center;
            margin: 0 auto;
            max-width: 400px;
            margin-top: 100px;
        }

        .card {
            border: none;
        }

        .logo {
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="login-form">
                    <h2 class="mb-4">Admin Login</h2>
                    <div class="logo">
                        <img src="../images/logo.png" width="250" alt="logoImage">
                    </div>
                    <form action="adminlogin" method="post">
                        <div class="form-group">
                            <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                        </div>
                        <div class="form-group">
                            <input type="password" id="password" name="pwd" class="form-control" placeholder="Password">
                        </div>
                        <button name="login" type="submit" class="btn btn-primary btn-block">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>

