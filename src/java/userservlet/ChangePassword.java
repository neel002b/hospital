/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userservlet;

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
@WebServlet("/userChangePassword")
public class ChangePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        int uid=Integer.parseInt(req.getParameter("uid"));
        String oldpassword=req.getParameter("oldPassword");
        String newpassword=req.getParameter("newPassword");
        
        UserDao dao=new UserDao(DBConnection.getcon());
        
        HttpSession session=req.getSession();
        if(dao.checkOldPassword(uid, oldpassword))
        {
            if(dao.chanagePassword(uid, newpassword))
            {
                session.setAttribute("succMsg","Password change sucessfully");
                resp.sendRedirect("change_password.jsp");
            }
            else{
                session.setAttribute("errorMsg","Something wrong on server");
                resp.sendRedirect("change_password.jsp");
            }
        }
        else{
            session.setAttribute("errorMsg","Old Password Incorrect");
            resp.sendRedirect("change_password.jsp");
        }
        
    }
    
    
    
}
