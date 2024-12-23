<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mohan's Restaurant & Bar Login</title>
    <style>
        body {
            background-image: url(bg.png); 
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            background-color: #f3f3f3;
        }
        .container {
            
            display: flex;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); 
            max-width: 400px; 
            width: 100%;
            border-radius: 10px; 
            background-color: rgb(137, 35, 35); 
        }
        .right {
            background: #fff;
            padding: 40px;
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-radius: 10px; 
        }
        .right h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .right button {
            background: #f9a825;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-bottom: 10px;
        }
        .right button:hover {
            background: #e68900;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="right">
            <h1>Restarunt reservation</h1>
           
            <button onclick="newu()">Book your seat</button>
            <button onclick="already()">Know my status of booked seats</button>
        </div>
    </div>

    <script>
        function newu() {
            window.location.href = 'New.jsp';
        }
        function already() {
            window.location.href = 'Already.jsp';
        }
        
    </script>
</body>
</html>
