package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pack2.AdminBean;

public class LoginDAO
{
	public AdminBean checkAdminLogin(String username,String password)
	{
		AdminBean abean=null;
		try 
		{
			Connection con =DBconnect.getCon();
			PreparedStatement pstmt1 = con.prepareStatement("select * from ADMIN1 where USERNAME=? and PASSWORD=?");
			pstmt1.setString(1, username);
			pstmt1.setString(2, password);
			ResultSet rowCount = pstmt1.executeQuery();
			
			if(rowCount.next())
			{
				abean= new AdminBean();
				abean.setaADMIN_ID(rowCount.getString(1));
				abean.setaUSERNAME(rowCount.getString(2));
				abean.setaPASSWORD(rowCount.getString(3));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return abean;
	}
}
