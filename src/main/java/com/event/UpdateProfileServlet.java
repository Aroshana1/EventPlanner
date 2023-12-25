package com.event;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String password = request.getParameter("pwd");
		
		boolean isTrue;
		isTrue =  CustomerDBUtil.updateuser(id,name,email,phone,address,password);
		
		
		if(isTrue == true) {
			
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Updation Success');");
			out.println("location = 'userprofile.jsp'");
			out.println("</script>");
			
		}
		else {

			
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Updation Failed Try again');");
			out.println("location = 'userprofile.jsp'");
			out.println("</script>");
			
			
		}
	}
}
