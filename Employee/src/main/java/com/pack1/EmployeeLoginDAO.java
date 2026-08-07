package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pack2.EmployeeBean;

public class EmployeeLoginDAO {

    public EmployeeBean login(String email, String password) {

        EmployeeBean eb = null;

        try {
            Connection con = DBconnect.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM EMPLOYEE1 WHERE EMAILE=? AND PASSWORD=?");

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                eb = new EmployeeBean();

                eb.setaEMP_ID(rs.getString("EMP_ID"));
                eb.setaNAME(rs.getString("NAME"));
                eb.setaEMAIL(rs.getString("EMAILE"));
                eb.setaMOBILE(rs.getString("MOBILE"));
                eb.setaDEPARTMENT(rs.getString("DEPARTMENT"));
                eb.setaDESIGNATION(rs.getString("DESIGNATION"));
                eb.setaPASSWORD(rs.getString("PASSWORD"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return eb;
    }
}
