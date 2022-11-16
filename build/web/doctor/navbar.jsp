<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-light" style="box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);">
    <div class="container">
            <a class="navbar-brand text-dark" href="index.jsp">Denta<span>Care</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>
        
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link text-dark" href="index.jsp">HOME</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="patient.jsp">PATIENT</a></li>
            </ul>

            <form class="d-flex">
                <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle" type="button"
                            id="dropdownMenuButton1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        <i class="fas fa-user-circle"></i> ${doctorobj.fullName }
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="editProfile.jsp">Edit
                                Profile</a></li>
                        <li><a class="dropdown-item" href="../doctorLogout">Logout</a></li>
                    </ul>
                </div>
            </form>
        </div>
    </div>
</nav>
                    
