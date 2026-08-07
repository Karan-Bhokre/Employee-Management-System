package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pack2.LeaveBean;

public class ViewLeaveStatusDAO {

    public ArrayList<LeaveBean> viewAllLeaveStatus() {

        ArrayList<LeaveBean> al = new ArrayList<>();

        try {

            Connection con = DBconnect.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM LEAVE_REQUEST");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                LeaveBean lb = new LeaveBean();

                lb.setaLEAVE_ID(rs.getString(1));
                lb.setaEMP_ID(rs.getString(2));
                lb.setaLEAVE_TYPE(rs.getString(3));
                lb.setaFROM_DATE(rs.getString(4));
                lb.setaTO_DATE(rs.getString(5));
                lb.setaREASON(rs.getString(6));
                lb.setaSTATUS(rs.getString(7));

                al.add(lb);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return al;
    }

public ArrayList<LeaveBean> viewLeaveStatus(String empId) {

    ArrayList<LeaveBean> al = new ArrayList<>();

    try {

        Connection con = DBconnect.getCon();

        PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM LEAVE_REQUEST WHERE EMP_ID=?");

        ps.setString(1, empId);

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {

            LeaveBean lb = new LeaveBean();

            lb.setaLEAVE_ID(rs.getString(1));
            lb.setaEMP_ID(rs.getString(2));
            lb.setaLEAVE_TYPE(rs.getString(3));
            lb.setaFROM_DATE(rs.getString(4));
            lb.setaTO_DATE(rs.getString(5));
            lb.setaREASON(rs.getString(6));
            lb.setaSTATUS(rs.getString(7));

            al.add(lb);
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return al;
}
}