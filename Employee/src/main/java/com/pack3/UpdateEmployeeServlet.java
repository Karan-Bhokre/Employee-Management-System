package com.pack3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pack1.UpdateEmployeeDAO;
import com.pack2.EmployeeBean;

@SuppressWarnings("serial")
@WebServlet("/UpdateEmployee")
public class UpdateEmployeeServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException
    {
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("adminbean") == null)
        {
            res.sendRedirect("AdminLogin.html");
            return;
        }

        EmployeeBean eb = new EmployeeBean();

        eb.setaEMP_ID(req.getParameter("eid"));
        eb.setaNAME(req.getParameter("name"));
        eb.setaEMAIL(req.getParameter("email"));
        eb.setaMOBILE(req.getParameter("mobile"));
        eb.setaDEPARTMENT(req.getParameter("department"));
        eb.setaDESIGNATION(req.getParameter("designation"));
        eb.setaPASSWORD(req.getParameter("password"));

        int rowCount = new UpdateEmployeeDAO().updateEmployee(eb);

        if(rowCount > 0)
        {
            req.setAttribute("msg", "Employee Updated Successfully...");
        }
        else
        {
            req.setAttribute("msg", "Employee Update Failed...");
        }

        req.getRequestDispatcher("UpdateEmployee.jsp").forward(req, res);
    }
}