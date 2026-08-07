package com.pack3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pack1.ViewLeaveStatusDAO;
import com.pack2.AdminBean;
import com.pack2.LeaveBean;

@SuppressWarnings("serial")
@WebServlet("/AdminViewLeaveStatus")
public class AdminViewLeaveStatusServlet extends HttpServlet {


    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {


        HttpSession session = req.getSession(false);


        if(session == null || session.getAttribute("adminbean") == null)
        {
            res.sendRedirect("AdminLogin.html");
            return;
        }


        AdminBean abean = (AdminBean) session.getAttribute("adminbean");


        ViewLeaveStatusDAO dao = new ViewLeaveStatusDAO();


        ArrayList<LeaveBean> al = dao.viewAllLeaveStatus();


        session.setAttribute("leaveList", al);
        req.setAttribute("leaveList", al);


        req.getRequestDispatcher("ViewLeaveStatus.jsp")
           .forward(req, res);

    }


    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        doGet(req,res);
    }
}