package com.event;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteRequestServlet")
public class DeleteRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String rid = request.getParameter("rid");

		
		
		boolean isTrue;
		isTrue =  RequestDBUtil.DeleteRequest(rid);
		
		
			
			if(isTrue == true) {
				out.println("<script type = 'text/javascript'>");
				out.println("alert('Successfully Deleted');");
				out.println("location = 'myrequests.jsp'");
				out.println("</script>");

				
			}else {
				out.println("<script type = 'text/javascript'>");
				out.println("alert('Delete Failed Try again');");
				out.println("location = 'myrequests.jsp'");
				out.println("</script>");
				
			}
		
	}

}
