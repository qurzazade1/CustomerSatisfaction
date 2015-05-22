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
public class register_company extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Connection con = dbConnection.dbConnect();
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        String user="company";
        boolean sucsess=false;
        String cName = (String) request.getParameter("co_ad");
          String cType = (String) request.getParameter("company_type");
        
        String eyear = (String) request.getParameter("year");
        String mail = (String) request.getParameter("co_mail");
      
        String id = (String) request.getParameter("co_id");
        String pwd = (String) request.getParameter("co_psw");

        String sql = "insert into company_info values(?,?,?,?,?,?)";

        try {

            preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, id);
            preparedStatement.setString(2, cName);
               preparedStatement.setString(3, cType);
            
            preparedStatement.setString(4, eyear);
            preparedStatement.setString(5, mail);
         
            preparedStatement.setString(6, pwd);
            preparedStatement.executeUpdate();
            sucsess = true;

        } catch (SQLException ex) {
         
        }

if(sucsess==true)
{
    
    session.setAttribute("user", user);
 response.sendRedirect("jsp/company.jsp");
}
else
    
      response.sendRedirect("jsp/register.jsp");
             
    
    
    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
