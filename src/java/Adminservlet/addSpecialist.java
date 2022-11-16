/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Adminservlet;

import dao.SpecialistDao;
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
@WebServlet("/addSpecialist")
public class addSpecialist extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String spec_name = req.getParameter("specName");

        SpecialistDao sdao = new SpecialistDao(DBConnection.getcon());

        boolean f = sdao.addSpecialist(spec_name);
        
        HttpSession session=req.getSession();

        if(f)
        {
            session.setAttribute("succMsg","Specialist Added");
            resp.sendRedirect("admin/index.jsp");
        } 
        else 
        {
            session.setAttribute("errMsg","Something Wrong On Server");
            resp.sendRedirect("admin_login.jsp");
        }

    }

}
