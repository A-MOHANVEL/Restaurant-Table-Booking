<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mohan's Restaurant Login</title>
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
            max-width: 800px;
            width: 100%;
            border-radius: 10%; 
        }

        .left {
            background-image: url('https://content.jdmagicbox.com/comp/jalna/n5/9999p2482.2482.220716224626.s8n5/catalogue/mohan-s-sunrise-family-restaurant-jalna-restaurants-tcq0cvusgi.jpg');
            background-size: cover;
            background-position: center;
            width: 50%;
            border-radius: 7% 0 0 7%;
        }

        .right {
            background: #fff;
            padding: 40px;
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-radius: 0 7% 7% 0;
        }

        .right h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .right p {
            margin-bottom: 20px;
            color: #777;
            text-align: center;
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

        .link-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }

        .link-container a {
            color: #f9a825;
            text-decoration: none;
            font-size: 14px;
        }

        .link-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left"></div>
        <div class="right">
            <h1>Login</h1>
            <p>Welcome to the Mohan's Restaurant booking system. Book your site, choose the meal you prefer, and taste the difference.</p>
            <form action="LoginServlet" method="post">
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">LOGIN</button>
            </form>
            <div class="link-container">
                <a href="signup.jsp">Sign Up</a>
                <a href="fpassword.jsp">Forgotten Password?</a>
            </div>
        </div>
    </div>
</body>
</html>
