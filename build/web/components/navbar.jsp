<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-transparent" style="box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);">
    
     <div class="container">
            <a class="navbar-brand text-dark" href="index.jsp">Denta<span>Care</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

                <c:if test="${empty userobj }">

                    <li class="nav-item" >
                        <a class="nav-link active text-dark" aria-current="page" href="index.jsp">Home</a>
                    </li>

                   
                    <li class="nav-item "><a href="about.html" class="nav-link text-dark">About</a></li>
                    <li class="nav-item"><a href="services.html" class="nav-link text-dark">Services</a></li>
                    <li class="nav-item"><a href="doctors.html" class="nav-link text-dark">Doctors</a></li>
                    <li class="nav-item"><a href="blog.html" class="nav-link text-dark">Blog</a></li>
                    <li class="nav-item"><a href="contact.html" class="nav-link text-dark">Contact</a></li>

                    <li class="nav-item dropdown">
                        <a class="nav-link text-dark dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Login</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="admin_login.jsp">Admin</a></li>
                            <li><a class="dropdown-item" href="doctor_login.jsp">Doctor</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="user_login.jsp">User</a></li>
                        </ul>
                    </li>

                </c:if>



                <c:if test="${not empty userobj }">

                    <li class="nav-item"><a class="nav-link text-dark"
                                            aria-current="page" href="user_appointment.jsp">APPOINTMENT</a></li>

                    <li class="nav-item"><a class="nav-link text-dark"
                                            aria-current="page" href="view_appointment.jsp">VIEW APPOINTMENT</a></li>

                    <div class="dropdown">
                        <button class="btn btn-success dropdown-toggle" type="button"
                                id="dropdownMenuButton1" data-bs-toggle="dropdown"
                                aria-expanded="false">
                            <i class="fa-solid fa-circle-user"></i> ${userobj.name }
                        </button>

                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">

                            <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
                            <li><a class="dropdown-item" href="userlogout">Logout</a></li>

                        </ul>
                    </div>

                </c:if>













            </ul>

        </div>
    </div>
</nav>

