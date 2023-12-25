<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    	<%	
	if (session == null || session.getAttribute("email") == null) {

    }else {
    	response.sendRedirect("userprofile.jsp");
    }
	%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Login</title>
      <%@ include file="header.jsp" %>
    <style>
        body {
            background: url("./images/2.png") no-repeat right center fixed;
            background-size: cover;
        }

        .login-form {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .card {
            border: none;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center">User Login</h2>
                        <div class="text-center">
                            <img src="images/user.png" width="80" alt="User Image">
                        </div>
                        <form action="log" method="post">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" id="email" name="email" class="form-control"
                                    placeholder="Enter your email">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="pwd" class="form-control"
                                    placeholder="Enter your password">
                            </div>
                            <button name="login" type="submit" class="btn btn-primary btn-block">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
      <%@ include file="footer.jsp" %>
</body>

</html>


