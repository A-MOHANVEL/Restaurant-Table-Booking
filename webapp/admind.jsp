<%@ page import="java.sql.*" %>
<%@ page import="com.demo.util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Reservation Dashboard</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            color: #333;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        /* Title styling */
        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            width: 100%;
            max-width: 1200px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: #fff;
            font-weight: bold;
        }

        td {
            color: #555;
        }

        /* Table row hover effect */
        tr:hover {
            background-color: #f1f1f1;
        }

        /* Button styling */
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
    <h1>Reservation Dashboard</h1>
    <table border="1">
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
</body>
</html>
