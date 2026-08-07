package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.pack2.EmployeeBean;

public class UpdateProfileDAO
{
	public int update(EmployeeBean eb)
	{
		int k = 0;

		try
		{
			Connection con = DBconnect.getCon();

			PreparedStatement ps = con.prepareStatement(
				"UPDATE EMPLOYEE1 SET NAME=?, EMAILE=?, MOBILE=?, DEPARTMENT=?, DESIGNATION=? WHERE EMP_ID=?");

			ps.setString(1, eb.getaNAME());
			ps.setString(2, eb.getaEMAIL());
			ps.setString(3, eb.getaMOBILE());
			ps.setString(4, eb.getaDEPARTMENT());
			ps.setString(5, eb.getaDESIGNATION());
			ps.setString(6, eb.getaEMP_ID());

			k = ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return k;
	}
}
