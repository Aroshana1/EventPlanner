<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
    <%
	if (session == null || session.getAttribute("email") == null) {
        //user not logged in

    }else {
        String email = (String) session.getAttribute("email");
        response.sendRedirect("userprofile.jsp");// Retrieve the email from the session
    }
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2 class="text-center mt-4">Sign Up</h2>
                <form action="signup" method="post" id="signup-form" class="mt-4">
                    <div class="form-group">
                        <input type="text" id="name" name="name" placeholder="Name" required class="form-control">
                        <div class="error" id="name-error">enter your name.</div>
                    </div>
                    <div class="form-group">
                        <input type="email" id="email" name="email" placeholder="Email" required class="form-control">
                        <div class="error" id="email-error">enter a valid email address.</div>
                    </div>
                    <div class="form-group">
                        <input type="number" id="phone" name="phone" placeholder="Phone" class="form-control">
                        <div class="error" id="phone-error">enter a valid phone number with 10 digits.</div>
                    </div>
                    <div class="form-group">
                        <input type="password" id="pwd" name="pwd" placeholder="Password" required class="form-control">
                        <div class="error" id="pwd-error"> enter your password.</div>
                    </div>
                    <div class="form-group">
                        <input type="text" id="address" name="address" placeholder="Address" required class="form-control">
                        <div class="error" id="address-error">enter your address.</div>
                    </div>
                    <div class="form-group">
                        <input type="checkbox" id="confirm" name="confirm" checked="checked" required>
                        By clicking I agreed to <a href="termsandcondition.jsp">terms & conditions</a> and
                        <a href="privacypolicy.jsp">Privacy Policy</a>
                        <div class="error" id="confirm-error">Please accept the terms and conditions.</div>
                    </div>
                    <button type="submit" name="submit" class="btn btn-primary">Create Account</button>
                </form>
                
                <p>Already have an account?<a href="login.jsp">Log in here</a></p>
            </div>
            <div class="col-md-6">
                
                <div class="bg-image" style="background-image: url('./images/eventbg.png'); height: 100vh;"></div>
            </div>
        </div>
    </div>

    <!-- Bootstrap and jQuery Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- validate sign up form -->
    <script src="./js/register.js"></script>
    
    <%@ include file="footer.jsp" %>

</body>
</html>