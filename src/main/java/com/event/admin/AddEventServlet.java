package com.event.admin;

import java.io.IOException;
import java.io.PrintWriter;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String ename = request.getParameter("ename");
		String ecategory = request.getParameter("ecategory");
		String edesc = request.getParameter("edesc");
		String eprice = request.getParameter("eprice");
		
		boolean isTrue;
		isTrue = EventDBUtil.addevent(ename, ecategory, edesc, eprice);
		
		
		//Display pop up to show status and redirect 
		
		if(isTrue == true) {
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Event Added Successfully');");
			out.println("location = 'manageevents.jsp'");
			out.println("</script>");

			
		}else {
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Failed! Try again');");
			out.println("location = 'addevent.jsp'");
			out.println("</script>");
			
		}
	}

}
