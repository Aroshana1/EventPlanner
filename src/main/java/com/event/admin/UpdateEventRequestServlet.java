package com.event.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.RequestDBUtil;


@WebServlet("/UpdateEventRequestServlet")
public class UpdateEventRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String rid = request.getParameter("rid");
		String pid = request.getParameter("pid");
		String rstatus = request.getParameter("rstatus");
		
		
		boolean isTrue;
		isTrue =  RequestDBUtil.UpdateEventRequest(rid,pid,rstatus);
		
		
			
			if(isTrue == true) {
				out.println("<script type = 'text/javascript'>");
				out.println("alert('Successfully Updated');");
				out.println("location = 'managerequests.jsp'");
				out.println("</script>");

				
			}else {
				out.println("<script type = 'text/javascript'>");
				out.println("alert('Update Failed Try again');");
				out.println("location = 'managerequests.jsp'");
				out.println("</script>");
				
			}
	}

}
