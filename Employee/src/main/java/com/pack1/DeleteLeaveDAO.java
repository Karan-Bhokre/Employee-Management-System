package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteLeaveDAO  
{
	public int deleteLeave(String dl)
	{
		int rowCount = 0;
		try
		{
			Connection con = DBconnect.getCon();
			PreparedStatement pstmt1 = con.prepareStatement("delete from LEAVE_REQUEST where LEAVE_ID=?");
			pstmt1.setString(1, dl);
			rowCount=pstmt1.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rowCount;
	}
}
