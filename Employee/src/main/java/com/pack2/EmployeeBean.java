package com.pack2;

import java.io.Serializable;

@SuppressWarnings("serial")
public class EmployeeBean implements Serializable
{
	private String EMP_ID,NAME,EMAIL,MOBILE,DEPARTMENT,DESIGNATION,PASSWORD;
	
	public String getaEMP_ID()
	{
		return EMP_ID;
	}
	public void setaEMP_ID(String EMP_ID)
	{
		this.EMP_ID = EMP_ID;
	}
	public String getaNAME()
	{
		return NAME;
	}
	public void setaNAME(String NAME)
	{
		this.NAME = NAME;
	}
	public String getaEMAIL()
	{
		return EMAIL;
	}
	public void setaEMAIL(String EMAIL)
	{
		this.EMAIL = EMAIL;
	}
	public String getaMOBILE()
	{
		return MOBILE;
	}
	public void setaMOBILE(String MOBILE)
	{
		this.MOBILE = MOBILE;
	}
	public String getaDEPARTMENT()
	{
		return DEPARTMENT;
	}
	public void setaDEPARTMENT(String DEPARTMENT)
	{
		this.DEPARTMENT = DEPARTMENT;
	}
	public String getaDESIGNATION()
	{
	    return DESIGNATION;
	}
	public void setaDESIGNATION(String DESIGNATION)
	{
		this.DESIGNATION = DESIGNATION;
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