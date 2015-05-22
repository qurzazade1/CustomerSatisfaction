/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.customer.servlets;

import com.customer.dbconnection.dbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sadig
 */
public class login extends HttpServlet {

    boolean val = false;
    String user = "customer", admin = "admin", company="company", com = "true";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //  PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String username = (String) request.getParameter("uname");
        String password = (String) request.getParameter("pwd");
        Integer a = username.length();
        Connection con = dbConnection.dbConnect();

        PreparedStatement preparedStatement;
        ResultSet resultSet;
        
            String sql = "select c_id,c_password,first_name,c_admin from customer_info where c_id=? and c_password=?";

            try {

                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);

                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                
                    if (resultSet.getString("c_admin").equals(admin)) {
                        session.setAttribute("user", admin);
                        response.sendRedirect("jsp/admin.jsp");
                    } else {
                        session.setAttribute("user", user);
                        response.sendRedirect("jsp/user.jsp");

                    }
                }
else
       
            response.sendRedirect("jsp/register.jsp");

                
            } catch (SQLException s) {
            }

        

      //  else
            //response.sendRedirect("login.jsp");
     

    }
}
