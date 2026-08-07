package com.pack3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pack1.DeleteLeaveDAO;

@SuppressWarnings("serial")
@WebServlet("/DeleteLeave")
public class DeleteLeaveServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

    	HttpSession session = req.getSession(false);

    	System.out.println("Session = " + session);

    	if (session != null) {
    	    System.out.println("Admin = " + session.getAttribute("adminbean"));
    	}

        String leave_id = req.getParameter("LEAVE_ID");

        int rowCount = new DeleteLeaveDAO().deleteLeave(leave_id);

        if (rowCount > 0) {
            req.setAttribute("msg", "Leave Deleted Successfully...");
        } else {
            req.setAttribute("msg", "Leave Delete Failed...");
        }

        res.sendRedirect("ViewLeaveStatus");
    }
}