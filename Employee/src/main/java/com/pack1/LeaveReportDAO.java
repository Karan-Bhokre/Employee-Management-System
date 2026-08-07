package com.pack1;

import java.sql.*;
import java.util.ArrayList;

import com.pack2.LeaveBean;

public class LeaveReportDAO {

    public ArrayList<LeaveBean> getAllLeaves() {

        ArrayList<LeaveBean> al = new ArrayList<>();

        try {

            Connection con = DBconnect.getCon();

            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM LEAVE_REQUEST");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                LeaveBean lb = new LeaveBean();

                lb.setaLEAVE_ID(rs.getString("LEAVE_ID"));
                lb.setaEMP_ID(rs.getString("EMP_ID"));
                lb.setaLEAVE_TYPE(rs.getString("LEAVE_TYPE"));
                lb.setaFROM_DATE(rs.getString("FROM_DATE"));
                lb.setaTO_DATE(rs.getString("TO_DATE"));
                lb.setaREASON(rs.getString("REASON"));
                lb.setaSTATUS(rs.getString("STATUS"));

                al.add(lb);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return al;
    }
}