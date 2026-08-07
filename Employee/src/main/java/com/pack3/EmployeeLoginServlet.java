package com.pack3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack1.EmployeeLoginDAO;
import com.pack2.EmployeeBean;

@SuppressWarnings("serial")
@WebServlet("/EmployeeLogin")
public class EmployeeLoginServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		EmployeeBean eb = new EmployeeLoginDAO().login(email, password);

		if (eb == null)
		{
			req.setAttribute("msg", "Invalid Email or Password");
			req.getRequestDispatcher("EmployeeLogin.jsp").forward(req, res);
		}
		else
		{
			HttpSession session = req.getSession();
			session.setAttribute("employee", eb);

			req.getRequestDispatcher("EmployeeHome.jsp").forward(req, res);
		}
	}
}
