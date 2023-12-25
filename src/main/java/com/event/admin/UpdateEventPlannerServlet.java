package com.event.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateEventPlannerServlet")

public class UpdateEventPlannerServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String pid = request.getParameter("pid");
		String pname = request.getParameter("pname");
		String pexperience = request.getParameter("pexperience");
		String peventtype = request.getParameter("peventtype");
		String pphone = request.getParameter("pphone");
		
		boolean isTrue;
		isTrue =  EventPlannerDBUtil.updateEventPlanner(pid, pname, pexperience, peventtype, pphone);
		
		
			
			if(isTrue == true) {
				out.println("<script type = 'text/javascript'>");
				out.println("alert('Done,Updated');");
				out.println("location = 'manageeventplanner.jsp'");
				out.println("</script>");
				

				
			}else {
				out.println("<script type = 'text/javascript'>");
				out.println("alert('Update Failed Try again');");
				out.println("location = 'manageeventplanner.jsp'");
				out.println("</script>");
				
			}
		
	}

}
