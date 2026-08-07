package com.pack3;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pack1.ApplyLeaveDAO;
import com.pack2.LeaveBean;

@SuppressWarnings("serial")
@WebServlet("/ApplyLeave")
public class ApplyLeaveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        LeaveBean lb = new LeaveBean();

        lb.setaLEAVE_ID(req.getParameter("leaveid"));
        lb.setaEMP_ID(req.getParameter("empid"));
        lb.setaLEAVE_TYPE(req.getParameter("leavetype"));
        lb.setaFROM_DATE(req.getParameter("fromdate"));
        lb.setaTO_DATE(req.getParameter("todate"));
        lb.setaREASON(req.getParameter("reason"));
        lb.setaSTATUS("Pending");

        int k = new ApplyLeaveDAO().applyLeave(lb);

        if (k > 0) {
            req.setAttribute("msg", "Leave Applied Successfully.");
            req.getRequestDispatcher("ApplyLeave.jsp").forward(req, res);
        } else {
            req.setAttribute("msg", "Leave Application Failed.");
            req.getRequestDispatcher("ApplyLeave.jsp").forward(req, res);
        }

    }
}
