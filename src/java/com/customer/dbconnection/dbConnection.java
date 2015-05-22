/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.customer.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;

/**
 *
 * @author Sadig
 */
public class dbConnection {

    public static Connection dbConnect() {

        Connection connection = null;
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        String username = "System";
        String password = "Oracle1988";
        try {
            Class.forName("oracle.jdbc.OracleDriver");

            connection = DriverManager.getConnection(url, username, password);

        } catch (ClassNotFoundException ex) {
            System.out.println("Oracle jdbc driver yuklenmedi");

        } catch (SQLException ex) {
            System.out.println("Baza ile elaqeli problem var");

        }
        return connection;
    }
}
