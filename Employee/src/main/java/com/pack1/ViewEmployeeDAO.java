package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pack2.EmployeeBean;


public class ViewEmployeeDAO 
{
	public ArrayList<com.pack2.EmployeeBean> reteriveEmployee()
	{
	 ArrayList<EmployeeBean> al=new ArrayList<EmployeeBean>();
	 try
	 {
		 Connection con=DBconnect.getCon();
		 
		 PreparedStatement pstmt2 = con.prepareStatement("select * from EMPLOYEE1");
		 ResultSet rowCount = pstmt2.executeQuery();
		 while(rowCount.next())
		 {
			 EmployeeBean eb=new EmployeeBean();
			 eb.setaEMP_ID(rowCount.getString("EMP_ID"));
			 eb.setaNAME(rowCount.getString("NAME"));
			 eb.setaEMAIL(rowCount.getString("EMAILE"));
			 eb.setaMOBILE(rowCount.getString("MOBILE"));
			 eb.setaDEPARTMENT(rowCount.getString("DEPARTMENT"));
			 eb.setaDESIGNATION(rowCount.getString("DESIGNATION"));
			 eb.setaPASSWORD(rowCount.getString("PASSWORD"));
			 al.add(eb);
		 }
	 }
	 catch(Exception e)
	 {
		 e.printStackTrace();
	 }
	 return al;
	}
}
