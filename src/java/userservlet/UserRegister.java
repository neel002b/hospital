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
@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         try{
             //fetching data from the signup page
             
             String name=req.getParameter("user_name");
             String email=req.getParameter("user_email");
             String password=req.getParameter("user_pwd");
             
             //set in user entity class
             user u=new user(name,email,password);
             
             //do database related operation
             UserDao dao=new UserDao(DBConnection.getcon());
             
             HttpSession session=req.getSession();
             
             
             boolean f=dao.register(u);
             
             if(f)
             {
                 session.setAttribute("succMsg", "Register Sucessfully");
                 resp.sendRedirect("user_login.jsp");
             }else{
                 session.setAttribute("erroMsg", "Something wrong on server!");
                 resp.sendRedirect("user_login.jsp");
                 
             }
             
             
             
             
         }catch(Exception e){
             e.printStackTrace();
         }
    }
    
    
    
}
