/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DoctorServlet;

import dao.DoctorDao;
import dao.UserDao;
import db.DBConnection;
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
@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        int uid=Integer.parseInt(req.getParameter("uid"));
        String oldpassword=req.getParameter("oldPassword");
        String newpassword=req.getParameter("newPassword");
        
        DoctorDao dao=new DoctorDao(DBConnection.getcon());
        
        HttpSession session=req.getSession();
        if(dao.checkOldPassword(uid, oldpassword))
        {
            if(dao.chanagePassword(uid, newpassword))
            {
                session.setAttribute("succMsg","Password change sucessfully");
                resp.sendRedirect("doctor/editProfile.jsp");
            }
            else{
                session.setAttribute("errorMsg","Something wrong on server");
                resp.sendRedirect("doctor/editProfile.jsp");
            }
        }
        else{
            session.setAttribute("errorMsg","Old Password Incorrect");
            resp.sendRedirect("doctor/editProfile.jsp");
        }
        
    }
    
    
}
