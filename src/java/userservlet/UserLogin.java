/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userservlet;

import dao.UserDao;
import db.DBConnection;
import entity.user;
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
@WebServlet("/userlogin")
public class UserLogin extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try{
            String email=req.getParameter("email");
            String password=req.getParameter("pwd");
            
            HttpSession session=req.getSession();
            
            UserDao dao=new UserDao(DBConnection.getcon());
            user u=dao.login(email, password);
            
            if(u!=null)
            {
                session.setAttribute("userobj",u);
                resp.sendRedirect("index.jsp");
            }else{
                session.setAttribute("errorMsg", "invalid email & password");
                resp.sendRedirect("user_login.jsp");
            }
            
            
        }catch(Exception e){
            
            e.printStackTrace();
            
        }
    }
    
}
