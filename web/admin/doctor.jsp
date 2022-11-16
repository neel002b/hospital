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


        <div class="container-fluid p-3">
            <div class="row">

                <div class="col-md-3">
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


                            <form action="../addDoctor" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label> <input type="text" required name="fullname" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">DOB</label> <input type="date" required name="dob" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Qualification</label> <input required name="qualification" type="text" class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Specialist</label> <select name="specName" required class="form-control">
                                        <option>--select--</option>

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
                                    <label class="form-label">Email</label> <input type="text" required name="email" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mob No</label> <input type="text" required name="mobno" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Password</label> <input required name="password" type="password" class="form-control">
                                </div>

                                <button type="submit" class="btn btn-success">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Doctor Details</p>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">DOB</th>
                                        <th scope="col l">qualification</th>
                                        <th scope="col">specialist</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Mob No</th>
                                        <th scope="col">Actions<th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <%
                                        DoctorDao dao2=new DoctorDao(DBConnection.getcon());
                                        List<Doctor> list1=dao2.getAllDoctor();
                                        for(Doctor d:list1)
                                        {%>
                                        <tr>
                                            <td><%=d.getFullName()%></td>
                                            <td><%=d.getDob()%></td>
                                            <td><%=d.getQualification()%></td>
                                            <td><%=d.getSpecialist()%></td>
                                            <td><%=d.getEmail()%></td>
                                            <td><%=d.getMobNo()%></td>
                                            <td>
                                                <a href="editDoctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary">Edit</a> 
                                                <a href="../deletedoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
                                            </td>
                                            
                                        </tr>
                                        
                                        
                                        <%}
                                        %>    
                                    

                                    
                                    
                                </tbody>
                            </table>
                        </div>
                     </div>
                </div>





                        
        </div>

    </body>
</html>

