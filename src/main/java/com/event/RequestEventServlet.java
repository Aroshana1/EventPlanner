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
 * Servlet implementation class RequestEventServlet
 */
@WebServlet("/RequestEventServlet")
public class RequestEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String username = request.getParameter("username");
		String ename = request.getParameter("ename");
		String remail = request.getParameter("remail");
		String rphone = request.getParameter("rphone");
		String rmessage = request.getParameter("rmessage");
		
		boolean isTrue;
		
		isTrue = RequestDBUtil.RequestEvent(username, ename, remail, rphone, rmessage);
		
		if(isTrue == true) {
			
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Your Request Submitted');");
			out.println("location = 'myrequests.jsp'");
			out.println("</script>");

			
		}else {
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Submition Failed , Try again');");
			out.println("location = 'events.jsp'");
			out.println("</script>");
			
		}
	}

}
