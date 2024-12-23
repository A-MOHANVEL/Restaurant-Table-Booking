<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up-Mohan's Sunraise Restaurant </title>
    <style>
        body {
            background-image: url('bg.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            height: 100vh;
        }
        .container {
            background: #fff;
            padding: 40px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); 
            max-width: 400px;
            width: 100%;
            border-radius: 10px; 
        }
        h1 {
            font-size: 24px;
            margin-bottom: 10px;
            text-align: center;
        }
        p {
            margin-bottom: 20px;
            color: #777;
            text-align: center;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background: #f9a825;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background: #e68900;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Create Your new<br>Password</h1>
        <input type="email" id="email" placeholder="Email">
        <input type="password" id="password" placeholder=" New Password">
        <input type="password" id="confirmPassword" placeholder="Confirm Password">
        <button onclick="signup()">Login</button>
    </div>

    <script>
        function signup() {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return;
            }

            window.location.href = 'login.jsp'; 
        }
    </script>
</body>
</html>
