<%-- 
    Document   : faq
    Created on : Jun 10, 2023, 11:13:39 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>TROPICAL Hotel</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <!-- main css -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
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
                    <h2 class="page-cover-tittle">List Contact</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->

        <!--================Contact Area =================-->
        <h2 style="color: green; text-align: center;" >${contactMess} </h2>
        
        <section class="contact_area section_gap">
            <div class="container"><h2>List Contact</h2>
                <div class="row">
                    <c:forEach items="${requestScope.listC}" var="listContact">

                        <div class="col-md-12">
                            <form class="row contact_form" action="updateContact" method="get" >
                                <input type="hidden" id="IDContact" name="IDContact" value="${listContact.getIDContact()}">
                                <input type="hidden" id="ContactStatus" name="ContactStatus" value="Done">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="name" name="name" value="${listContact.getFullName()}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control" id="email" name="email" value="${listContact.getEmail()}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="phone" name="phone" value="${listContact.getPhone()}" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="phone" name="phone" value="${listContact.getMessage()}" readonly>
                                        <!--<textarea class="form-control" name="message" id="message" rows="1" value="${listContact.getMessage()}" readonly></textarea>-->
                                    </div>
                                </div>
                                <div class="col-md-12 text-right">
                                    <button type="submit" value="submit" class="btn theme_btn button_hover">${listContact.getStatus()}</button>
                                </div>
                                <br>
                            </form>
                        </div>

                    </c:forEach> 
                </div>
            </div>
        </section>
        <!--================Contact Area =================-->

        <!--================ Testimonial Area  =================-->

        <%@include file="/includes/footer.jsp" %>
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

