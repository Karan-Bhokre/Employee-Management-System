package com.pack1;


import java.sql.Connection;
import java.sql.PreparedStatement;



public class ApplyLeaveDAO 
{
	public int applyLeave(com.pack2.LeaveBean lb)
	{
		int rowCount = 0;
		try 
		{
			Connection con=DBconnect.getCon();
			
			PreparedStatement pstmt3 = con.prepareStatement("INSERT INTO LEAVE_REQUEST VALUES(?,?,?,?,?,?,?)");
			pstmt3.setString(1,lb.getaLEAVE_ID());
			pstmt3.setString(2,lb.getaEMP_ID());
			pstmt3.setString(3,lb.getaLEAVE_TYPE());
			pstmt3.setString(4,lb.getaFROM_DATE());
			pstmt3.setString(5,lb.getaTO_DATE());
			pstmt3.setString(6,lb.getaREASON());
			pstmt3.setString(7,lb.getaSTATUS());
			
			rowCount = pstmt3.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rowCount;
	}

}
