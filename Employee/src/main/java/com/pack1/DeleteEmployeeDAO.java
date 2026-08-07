package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteEmployeeDAO {

    public int deleteEmployee(String empId) {

        int rowCount = 0;

        try {
            Connection con = DBconnect.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM EMPLOYEE1 WHERE EMP_ID=?");

            ps.setString(1, empId);

            rowCount = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowCount;
    }
}