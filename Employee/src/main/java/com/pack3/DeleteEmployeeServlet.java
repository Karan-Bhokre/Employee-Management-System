package com.pack3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pack1.DeleteEmployeeDAO;

@SuppressWarnings("serial")
@WebServlet("/DeleteEmployee")
public class DeleteEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("adminbean") == null) {
            res.sendRedirect("AdminLogin.html");
            return;
        }

        String empId = req.getParameter("EMP_ID");

        int rowCount = new DeleteEmployeeDAO().deleteEmployee(empId);

        if (rowCount > 0) {
            session.setAttribute("msg", "Employee Deleted Successfully...");
        } else {
            session.setAttribute("msg", "Employee Delete Failed...");
        }

        res.sendRedirect("ViewEmployee");
    }
}