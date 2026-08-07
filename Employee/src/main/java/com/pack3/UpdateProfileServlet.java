package com.pack3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack1.UpdateProfileDAO;
import com.pack2.EmployeeBean;

@SuppressWarnings("serial")
@WebServlet("/UpdateProfile")
public class UpdateProfileServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		HttpSession session = req.getSession(false);

		if(session == null)
		{
			res.sendRedirect("EmployeeLogin.html");
			return;
		}

		EmployeeBean eb = new EmployeeBean();

		eb.setaEMP_ID(req.getParameter("eid"));
		eb.setaNAME(req.getParameter("name"));
		eb.setaEMAIL(req.getParameter("email"));
		eb.setaMOBILE(req.getParameter("mobile"));
		eb.setaDEPARTMENT(req.getParameter("department"));
		eb.setaDESIGNATION(req.getParameter("designation"));

		int k = new UpdateProfileDAO().update(eb);

		if(k > 0)
		{
			session.setAttribute("employee", eb);
			req.setAttribute("msg", "Profile Updated Successfully...");
		}
		else
		{
			req.setAttribute("msg", "Profile Update Failed...");
		}

		req.getRequestDispatcher("UpdateProfile.jsp").forward(req, res);
	}
}