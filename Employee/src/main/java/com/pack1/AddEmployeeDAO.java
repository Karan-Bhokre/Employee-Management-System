package com.pack1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;

public class AddEmployeeDAO 
{
	public int addEmployee(com.pack2.EmployeeBean Eb) throws ServletException,IOException
	{
		int rowCount = 0;
		try 
		{
			Connection con=DBconnect.getCon();
			
			PreparedStatement pstmt1 = con.prepareStatement(
				    "INSERT INTO EMPLOYEE1  VALUES (?,?,?,?,?,?,?)");

				pstmt1.setString(1, Eb.getaEMP_ID());
				pstmt1.setString(2, Eb.getaNAME());
				pstmt1.setString(3, Eb.getaEMAIL());
				pstmt1.setString(4, Eb.getaDEPARTMENT());
				pstmt1.setString(5, Eb.getaDESIGNATION());
				pstmt1.setString(6, Eb.getaPASSWORD());
				pstmt1.setString(7, Eb.getaMOBILE());
			
			rowCount = pstmt1.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rowCount;
	}
}
