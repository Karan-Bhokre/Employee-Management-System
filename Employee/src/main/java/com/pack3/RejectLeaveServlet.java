package com.pack3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pack1.RejectLeaveDAO;
@WebServlet("/RejectLeave")
@SuppressWarnings("serial")
public class RejectLeaveServlet extends HttpServlet
{
	protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		
		String leave_status = req.getParameter("LEAVE_ID");
		
		int rowCount = new RejectLeaveDAO().rejectleave(leave_status);
		
		if(rowCount > 0)
		{
			req.setAttribute("msg", "Leave Rejected Successfully...");
		}
		else
		{
			req.setAttribute("msg", "Leave Rejected Faile...");
		}
		res.sendRedirect("ViewLeaveStatus");
	}
}
