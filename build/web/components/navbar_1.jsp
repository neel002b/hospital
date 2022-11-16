<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">

    <div class="container">
            <a class="navbar-brand" href="index.jsp">Denta<span>Care</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>
            
           

    <c:if test="${empty userobj }">

        

            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a href="index.jsp" class="nav-link" >Home</a></li>
                    <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
                    <li class="nav-item"><a href="services.html" class="nav-link">Services</a></li>
                    <li class="nav-item"><a href="doctors.html" class="nav-link">Doctors</a></li>
                    <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                    <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Login</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="admin_login.jsp">Admin</a></li>
                            <li><a class="dropdown-item" href="doctor_login.jsp">Doctor</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="user_login.jsp">User</a></li>
                        </ul>
                    </li>
                    <li class="nav-item cta"><a href="user_appointment.jsp" class="nav-link" ><span>Make an Appointment</span></a></li>

                  </ul>
                </c:if>



                <c:if test="${not empty userobj }">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item active"><a href="user_appointment.jsp" class="nav-link">APPOINTMENT</a></li>
                    <li class="nav-item active"><a href="view_appointment.jsp" class="nav-link">VIEW APPOINTMENT</a></li>

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



