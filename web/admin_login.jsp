<%-- 
    Document   : admin_login
    Created on : Nov 3, 2022, 8:11:15 PM
    Author     : chintan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/allcss.jsp" %>


        <style>
            body{
                margin: 0;
                padding: 0;
                background-image: url('img2/bg_1.jpg'); 
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                font-family: 'Jost', sans-serif;

            }
            .main{
                margin: 50px;
                align-content: center;
                width: 350px;
                height: 500px;
                background: floralwhite;
                overflow: hidden;

                border-radius: 10px;
                box-shadow: 2px 10px 25px #000;
            }
            
            
            label{
                color: #2f89fc;
                font-size: 3.3em;
                justify-content: center;
                display: flex;
                margin: 60px;
                font-weight: bold;
                cursor: pointer;
                transition: .5s ease-in-out;
            }
            input{
                
                background: #e0dede;
                justify-content: center;
                display: flex;
                margin: 20px auto;
                padding: 10px;
                border: none;
                outline: none;
                border-radius: 5px;
            }
            button{
                width: 60%;
                height: 40px;
                margin: 10px auto;
                justify-content: center;
                display: block;
                color: white;
                background: #2f89fc;
                font-size: 1em;
                font-weight: bold;
                margin-top: 20px;
                outline: none;
                border: none;
                border-radius: 5px;
                transition: .2s ease-in;
                cursor: pointer;
            }
            button:hover{
                background: #2f89fc;
            }
            .login{
                height: 460px;
                background: #eee;
                border-radius: 60% / 10%;
                
                transition: .8s ease-in-out;
            }
            .login label{
                color: #2f89fc;
                transform: scale(.6);
            }

            #chk:checked ~ .login{
                transform: translateY(-500px);
            }
            #chk:checked ~ .login label{
                transform: scale(1);	
            }
            #chk:checked ~ .signup label{
                transform: scale(.6);
            }





        </style>
        
        

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        

    <center>

        <div class="main">  	
            

            <c:if test="${not empty succMsg}">
                <p class="text-center text-success fs-5">${succMsg}</p>
                <c:remove var="succMsg" scope="session" />
            </c:if>


            <c:if test="${not empty errorMsg}">
                <p class="text-center text-danger fs-5">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session" />
            </c:if>

            <div class="login">
                <form action="adminlogin" method="post">
                    <label for="chk" aria-hidden="true">Login</label>
                    <input type="email" name="email" placeholder="Email" required="">
                    <input type="password" name="pwd" placeholder="Password" required="">
                    <button>Login</button>
                </form>
            </div>
        </div>
    </center>
</body>
</html>
