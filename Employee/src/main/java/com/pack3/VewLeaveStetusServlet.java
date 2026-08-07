package com.pack3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack1.ViewLeaveStatusDAO;
import com.pack2.EmployeeBean;
import com.pack2.LeaveBean;

@SuppressWarnings("serial")
@WebServlet("/ViewLeaveStatus")
public class VewLeaveStetusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

    	HttpSession session = req.getSession(false);

    	if (session == null) {
    	    res.sendRedirect("EmployeeLogin.jsp");
    	    return;
    	}

    	EmployeeBean eb = (EmployeeBean) session.getAttribute("employee");

    	if (eb == null) {
    	    res.sendRedirect("EmployeeLogin.jsp");
    	    return;
    	}

    	ViewLeaveStatusDAO dao = new ViewLeaveStatusDAO();

    	ArrayList<LeaveBean> al = dao.viewLeaveStatus(eb.getaEMP_ID());

    	System.out.println("EMP_ID = " + eb.getaEMP_ID());
    	System.out.println("Leave Count = " + al.size());

    	session.setAttribute("leaveList", al);
    	req.setAttribute("leaveList", al);

    	req.getRequestDispatcher("ViewLeaveStatus.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        doGet(req, res);
    }
}