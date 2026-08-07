package com.pack2;

import java.io.Serializable;

@SuppressWarnings("serial")
public class AdminBean implements Serializable
{
	private String ADMIN_ID,USERNAME,PASSWORD;
	
	public String getaADMIN_ID()
	{
		return ADMIN_ID;
	}
	public void setaADMIN_ID(String ADMIN_ID)
	{
		this.ADMIN_ID = ADMIN_ID;
	}
	public String getaUSERNAME()
	{
		return USERNAME;
	}
	public void setaUSERNAME(String USERNAME)
	{
		this.USERNAME = USERNAME;
	}
	public String getaPASSWORD()
	{
		return PASSWORD;
	}
	public void setaPASSWORD(String PASSWORD)
	{
		this.PASSWORD = PASSWORD;
	}
	
}
