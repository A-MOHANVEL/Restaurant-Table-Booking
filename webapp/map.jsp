 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        table, th, td {
            border: 1px solid black;
            padding: 10px;
        }

        th, td {
            text-align: center;
        }

        button {
            background-color: transparent;
            color: black;
            padding: 10px;
            border: 1px solid black;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            color: white;
        }

        .accept-btn:hover {
            background-color: green;
        }

        .reject-btn:hover {
            background-color: red;
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
              <a href="admind.jsp"></a>
                          </div>

            <div id="approved-requests" class="section">
               <a href="dashboard.jsp"></a>
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