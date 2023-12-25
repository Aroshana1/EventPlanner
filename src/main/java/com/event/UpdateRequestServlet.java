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




@WebServlet("/UpdateRequestServlet")
public class UpdateRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String rid = request.getParameter("rid");
		String rphone = request.getParameter("rphone");
		String rmessage= request.getParameter("rmessage");
		
		
		boolean isTrue;
		isTrue =  RequestDBUtil.UpdateRequest(rid,rphone,rmessage);
		
		
			
			if(isTrue == true) {
				out.println("<script type = 'text/javascript'>");
				out.println("alert('Successfully Updated');");
				out.println("location = 'myrequests.jsp'");
				out.println("</script>");

				
			}else {
				out.println("<script type = 'text/javascript'>");
				out.println("alert('Update Failed Try again');");
				out.println("location = 'myrequests.jsp'");
				out.println("</script>");
				
			}
	}

}
