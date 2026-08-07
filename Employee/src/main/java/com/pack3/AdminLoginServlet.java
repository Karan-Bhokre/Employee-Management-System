package com.pack3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack1.LoginDAO;
import com.pack2.AdminBean;

@SuppressWarnings("serial")
@WebServlet("/alog")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        AdminBean abean = new LoginDAO().checkAdminLogin(username, password);

        if (abean == null) {

            req.setAttribute("msg", "Invalid Username or Password");
            req.getRequestDispatcher("AdminLogin.html").forward(req, res);

        } else {

            HttpSession session = req.getSession(true);

            // IMPORTANT: Use the same name everywhere
            session.setAttribute("adminbean", abean);

            res.sendRedirect("LoginHome.jsp");
        }
    }
}