<%@page import="entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="db.DBConnection"%>
<%@page import="dao.SpecialistDao"%>
<%@page import="dao.DoctorDao"%>
<%@page import="entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
        <%@include file="../components/allcss.jsp"%>
    </head>
    <body>
        <c:if test="${empty doctorobj }">
            <c:redirect url="../doctor_login.jsp"></c:redirect>
        </c:if>


        <%@include file="navbar.jsp"%>

        <div class="container p-4">
            <div class="row">
                <div class="col-md-4">
                    <div class="card paint-card">
                        <p class="text-center fs-3">Change Password</p>
                        <c:if test="${not empty succMsg }">
                            <p class="text-center text-success fs-3">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty errorMsg }">
                            <p class="text-center text-danger fs-5">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <div class="card-body">
                            <form action="../doctChangePassword" method="post">
                                <div class="mb-3">
                                    <label>Enter New Password</label> <input type="password" name="newPassword" class="form-control" required>
                                </div>

                                <div class="mb-3">
                                    <label>Enter Old Password</label> <input type="password" name="oldPassword" class="form-control" required>
                                </div>
                                <input type="hidden" value="${doctorobj.id }" name="uid">
                                <button class="btn btn-success col-md-12">Change Password</button>
                            </form>
                        </div>
                    </div>
                </div>
                                
                                

                <div class="col-md-5 offset-md-2">
                    <div class="card paint-card">
                        <p class="text-center fs-3">Edit Profile</p>
                        
                        <c:if test="${not empty succMsgd }">
                            <p class="text-center text-success fs-3">${succMsgd}</p>
                            <c:remove var="succMsgd" scope="session" />
                        </c:if>

                        <c:if test="${not empty errorMsgd }">
                            <p class="text-center text-danger fs-5">${errorMsgd}</p>
                            <c:remove var="errorMsgd" scope="session" />
                        </c:if>
                            
                            <%
                                HttpSession session12 = request.getSession(false);
                                Doctor d = (Doctor) session12.getAttribute("doctorobj");
                                
                                
                                
                                DoctorDao dao2=new DoctorDao(DBConnection.getcon());
                                Doctor list1=dao2.getDoctorById(d.getId());
                                %>
                                
                        <div class="card-body">
                            <form action="../DoctorEditProfile" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label> <input type="text"
                                                                                       required name="fullname" class="form-control"
                                                                                       value="<%= list1.getFullName() %>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">DOB</label> <input type="date"
                                                                                 required name="dob" class="form-control"
                                                                                 value="<%= list1.getDob()%>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Qualification</label> <input required
                                                                                           name="qualification" type="text" class="form-control"
                                                                                           value="<%= list1.getQualification()%>">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Specialist</label> <select name="spec"
                                                                                         required class="form-control">
                                        <option><%= list1.getSpecialist()%></option>

                                        <%
                                            SpecialistDao dao = new SpecialistDao(DBConnection.getcon());
                                            List<Specialist> list = dao.getAllSpecialist();
                                            for (Specialist s : list) {
                                        %>
                                        <option><%=s.getSpecialistname() %></option>
                                        <%
                                            }
                                        %>


                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label> <input type="text"
                                                                                   readonly required name="email" class="form-control"
                                                                                   value="<%= list1.getEmail()%>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mob No</label> <input type="text"
                                                                                    required name="mobno" class="form-control"
                                                                                    value="<%= list1.getMobNo() %>">
                                </div>

                                <input type="hidden" name="id" value="<%= list1.getId() %>">

                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>

                        </div>
                    </div>
                </div>


            </div>
        </div>


    </body>
</html>
