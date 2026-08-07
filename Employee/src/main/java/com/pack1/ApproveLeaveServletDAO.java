package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ApproveLeaveServletDAO
{
	public int approveleave(String al)
	{
		int rowCount = 0;
		try
		{
			 Connection con = DBconnect.getCon();

	            PreparedStatement ps = con.prepareStatement(
	                "UPDATE LEAVE_REQUEST SET STATUS=? WHERE LEAVE_ID=?");

	            ps.setString(1, "Approved");
	            ps.setString(2, al);

	            rowCount = ps.executeUpdate();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rowCount;
	}
}
