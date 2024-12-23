<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.demo.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f3f3;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #333;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
        }
        .sidebar h2 {
            color: white;
            text-align: center;
            margin-bottom: 30px;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 15px 20px;
            text-decoration: none;
            transition: background 0.3s;
            cursor: pointer;
        }
        .sidebar a:hover {
            background-color: #575757;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
            position: relative;
        }
        .header {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
            position: fixed;
            top: 0;
            left: 250px;
            right: 0;
            z-index: 1;
        }
        .content {
            margin-top: 60px;
            padding: 20px;
        }
        .section {
            display: none;
        }
        .section.active {
            display: block;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #333;
            color: #fff;
            font-weight: bold;
        }
        td {
            color: #555;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .button {
            padding: 8px 12px;
            margin: 2px;
            border: none;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .accept {
            background-color: #4CAF50;
        }
        .accept:hover {
            background-color: #45a049;
        }
        .reject {
            background-color: #f44336;
        }
        .reject:hover {
            background-color: #d73833;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a onclick="showSection('new-approvals')">New Approvals</a>
        <a onclick="showSection('approved-requests')">Approved Requests</a>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Welcome, Admin</h1>
        </div>

        <div class="content">
            <div id="new-approvals" class="section active">
                <h2>New Approvals</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Date</th>
                        <th>Time From</th>
                        <th>Guests</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>

                    <%
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;

                        try {
                            conn = DBConnection.getConnection();
                            String sql = "SELECT * FROM reservations WHERE status = 'Pending'";
                            stmt = conn.prepareStatement(sql);
                            rs = stmt.executeQuery();

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String name = rs.getString("name");
                                String phone = rs.getString("phone");
                                String address = rs.getString("address");
                                String date = rs.getString("date");
                                String timeFrom = rs.getString("time_from");
                                int guests = rs.getInt("guests");
                                String description = rs.getString("description");
                                String status = rs.getString("status");
                    %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= name %></td>
                        <td><%= phone %></td>
                        <td><%= address %></td>
                        <td><%= date %></td>
                        <td><%= timeFrom %></td>
                        <td><%= guests %></td>
                        <td><%= description %></td>
                        <td><%= status %></td>
                        <td>
                            <% if ("Pending".equalsIgnoreCase(status)) { %>
                                <a href="UpdateStatusServlet?id=<%= id %>&status=Accept" class="button accept">Accept</a>
                                <a href="UpdateStatusServlet?id=<%= id %>&status=Reject" class="button reject">Reject</a>
                            <% } else { %>
                                <span><%= status %></span>
                            <% } %>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<p>Error: " + e.getMessage() + "</p>");
                            e.printStackTrace();
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                        }
                    %>
                </table>
            </div>

            <div id="approved-requests" class="section">
                <h2>Approved Requests</h2>
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
                        try {
                            conn = DBConnection.getConnection();
                            if (conn == null) {
                                out.println("<tr><td colspan='8'>Error: Could not establish database connection.</td></tr>");
                            } else {
                                String sql = "SELECT name, phone, address, date, time_from, guests, description, status FROM reservations WHERE status = 'Accept'";
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
                                    out.println("<tr><td colspan='8'>No approved reservation records found in the database.</td></tr>");
                                }
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                        }
                    %>
                </table>
            </div>
        </div>
    </div>

    <script>
        function showSection(sectionId) {
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => section.classList.remove('active'));

            const activeSection = document.getElementById(sectionId);
            activeSection.classList.add('active');
        }
    </script>

</body>
</html>
