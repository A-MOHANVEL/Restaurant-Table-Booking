package com.demo.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.demo.bean.SignUpDetails;
import com.demo.dao.SignupDao;
import com.demo.util.DBConnection;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        SignUpDetails user = new SignUpDetails(email, password);

        try (Connection connection = DBConnection.initializeDatabase()) {
            SignupDao signupDao = new SignupDao(connection);

            if (signupDao.registerUser(user)) {
                response.sendRedirect("success.jsp"); 
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=SQLException"); 
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=ClassNotFound"); 
        }
    }
}
