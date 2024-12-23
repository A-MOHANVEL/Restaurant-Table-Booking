package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.demo.bean.AdminDetails;
import com.demo.util.DBConnection;

public class AdminDao {

    public boolean validate(AdminDetails adminDetails) throws ClassNotFoundException {
        boolean status = false;
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement pst = connection.prepareStatement("SELECT * FROM adminlogin WHERE email=? AND password=?")) {

            pst.setString(1, adminDetails.getEmail());
            pst.setString(2, adminDetails.getPassword());

            try (ResultSet rs = pst.executeQuery()) {
                status = rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
