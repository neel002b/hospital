/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Adminservlet;

import dao.DoctorDao;
import db.DBConnection;
import entity.Doctor;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chintan
 */
@WebServlet("/updatedoctor")
public class UpdateDoctor extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            
            String name=req.getParameter("fullname");
            String dob=req.getParameter("dob");
            String qualification=req.getParameter("qualification");
            String specName=req.getParameter("specName");
            String email=req.getParameter("email");
            String mobno=req.getParameter("mobno");
            String password=req.getParameter("password");
            
            int id=Integer.parseInt(req.getParameter("id"));
            
            Doctor d=new Doctor(id,name,dob,qualification,specName,email,mobno,password);
                        
            DoctorDao dao=new DoctorDao(DBConnection.getcon());
            
            HttpSession session=req.getSession();
            
            if(dao.updateDoctor(d))
            {
                session.setAttribute("succMsg","Doctor update Successfully");
                resp.sendRedirect("admin/doctor.jsp");
            }else{
                 session.setAttribute("errorMsg","something wrong on server");
                 resp.sendRedirect("admin/doctor.jsp");
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    }
    
    
    
}
