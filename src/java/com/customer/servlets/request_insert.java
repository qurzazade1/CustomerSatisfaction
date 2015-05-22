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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sadig
 */
public class request_insert extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet complain_insert</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet complain_insert at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection con = dbConnection.dbConnect();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String user_id = (String) request.getParameter("userid");
        String request_type = (String) request.getParameter("requesttype");

        String companyname = (String) request.getParameter("companyname");
        String text_area = (String) request.getParameter("textarea");

    
        boolean sucsess = false;

        String sql = "insert into Customer_Request (userid,company_name,request_type,textarea) values(?,?,?,?)";

        try {
            preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, user_id);
           
            preparedStatement.setString(2, companyname);
             preparedStatement.setString(3,request_type);
            preparedStatement.setString(4, text_area);
            preparedStatement.executeUpdate();

            sucsess = true;

        } catch (SQLException ex) {
            out.println("Sql exception happended");

        } finally {
            try{
        
       
            if (preparedStatement != null) {
                preparedStatement.close();
            }
                if (con != null) {
                con.close();
            }
                 sucsess=true;
            }
           
            catch(SQLException e)
                    {
                    
                    }

        }
        if (sucsess == false||sucsess==true) {

            response.sendRedirect("jsp/user.jsp");
        
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
