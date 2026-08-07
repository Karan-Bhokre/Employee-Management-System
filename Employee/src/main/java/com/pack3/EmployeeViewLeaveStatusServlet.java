package com.pack3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pack1.ViewLeaveStatusDAO;
import com.pack2.EmployeeBean;
import com.pack2.LeaveBean;

@SuppressWarnings("serial")
@WebServlet("/EmployeeViewLeaveStatus")
public class EmployeeViewLeaveStatusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("employee") == null)
        {
            res.sendRedirect("EmployeeLogin.jsp");
            return;
        }

        EmployeeBean eb = (EmployeeBean) session.getAttribute("employee");

        ViewLeaveStatusDAO dao = new ViewLeaveStatusDAO();

        ArrayList<LeaveBean> al = dao.viewLeaveStatus(eb.getaEMP_ID());
        req.setAttribute("leaveList", al);

        req.getRequestDispatcher("ViewLeaveStatus.jsp")
           .forward(req, res);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        doGet(req, res);
    }
}