package com.pack3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack1.ViewEmployeeDAO;
import com.pack2.AdminBean;
import com.pack2.EmployeeBean;
@WebServlet("/ViewEmployee")
@SuppressWarnings("serial")
public class VewEmployeeServlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		HttpSession session= req.getSession(false);

		if (session == null) {
		    res.sendRedirect("AdminLogin.html");
		    return;
		}

		AdminBean abean = (AdminBean) session.getAttribute("adminbean");

		if (abean == null) {
		    res.sendRedirect("AdminLogin.html");
		    return;
		}
		ViewEmployeeDAO emp = new ViewEmployeeDAO();
		
		ArrayList<EmployeeBean> al =emp.reteriveEmployee();
		
		System.out.println("Employee size : "+al.size());
		
		session.setAttribute("employeeList", al);
		
		req.getRequestDispatcher("ViewEmployee.jsp").forward(req, res);
	}
}
