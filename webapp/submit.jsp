<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Reservation System</title>
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
            background-color: #f3f3f3;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        form div {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            text-align: left;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background-color: #f9a825;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        button:hover {
            background-color: #e68900;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Enter Reservation Details</h2>
        <form id="reservation-form" action="submitReservation" method="post">
            <input type="hidden" name="name" value="<%= request.getParameter("name") %>">
            <input type="hidden" name="phone" value="<%= request.getParameter("phone") %>">
            <input type="hidden" name="address" value="<%= request.getParameter("address") %>">
            
            <div>
                <label for="date">Date:</label>
                <input type="date" name="date" id="date" required>
            </div>
            <div>
                <label for="time-from">Time From:</label>
                <input type="time" name="time-from" id="time-from" required>
            </div>
            
            <div>
                <label for="guests">Number of Guests:</label>
                <input type="number" name="guests" id="guests" min="1" required>
            </div>
            <div>
                <label for="description">Description:</label>
                <textarea name="description" id="description" rows="3"></textarea>
            </div>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
