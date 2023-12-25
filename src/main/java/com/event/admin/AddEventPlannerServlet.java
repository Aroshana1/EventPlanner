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


@WebServlet("/AddEventPlannerServlet")
public class AddEventPlannerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		//get user details from admin
		String pname = request.getParameter("pname");
		String pexperience = request.getParameter("pexperience");
		String peventtype = request.getParameter("peventtype");
		String pphone = request.getParameter("pphone");
		
		boolean isTrue;
		
		
		//call function with user inputs
		isTrue = EventPlannerDBUtil.addEventPlanner(pname, pexperience, peventtype, pphone);
		
		//pop up message
		if(isTrue == true) {
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Done');");
			out.println("location = 'manageeventplanner.jsp'");
			out.println("</script>");

			
		}else {
			out.println("<script type = 'text/javascript'>");
			out.println("alert(' Failed Try again');");
			out.println("location = 'addeventplanner.jsp'");
			out.println("</script>");
			
		}
	}

}
