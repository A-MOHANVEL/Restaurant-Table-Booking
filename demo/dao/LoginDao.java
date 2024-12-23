package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.demo.bean.LoginDetails;
import com.demo.util.DBConnection;

public class LoginDao {

    public boolean validate(LoginDetails loginDetails) throws ClassNotFoundException {
        boolean status = false;
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement pst = connection.prepareStatement("SELECT * FROM signup WHERE email=? AND password=?")) {

            pst.setString(1, loginDetails.getEmail());
            pst.setString(2, loginDetails.getPassword());

            try (ResultSet rs = pst.executeQuery()) {
                status = rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
