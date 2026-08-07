package com.pack3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack2.LeaveBean;

@SuppressWarnings("serial")
@WebServlet("/EditLeave")
public class EditLeaveServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
    	HttpSession session = req.getSession(false);

    	if(session == null || session.getAttribute("employee") == null)
    	{
    	    res.sendRedirect("EmployeeLogin.jsp");
    	    return;
    	}
        String leaveId = req.getParameter("LEAVE_ID");

        System.out.println("EditLeaveServlet Called");
        System.out.println("Leave ID = " + leaveId);

        ArrayList<LeaveBean> al =
                (ArrayList<LeaveBean>) session.getAttribute("leaveList");

        if (al == null) {
            res.sendRedirect("AdminViewLeaveStatus");
            return;
        }

        LeaveBean lb = null;

        for (LeaveBean bean : al) {
            if (bean.getaLEAVE_ID().equals(leaveId)) {
                lb = bean;
                break;
            }
        }

        if (lb == null) {
            req.setAttribute("msg", "Leave Record Not Found");
            req.getRequestDispatcher("ViewLeaveStatus.jsp").forward(req, res);
            return;
        }

        req.setAttribute("lbean", lb);
        req.getRequestDispatcher("EditLeave.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doGet(req, res);
    }
}