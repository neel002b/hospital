/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author chintan
 */
public class UserDao {

    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    public boolean register(user u) {
        boolean f = false;
        try {

            String sql = "insert into user_details(full_name,email,password) values(?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public user login(String em, String psw) {
        user u = null;

        try {
            String sql = "select * from user_details where email=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, em);
            ps.setString(2, psw);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                u = new user();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }
    
    public boolean checkOldPassword(int userid,String oldpassword)
    {
        boolean f=false;
        
        try {
            
            String sql="select * from user_details where id=? and password=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setString(2,oldpassword);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                f=true;
                    
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
     public boolean chanagePassword(int userid,String newpassword)
    {
        boolean f=false;
        
        try {
            
            String sql="update user_details set password=? where id=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,newpassword);
            ps.setInt(2, userid);
            
            int i=ps.executeUpdate();
            if(i==1)
            {
                f=true;
                    
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }

}
