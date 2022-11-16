
<%@page import="entity.Doctor"%>
<%@page import="db.DBConnection"%>
<%@page import="dao.DoctorDao"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>User Appointment</title>
        <%@include file="components/allcss.jsp"%>
        
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
            }

            .backImg {
                background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
                    url("img/hospital.jpg");
                height: 20vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">

        <link rel="stylesheet" href="components/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="components/css/animate.css">

        <link rel="stylesheet" href="components/css/owl.carousel.min.css">
        <link rel="stylesheet" href="components/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="components/css/magnific-popup.css">

        <link rel="stylesheet" href="components/css/aos.css">

        <link rel="stylesheet" href="components/css/ionicons.min.css">

        <link rel="stylesheet" href="components/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="components/css/jquery.timepicker.css">


        <link rel="stylesheet" href="components/css/flaticon.css">
        <link rel="stylesheet" href="components/css/icomoon.css">
        <link rel="stylesheet" href="components/css/style.css">
    </head>
    <body>
        <%@include file="components/navbar_1.jsp"%>

        <div class="container-fulid backImg p-5">
            <p class="text-center fs-2 text-white"></p>
        </div>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 p-5">
                    <img alt="" src="img/docn.png">
                </div>

                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="text-center fs-3">User Appointment</p>
                            <c:if test="${not empty errorMsg}">
                                <p class="fs-4 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <p class=" fs-4 text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>
                            <form class="row g-3" action="addAppointment" method="post">

                                <input type="hidden" name="userid" value="${userobj.id }">

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Full Name</label> <input
                                        required type="text" class="form-control" name="fullname">
                                </div>

                                <div class="col-md-6">
                                    <label>Gender</label> <select class="form-control" name="gender"
                                                                  required>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Age</label> <input
                                        required type="number" class="form-control" name="age">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Appointment
                                        Date</label> <input type="date" class="form-control" required
                                                        name="appoint_date">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Email</label> <input
                                        required type="email" class="form-control" name="email">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Phone No</label> <input
                                        maxlength="10" required type="number" class="form-control"
                                        name="phno">
                                </div>


                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Diseases</label> <input
                                        required type="text" class="form-control" name="diseases">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputPassword4" class="form-label">Doctor</label> <select
                                        required class="form-control" name="doct">
                                        <option value="">--select--</option>

                                        <%
                                            DoctorDao dao = new DoctorDao(DBConnection.getcon());
                                            List<Doctor> list = dao.getAllDoctor();
                                            for (Doctor d : list) {
                                        %>
                                        <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
                                        </option>
                                        <%
                                            }
                                        %>




                                    </select>
                                </div>

                                <div class="col-md-12">
                                    <label>Full Address</label>
                                    <textarea required name="address" class="form-control" rows="3"
                                              cols=""></textarea>
                                </div>

                                <c:if test="${empty userobj }">
                                    <a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
                                </c:if>

                                <c:if test="${not empty userobj }">
                                    <button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
                                        
        <footer class="ftco-footer ftco-bg-dark ftco-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-3">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">DentaCare.</h2>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    </div>
                    <ul class="ftco-footer-social list-unstyled float-md-left float-lft ">
                        <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                    </ul>
                </div>
                <div class="col-md-2">
                    <div class="ftco-footer-widget mb-4 ml-md-5">
                        <h2 class="ftco-heading-2">Quick Links</h2>
                        <ul class="list-unstyled">
                            <li><a href="#" class="py-2 d-block">About</a></li>
                            <li><a href="#" class="py-2 d-block">Features</a></li>
                            <li><a href="#" class="py-2 d-block">Projects</a></li>
                            <li><a href="#" class="py-2 d-block">Blog</a></li>
                            <li><a href="#" class="py-2 d-block">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 pr-md-4">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">Recent Blog</h2>
                        <div class="block-21 mb-4 d-flex">
                            <a class="blog-img mr-4" style="background-image: url(img2/image_1.jpg);"></a>
                            <div class="text">
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                <div class="meta">
                                    <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="block-21 mb-4 d-flex">
                            <a class="blog-img mr-4" style="background-image: url(img2/image_2.jpg);"></a>
                            <div class="text">
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                <div class="meta">
                                    <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">Office</h2>
                        <div class="block-23 mb-3">
                            <ul>
                                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">

                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>
            </div>
        </div>
    </footer>

    </body>
</html>
