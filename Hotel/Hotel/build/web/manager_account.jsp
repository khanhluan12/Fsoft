<%-- 
    Document   : manager_account
    Created on : Jun 5, 2023, 12:03:28 AM
    Author     : admin
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>TROPICAL Hotel</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="vendors/linericon/style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
        <!-- main css -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <style>
            #booking {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #booking td,
            #booking th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #booking tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #booking tr:hover {
                background-color: #ddd;
            }

            #booking th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #FEA116;
                color: white;
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.userA.IDRole == 2}">
            <%@include file="/includes/manager_header.jsp" %>
        </c:if>
        <c:if test="${sessionScope.userA.IDRole == 3}">
            <%@include file="/includes/receptionist_header.jsp" %>
        </c:if>
        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Account</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->


        <!--Table Start-->

        <table style="margin-top: 20px;margin-bottom: 20px;" id="booking">
            <thead>
                <tr>
                    <th>ID Account</th>
                    <th>Full Name</th>
                    <th>Gender</th>
                    <th>City</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>UserName</th>
                    <th>Password</th>
                    <th>Role</th>
                    <th>Manager</th>
                </tr>
            </thead>
            <!--================DATABASE =================-->
            <tbody>
                <c:forEach items="${sessionScope.listU}" var="l">
                    <tr>
                        <td>${l.IDAccount}</td>
                        <td>${l.getFullName()}</td>
                        <td>${l.getGender()}</td>
                        <td>${l.getCity()}</td>
                        <td>${l.getEmail()}</td>
                        <td>${l.getPhone()}</td>
                        <td>${l.getUserName()}</td>
                        <td>${l.getPass()}</td>
                        <td>${l.getIDRole()}</td>
                        <td><a href="delete?IDAccount=${l.getIDAccount()}">Delete</a>|
                            <c:if test="${l.isIsBan()}">
                                <a class="text-info" href="BanAccount?id=${l.getIDAccount()}&status=unban">Unban</a>
                            </c:if>
                            <c:if test="${!l.isIsBan()}">
                                <a class="text-danger" href="BanAccount?id=${l.getIDAccount()}&status=ban">Ban</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
            <!--================DATABASE =================-->
        </table>
        <!--Table End--!>
        
        <!--================FORM ADD NEW ROOM TYPE =================-->

        <h1 style="text-align: center;">Add New Receptionist Account</h1>
        <div class="alert alert-danger" role="alert">
            <p style="color: red; text-align: center;"class="text-danger">${mess} </p>
        </div>
        <form action="register" class="col-md-9 m-auto" method="get" role="form">
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">ID</label><br>
                    <label for="inputname">Auto Generate</label>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Full Name</label>
                    <input type="text" class="form-control mt-1" id="fullname" name="fullname" placeholder="Full Name" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Gender</label>
                    <input type="text" class="form-control mt-1" id="gender" name="gender" placeholder="Gender" required>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">City</label>
                    <input type="text" class="form-control mt-1" id="city" name="city" placeholder="City" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="inputname">Email</label>
                    <input type="email" class="form-control mt-1" id="email" name="email" placeholder="Email" required>
                </div>                    
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Phone</label>
                    <input type="text" class="form-control mt-1" id="phone" name="phone" placeholder="Phone" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="inputname">UserName</label>
                    <input type="text" class="form-control mt-1" id="username" name="username" placeholder="UserName" required>
                </div>                    
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Password</label>
                    <input type="password" class="form-control mt-1" id="password" name="password" placeholder="Password" required>
                    <input type="hidden" id="idrole" name="idrole" value="3">
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Confirm Password</label>
                    <input type="password" class="form-control mt-1" id="confirm_password" name="confirm_password" placeholder="Confirm Password" required>
                </div>
                <div class="col text-end mt-2">
                    <button type="submit" class="btn btn-success btn-lg px-3">Add New Account</button>
                </div>
            </div>
        </form>
        <!--================FORM ADD NEW ROOM TYPE =================-->

        <%@include file="/includes/footer.jsp" %>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/mail-script.js"></script>
        <script src="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
        <script src="vendors/nice-select/js/jquery.nice-select.js"></script>
        <script src="js/mail-script.js"></script>
        <script src="js/stellar.js"></script>
        <script src="vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>

