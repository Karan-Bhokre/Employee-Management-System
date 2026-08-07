package com.pack3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pack1.AddEmployeeDAO;
import com.pack2.EmployeeBean;
@WebServlet("/addemployee")
@SuppressWarnings("serial")
public class AddEmployeeServlet extends HttpServlet
{
  protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
  {
	  try 
	  {
		  EmployeeBean ebean = new EmployeeBean();

		  ebean.setaEMP_ID(req.getParameter("eid"));
		  ebean.setaNAME(req.getParameter("ename"));
		  ebean.setaEMAIL(req.getParameter("email"));
		  ebean.setaMOBILE(req.getParameter("mobile"));
		  ebean.setaDEPARTMENT(req.getParameter("department"));
		  ebean.setaDESIGNATION(req.getParameter("designation"));
		  ebean.setaPASSWORD(req.getParameter("password"));
		  
		  int rowCount = new AddEmployeeDAO().addEmployee(ebean);
		  
		  if(rowCount>0)
		  {
		  req.setAttribute("msg", "Employee Added Successfully...");
		  req.getRequestDispatcher("AddEmployee.jsp").forward(req, res);
		  }
		  else
		  {
			  req.setAttribute("msg","Employee Not Added...");
			  req.getRequestDispatcher("AddEmployee.jsp").forward(req, res);
		  }
		  
		  
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
  }
}
