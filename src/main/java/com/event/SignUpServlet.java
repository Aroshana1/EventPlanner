package com.event;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String password = request.getParameter("pwd");
		
		boolean isTrue;
		
		isTrue = CustomerDBUtil.signup(name, email, phone, address, password);
		
		if(isTrue == true) {
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Successfully Registered ');");
			out.println("location = 'userprofile.jsp'");
			out.println("</script>");
			
		}else {
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Register Failed Try again');");
			out.println("location = 'register.jsp'");
			out.println("</script>");
			
		}
		
	}

}
