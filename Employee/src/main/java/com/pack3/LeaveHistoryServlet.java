package com.pack3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pack1.LeaveHistoryDAO;
import com.pack2.LeaveBean;

@SuppressWarnings("serial")
@WebServlet("/LeaveHistory")
public class LeaveHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null) {
            res.sendRedirect("EmployeeLogin.html");
            return;
        }

        LeaveHistoryDAO dao = new LeaveHistoryDAO();
        ArrayList<LeaveBean> hl = dao.viewAllLeaveHistory();

        System.out.println("Leave List Size = " + hl.size());

        req.setAttribute("leaveList", hl);

        req.getRequestDispatcher("LeaveHistory.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        doGet(req, res);
    }
}