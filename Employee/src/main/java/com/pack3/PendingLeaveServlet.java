package com.pack3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pack1.PendingLeaveDAO;
import com.pack2.LeaveBean;

@SuppressWarnings("serial")
@WebServlet("/PendingLeave")
public class PendingLeaveServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("adminbean") == null) {
            res.sendRedirect("AdminLogin.jsp");
            return;
        }

        ArrayList<LeaveBean> al = new PendingLeaveDAO().getPendingLeaves();

        session.setAttribute("pendingList", al);

        req.getRequestDispatcher("PendingLeave.jsp").forward(req, res);
    }
}