package com.event.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		
		//Retrieve the ID from deleteEvent.jsp file 
		String eid = request.getParameter("eid");

		
		boolean isTrue;
		isTrue =  EventDBUtil.deleteevent(eid);
		
		
		//Display pop up to show status and redirect 
			
			if(isTrue == true) {
				
				
				out.println("<script type = 'text/javascript'>");
				out.println("alert('Event Deleted successfully');");
				out.println("location = 'manageevents.jsp'");
				out.println("</script>");
				
			}else {
				out.println("<script type = 'text/javascript'>");
				out.println("alert('Event Not Deleted. Try Again');");
				out.println("location = 'manageevents.jsp'");
				out.println("</script>");
				
			}
	}

}
