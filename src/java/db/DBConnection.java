/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author chintan
 */
public class DBConnection {
    
    
    private static Connection conn;
    
    public static Connection getcon()
    {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagementsystem","root","");
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    
    
}
