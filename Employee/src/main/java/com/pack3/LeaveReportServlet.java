package com.pack3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack1.LeaveReportDAO;
import com.pack2.LeaveBean;

@SuppressWarnings("serial")
@WebServlet("/LeaveReport")
public class LeaveReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // Admin session check
        if (session == null || session.getAttribute("adminbean") == null) {
            res.sendRedirect("AdminLogin.html");
            return;
        }

        // Get all leave records
        ArrayList<LeaveBean> al =
                new LeaveReportDAO().getAllLeaves();

        // Store list in session
        session.setAttribute("reportList", al);

        // Forward to JSP
        req.getRequestDispatcher("LeaveReport.jsp")
           .forward(req, res);
    }
}