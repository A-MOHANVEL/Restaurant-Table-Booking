package com.demo.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/restarunt-table";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
      
        Class.forName("com.mysql.cj.jdbc.Driver");

      
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static Connection getConnection() {
        try {
            return initializeDatabase();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null; // Returns null if connection fails
        }
    }
}
