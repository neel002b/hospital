/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DoctorServlet;

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
@WebServlet("/DoctorEditProfile")
public class EditProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String name = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String specName = req.getParameter("spec");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobno");

            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor(id, name, dob, qualification, specName, email, mobno, "");

            DoctorDao dao = new DoctorDao(DBConnection.getcon());

            HttpSession session = req.getSession();

            if (dao.editDoctorProfile(d)) {
                session.setAttribute("succMsgd", "Doctor update Successfully");
                resp.sendRedirect("doctor/editProfile.jsp");
            } else {
                session.setAttribute("errorMsgd", "something wrong on server");
                resp.sendRedirect("doctor/editProfile.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
