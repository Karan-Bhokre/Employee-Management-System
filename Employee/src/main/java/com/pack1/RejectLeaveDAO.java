package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class RejectLeaveDAO
{
	public int rejectleave(String rl)
	{
		int rowCount = 0;
		try
		{
			 Connection con = DBconnect.getCon();

	            PreparedStatement ps = con.prepareStatement(
	                "UPDATE LEAVE_REQUEST SET STATUS=? WHERE LEAVE_ID=?");

	            ps.setString(1, "Reject");
	            ps.setString(2, rl);

	            rowCount = ps.executeUpdate();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rowCount;
	}
}
