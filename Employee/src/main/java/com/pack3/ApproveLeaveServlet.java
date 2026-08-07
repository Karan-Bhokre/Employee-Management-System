package com.pack3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pack1.ApproveLeaveServletDAO;

@WebServlet("/ApproveLeave")
@SuppressWarnings("serial")
public class ApproveLeaveServlet extends HttpServlet
{
    protected void doGet(HttpServletRequest req,HttpServletResponse res)
    throws ServletException,IOException
    {

        String leave_id = req.getParameter("LEAVE_ID");

        int rowCount = new ApproveLeaveServletDAO()
                .approveleave(leave_id);


        if(rowCount > 0)
        {
            req.setAttribute("msg",
                    "Leave Approved Successfully...");
        }
        else
        {
            req.setAttribute("msg",
                    "Leave Approve Failed...");
        }


        req.getRequestDispatcher("ApproveLeave.jsp")
           .forward(req,res);
    }
}