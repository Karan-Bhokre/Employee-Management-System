package com.pack3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack1.UpdateLeaveDAO;
import com.pack2.LeaveBean;
@WebServlet("/UpdateLeave")
@SuppressWarnings("serial")
public class UpdateLeaveServlet extends HttpServlet

{
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException {
		HttpSession session = req.getSession(false);
		
		if(session == null)
		{
			req.getRequestDispatcher("EmployeeLogin.html").forward(req, res);
		}
		else
		{
			LeaveBean lb = new LeaveBean();

			lb.setaLEAVE_ID(req.getParameter("lcode"));
			lb.setaEMP_ID(req.getParameter("empid"));
			lb.setaLEAVE_TYPE(req.getParameter("ltype"));
			lb.setaFROM_DATE(req.getParameter("fdate"));
			lb.setaTO_DATE(req.getParameter("tdate"));
			lb.setaREASON(req.getParameter("reason"));
			lb.setaSTATUS(req.getParameter("status"));

			System.out.println("Leave ID = " + lb.getaLEAVE_ID());
			System.out.println("Employee ID = " + lb.getaEMP_ID());
			System.out.println("Leave Type = " + lb.getaLEAVE_TYPE());
			System.out.println("Status = " + lb.getaSTATUS());

			UpdateLeaveDAO dao = new UpdateLeaveDAO();
			int k = dao.update(lb);

			System.out.println("Rows Updated = " + k);

			if(k > 0)
			{
			    req.setAttribute("msg", "Leave Updated Successfully");
			}
			else
			{
			    req.setAttribute("msg", "Leave Update Failed");
			}
			req.getRequestDispatcher("UpdateLeave.jsp").forward(req, res);
		 }
	}
}
