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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sadig
 */
public class register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Connection con = dbConnection.dbConnect();
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        boolean sucsess=false;
        String firstName = (String) request.getParameter("ad");
        String lastName = (String) request.getParameter("soyad");
        String fatherName = (String) request.getParameter("ataad");
        String age = (String) request.getParameter("age");
        String id = (String) request.getParameter("id");
        String pwd = (String) request.getParameter("psw");
String user="customer";
        String sql = "insert into customer_info (c_id,first_name,last_name,father_name,age,c_password)values(?,?,?,?,?,?)";

        try {

            preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, id);
            preparedStatement.setString(2, firstName);
            preparedStatement.setString(3, lastName);
            preparedStatement.setString(4, fatherName);
            preparedStatement.setString(5, age);
            preparedStatement.setString(6, pwd);
            preparedStatement.executeUpdate();
            sucsess = true;

        } catch (SQLException ex) {
            
         
            /*
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsp/register.jsp");
            String su = "unsu";
            response.addHeader("su", su);
            rd.include(request, response);
            sucsess = false;*/
        }
if(sucsess==true)
{
    
    session.setAttribute("user", user);
 response.sendRedirect("jsp/user.jsp");
}
else
    
      response.sendRedirect("jsp/register.jsp");
             
    
    
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
