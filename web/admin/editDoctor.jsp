<%@page import="entity.Doctor"%>
<%@page import="dao.DoctorDao"%>
<%@page import="entity.Specialist"%>
<%@page import="db.DBConnection"%>



<%@page import="java.util.List"%>

<%@page import="dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
        <%@include file="../components/allcss.jsp"%>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp"%>

        <%
            int id=Integer.parseInt(request.getParameter("id"));
            DoctorDao dao2=new DoctorDao(DBConnection.getcon());
            Doctor d2=dao2.getDoctorById(id);
        %>

        <div class="container-fluid p-3">
            <div class="row">

                <div class="col-md-4 offset-md-4">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Add Doctor</p>

                            <c:if test="${not empty errorMsg}">
                                <p class="fs-3 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>


                            <form action="../updatedoctor" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label> <input type="text" required name="fullname" class="form-control" value="<%=d2.getFullName() %>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">DOB</label> <input type="date" required name="dob" class="form-control" value="<%=d2.getDob() %>" >
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Qualification</label> <input required name="qualification" type="text" class="form-control" value="<%=d2.getQualification() %>" >
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Specialist</label> <select name="specName" required class="form-control" >
                                        <option><%=d2.getSpecialist() %></option>

                                        <%
                                            SpecialistDao dao = new SpecialistDao(DBConnection.getcon());
                                            List<Specialist> list = dao.getAllSpecialist();
                                            for (Specialist s : list) {
                                        %>
                                        <option><%=s.getSpecialistname()%></option>
                                        <%
                                            }
                                        %>


                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label> <input type="text" required name="email" class="form-control" value="<%=d2.getEmail() %>" >
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mob No</label> <input type="text" required name="mobno" class="form-control" value="<%=d2.getMobNo() %>" >
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Password</label> <input required name="text" type="password" class="form-control" value="<%=d2.getPassword() %>" >
                                </div>
                                
                                <input type="hidden" name="id" value="<%=d2.getId() %>">

                                <button type="submit" class="btn btn-success col-md-12">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
       
        </div>

        </div>
    </body>
</html>


