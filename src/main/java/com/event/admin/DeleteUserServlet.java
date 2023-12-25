package com.event.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.CustomerDBUtil;


@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String id = request.getParameter("id");
		boolean isTrue;
		
		isTrue =  CustomerDBUtil.deleteaccount(id);
		
		if(isTrue==true) {
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Account Deleted!');");
			out.println("location = 'manageusers.jsp'");
			out.println("</script>");
		}else {
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Failed to delete user! try again');");
			out.println("location = 'manageusers.jsp'");
			out.println("</script>");
			
		}
	}

}
