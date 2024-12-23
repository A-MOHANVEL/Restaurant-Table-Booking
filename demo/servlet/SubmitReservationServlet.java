package com.demo.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.bean.Reservation;
import com.demo.util.DBConnection;

@WebServlet("/submitReservation")
public class SubmitReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String date = request.getParameter("date");
        String timeFrom = request.getParameter("time-from");
        int guests = Integer.parseInt(request.getParameter("guests"));
        String description = request.getParameter("description");

        Reservation reservation = new Reservation(name, phone, address, date, timeFrom, guests, description);

        String sql = "INSERT INTO reservations (name, phone, address, date, time_from,  guests, description) VALUES ( ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, reservation.getName());
            pstmt.setString(2, reservation.getPhone());
            pstmt.setString(3, reservation.getAddress());
            pstmt.setString(4, reservation.getDate());
            pstmt.setString(5, reservation.getTimeFrom());
            pstmt.setInt(6, reservation.getGuests());
            pstmt.setString(7, reservation.getDescription());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                response.getWriter().println("Reservation submitted successfully!");
            } else {
                response.getWriter().println("Failed to submit reservation.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
