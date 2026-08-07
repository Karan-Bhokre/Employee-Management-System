package com.pack3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pack2.EmployeeBean;

@SuppressWarnings("serial")
@WebServlet("/EditEmployee")
public class EditEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("adminbean") == null) {
            res.sendRedirect("AdminLogin.html");
            return;
        }

        String empId = req.getParameter("EMP_ID");

        ArrayList<EmployeeBean> al =
                (ArrayList<EmployeeBean>) session.getAttribute("employeeList");

        EmployeeBean eb = null;

        if (al != null) {
            for (EmployeeBean e : al) {
                if (e.getaEMP_ID().equals(empId)) {
                    eb = e;
                    break;
                }
            }
        }

        req.setAttribute("ebean", eb);
        req.getRequestDispatcher("EditEmployee.jsp").forward(req, res);
    }
}