package com.pack3;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pack1.DBconnect;
import com.pack2.EmployeeBean;

@SuppressWarnings("serial")
@WebServlet("/ChangePassword")
public class ChangePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if(session == null) {
            res.sendRedirect("EmployeeLogin.html");
            return;
        }

        EmployeeBean eb = (EmployeeBean)session.getAttribute("employee");

        if(eb == null) {
            res.sendRedirect("EmployeeLogin.html");
            return;
        }

        String oldPass = req.getParameter("oldpass");
        String newPass = req.getParameter("newpass");
        String confirmPass = req.getParameter("confirmpass");

        if(!eb.getaPASSWORD().equals(oldPass))
        {
            req.setAttribute("msg", "Old Password is Incorrect.");
            req.getRequestDispatcher("ChangePassword.jsp").forward(req, res);
            return;
        }

        if(!newPass.equals(confirmPass))
        {
            req.setAttribute("msg", "New Password and Confirm Password do not match.");
            req.getRequestDispatcher("ChangePassword.jsp").forward(req, res);
            return;
        }

        try
        {
            Connection con = DBconnect.getCon();

            PreparedStatement ps = con.prepareStatement(
            "update EMPLOYEE1 set PASSWORD=? where EMP_ID=?");

            ps.setString(1, newPass);
            ps.setString(2, eb.getaEMP_ID());

            int k = ps.executeUpdate();
            System.out.println("Updated Rows = " + k);

            if(k>0)
            {
                eb.setaPASSWORD(newPass);
                session.setAttribute("ebean", eb);

                req.setAttribute("msg",
                        "Password Changed Successfully.");

            }
            else
            {
                req.setAttribute("msg",
                        "Password Change Failed.");
            }

        }
        catch(Exception e)
        {
            e.printStackTrace();
            req.setAttribute("msg", e.getMessage());
        }

        req.getRequestDispatcher("ChangePassword.jsp")
        .forward(req, res);

    }

}