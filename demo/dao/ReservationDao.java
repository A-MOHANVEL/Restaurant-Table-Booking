package com.demo.dao;

import com.demo.bean.Reservation;
import com.demo.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReservationDao {

    public boolean saveReservation(Reservation reservation) {
        boolean status = false;
        
        // SQL query aligned with updated form fields
        String sql = "INSERT INTO reservations (name, phone, address, date, time_from, guests, description) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setString(1, reservation.getName());
            ps.setString(2, reservation.getPhone());
            ps.setString(3, reservation.getAddress());
            ps.setString(4, reservation.getDate());
            ps.setString(5, reservation.getTimeFrom());
            ps.setInt(6, reservation.getGuests());
            ps.setString(7, reservation.getDescription());
            
            status = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
