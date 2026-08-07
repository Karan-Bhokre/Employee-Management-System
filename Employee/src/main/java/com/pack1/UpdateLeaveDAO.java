package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.pack2.LeaveBean;

public class UpdateLeaveDAO 
{
	public int update(LeaveBean eb)
	{
		int k = 0;
		try 
		{
			Connection con = DBconnect.getCon();
			
			PreparedStatement pstmt = con.prepareStatement( "UPDATE LEAVE_REQUEST SET EMP_ID=?, LEAVE_TYPE=?, FROM_DATE=?, TO_DATE=?, REASON=?, STATUS=? WHERE LEAVE_ID=?");
			pstmt.setString(1, eb.getaEMP_ID());
			pstmt.setString(2, eb.getaLEAVE_TYPE());
			pstmt.setString(3, eb.getaFROM_DATE());
			pstmt.setString(4, eb.getaTO_DATE());
			pstmt.setString(5, eb.getaREASON());
			pstmt.setString(6, eb.getaSTATUS());
			pstmt.setString(7, eb.getaLEAVE_ID());
			
			k = pstmt.executeUpdate();
			System.out.println("DAO Updated Rows = " + k);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return k;
	}
}
