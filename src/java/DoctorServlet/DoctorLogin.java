/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DoctorServlet;

import dao.DoctorDao;
import dao.UserDao;
import db.DBConnection;
import entity.Doctor;
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
@WebServlet("/doctorlogin")
public class DoctorLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String email = req.getParameter("email");
            String password = req.getParameter("pwd");

            HttpSession session = req.getSession();

            DoctorDao dao = new DoctorDao(DBConnection.getcon());
            Doctor d = dao.login(email, password);

            if (d != null) {
                session.setAttribute("doctorobj", d);
                resp.sendRedirect("doctor/index.jsp");
            } else {
                session.setAttribute("errorMsg","invalid email or password!");
                resp.sendRedirect("doctor_login.jsp");
            }

        } catch (Exception e) {

            e.printStackTrace();

        }
    }
}
