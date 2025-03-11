<%-- 
    Document   : header
    Created on : May 30, 2023, 12:11:50 AM
    Author     : TuaSan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<!--================Header Area =================-->
<header class="header_area">

    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <!-- Brand and toggle get grouped for better mobile display -->
            <a style="width: 20%;" class="navbar-brand logo_h" href="customer_home.jsp"><img style="width: 150%;" src="image/logo1.png" alt=""></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                <ul class="nav navbar-nav menu_nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="customer_home.jsp">Home</a></li> 
                    <li class="nav-item"><a class="nav-link" href="customer_about.jsp">About us</a></li>
                    <li class="nav-item"><a class="nav-link" href="showRoomCustomer">Room</a></li>
                    <li class="nav-item"><a class="nav-link" href="customer_services.jsp">Services</a></li>


                    <li class="nav-item"><a class="nav-link" href="loadFeedback">FAQ</a></li>
                    <li class="nav-item"><a class="nav-link" href="customer_contact.jsp">Contact</a></li>
                    <c:if test="${sessionScope.userA != null}"> 
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.userA.getUserName()}</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="Profile">Profile</a></li>
                                <li class="nav-item"><a class="nav-link" href="logout">Log Out</a></li>
                            </ul>
                        </li> 
                    </c:if>
                    <c:if test="${sessionScope.userA == null}">  
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    </c:if>

                </ul>
            </div> 
        </nav>
    </div>
</header>

<!--================Header Area =================-->

<!--================Icon link=================-->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>