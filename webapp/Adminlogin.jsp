<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mohan's Restaurant - Admin Login</title>
    <style>
        body {
          
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
        .right input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
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
            <h1>Admin Login</h1>
             <form action="AdminServlet" method="post">
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">LOGIN</button>
            </form>
        </div>
    </div>
</body>
</html>
