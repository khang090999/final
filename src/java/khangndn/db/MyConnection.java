/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.db;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author KHANG NGUYEN
 */
public class MyConnection implements Serializable{
    public static Connection getMyConnection()throws Exception
    {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ProjectPRJ321","sa","12345678");
        return conn;
    }
}
