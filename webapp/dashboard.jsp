<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.demo.util.DBConnection" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Print Reservation Details</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { text-align: center; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Reservation Details</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Date</th>
            <th>Time From</th>
            <th>Guests</th>
            <th>Description</th>
            <th>Status</th>
        </tr>
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                conn = DBConnection.getConnection();
                if (conn == null) {
                    out.println("<p>Error: Could not establish database connection.</p>");
                } else {
                    String sql = "SELECT name, phone, address, date, time_from, guests, description, status FROM reservations";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    boolean hasResults = false;
                    while (rs.next()) {
                        hasResults = true;
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getDate("date") %></td>
            <td><%= rs.getTime("time_from") %></td>
            <td><%= rs.getInt("guests") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
        <%
                    }
                    if (!hasResults) {
                        out.println("<p>No reservation records found in the database.</p>");
                    }
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
                StringWriter sw = new StringWriter();
                PrintWriter pw = new PrintWriter(sw);
                e.printStackTrace(pw);
                out.println("<pre>" + sw.toString() + "</pre>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
    </table>
</body>
</html>
