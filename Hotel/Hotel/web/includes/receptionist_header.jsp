<%-- 
    Document   : receptionist_header
    Created on : Jun 21, 2023, 11:22:59 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--================Header Area =================-->
<header class="header_area">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <!-- Brand and toggle get grouped for better mobile display -->
            <a class="navbar-brand logo_h" href="jsp_customer/customer_home.jsp"><img src="image/Logo.png" alt=""></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                <ul class="nav navbar-nav menu_nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="manager_home.jsp">Home</a></li> 
                    <li class="nav-item"><a class="nav-link" href="showBooking">Manage bookings</a></li>
                    <li class="nav-item"><a class="nav-link" href="showRoomCustomer">Room</a></li>
                    <li class="nav-item"><a class="nav-link" href="showContact">FAQ</a></li>
                    <c:if test="${sessionScope.userA != null}"> 
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.userA.getUserName()}</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
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