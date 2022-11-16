/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import entity.appointment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author chintan
 */
public class AppointmentDao {

    private Connection conn;

    public AppointmentDao(Connection conn) {
        this.conn = conn;
    }

    public boolean addAppointment(appointment ap) {
        boolean f = false;

        try {
            String sql = "INSERT INTO appointment(userid,fullname,gender,age,appoint_date,email,phno,diseases,doctorid,address,status) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ap.getUserId());
            ps.setString(2, ap.getFullName());
            ps.setString(3, ap.getGender());
            ps.setString(4, ap.getAge());
            ps.setString(5, ap.getAppoinDate());
            ps.setString(6, ap.getEmail());
            ps.setString(7, ap.getPhNo());
            ps.setString(8, ap.getDiseases());
            ps.setInt(9, ap.getDoctorId());
            ps.setString(10, ap.getAddress());
            ps.setString(11, ap.getStatus());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public List<appointment> getAllAppointmentByLoginUser(int userid) {
        List<appointment> list = new ArrayList<appointment>();
        appointment ap = null;

        try {

            String sql = "select * from appointment where userid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ap = new appointment();
                ap.setId(rs.getInt(1));
                ap.setUserId(rs.getInt(2));
                ap.setFullName(rs.getString(3));
                ap.setGender(rs.getString(4));
                ap.setAge(rs.getString(5));
                ap.setAppoinDate(rs.getString(6));
                ap.setEmail(rs.getString(7));
                ap.setPhNo(rs.getString(8));
                ap.setDiseases(rs.getString(9));
                ap.setDoctorId(rs.getInt(10));
                ap.setAddress(rs.getString(11));
                ap.setStatus(rs.getString(12));
                list.add(ap);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<appointment> getAllAppointmentByDoctorLogin(int docid) {
        List<appointment> list = new ArrayList<appointment>();
        appointment ap = null;

        try {

            String sql = "select * from appointment where doctorid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, docid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ap = new appointment();
                ap.setId(rs.getInt(1));
                ap.setUserId(rs.getInt(2));
                ap.setFullName(rs.getString(3));
                ap.setGender(rs.getString(4));
                ap.setAge(rs.getString(5));
                ap.setAppoinDate(rs.getString(6));
                ap.setEmail(rs.getString(7));
                ap.setPhNo(rs.getString(8));
                ap.setDiseases(rs.getString(9));
                ap.setDoctorId(rs.getInt(10));
                ap.setAddress(rs.getString(11));
                ap.setStatus(rs.getString(12));
                list.add(ap);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public appointment getAppointmentById(int id) {

        appointment ap = null;

        try {

            String sql = "select * from appointment where     id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ap = new appointment();
                ap.setId(rs.getInt(1));
                ap.setUserId(rs.getInt(2));
                ap.setFullName(rs.getString(3));
                ap.setGender(rs.getString(4));
                ap.setAge(rs.getString(5));
                ap.setAppoinDate(rs.getString(6));
                ap.setEmail(rs.getString(7));
                ap.setPhNo(rs.getString(8));
                ap.setDiseases(rs.getString(9));
                ap.setDoctorId(rs.getInt(10));
                ap.setAddress(rs.getString(11));
                ap.setStatus(rs.getString(12));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ap;
    }

    public boolean updateCommentStatus(int id, int doctId, String comm) {
        boolean f = false;
        try {
            String sql = "update appointment set status=? where id=? and doctorid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, comm);
            ps.setInt(2, id);
            ps.setInt(3, doctId);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    public List<appointment> getAllAppointment() {
        
        List<appointment> list = new ArrayList<appointment>();
        appointment ap = null;

        try {

            String sql = "select * from appointment order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ap = new appointment();
                ap.setId(rs.getInt(1));
                ap.setUserId(rs.getInt(2));
                ap.setFullName(rs.getString(3));
                ap.setGender(rs.getString(4));
                ap.setAge(rs.getString(5));
                ap.setAppoinDate(rs.getString(6));
                ap.setEmail(rs.getString(7));
                ap.setPhNo(rs.getString(8));
                ap.setDiseases(rs.getString(9));
                ap.setDoctorId(rs.getInt(10));
                ap.setAddress(rs.getString(11));
                ap.setStatus(rs.getString(12));
                list.add(ap);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
