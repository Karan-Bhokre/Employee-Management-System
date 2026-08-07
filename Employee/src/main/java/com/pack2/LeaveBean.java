package com.pack2;

import java.io.Serializable;

@SuppressWarnings("serial")
public class LeaveBean implements Serializable
{
    private String LEAVE_ID;
    private String EMP_ID;
    private String LEAVE_TYPE;
    private String FROM_DATE;
    private String TO_DATE;
    private String REASON;
    private String STATUS;

    public LeaveBean() {}

    public String getaLEAVE_ID()
    {
        return LEAVE_ID;
    }

    public void setaLEAVE_ID(String LEAVE_ID)
    {
        this.LEAVE_ID = LEAVE_ID;
    }

    public String getaEMP_ID()
    {
        return EMP_ID;
    }

    public void setaEMP_ID(String EMP_ID)
    {
        this.EMP_ID = EMP_ID;
    }

    public String getaLEAVE_TYPE()
    {
        return LEAVE_TYPE;
    }

    public void setaLEAVE_TYPE(String LEAVE_TYPE)
    {
        this.LEAVE_TYPE = LEAVE_TYPE;
    }

    public String getaFROM_DATE()
    {
        return FROM_DATE;
    }

    public void setaFROM_DATE(String FROM_DATE)
    {
        this.FROM_DATE = FROM_DATE;
    }

    public String getaTO_DATE()
    {
        return TO_DATE;
    }

    public void setaTO_DATE(String TO_DATE)
    {
        this.TO_DATE = TO_DATE;
    }

    public String getaREASON()
    {
        return REASON;
    }

    public void setaREASON(String REASON)
    {
        this.REASON = REASON;
    }

    public String getaSTATUS()
    {
        return STATUS;
    }

    public void setaSTATUS(String STATUS)
    {
        this.STATUS = STATUS;
    }
}