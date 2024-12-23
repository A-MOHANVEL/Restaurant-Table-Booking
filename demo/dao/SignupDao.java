package com.demo.dao;

import com.demo.bean.SignUpDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SignupDao {
    private Connection connection;

    // Constructor to initialize the database connection
    public SignupDao(Connection connection) {
        this.connection = connection;
    }

    // Method to register the user
    public boolean registerUser(SignUpDetails user) {
        String query = "INSERT INTO signup (email, password) VALUES (?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());

            int result = statement.executeUpdate();
            return result > 0; // Return true if insertion was successful

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
