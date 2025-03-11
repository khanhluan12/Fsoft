<%-- 
    Document   : showBookingDetails
    Created on : Jun 23, 2023, 11:12:04 PM
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
        <link rel="stylesheet" href="css/room_bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">

    </head>
    <body>
        <%@include file="/includes/receptionist_header.jsp" %>
        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Payment</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->
        <br>

        <h1 style="text-align: center;">Booking Details</h1>

        <form action="loadBookingDetails" method="get">

            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">${userA.getFullName()}</span><span class="text-black-50"></span><span> </span></div>
                    </div>
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Booking Details</h4>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Full Name</label><input type="text" name="FullName" class="form-control" readonly  value="${acc.getFullName()}"></div>
                                <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" name="Phone" class="form-control" readonly value="${acc.getPhone()}"></div>
                                <div class="col-md-12"><label class="labels">Email</label><input type="text" name="Email" class="form-control" readonly value="${acc.getEmail()}"></div>
                                <div class="col-md-6"><label class="labels">City</label><input type="text" name="City" class="form-control" readonly value="${acc.getCity()}"></div>
                                <div class="col-md-6"><label class="labels">Gender</label><input type="text" name="Gender" class="form-control" readonly value="${acc.getGender()}" ></div>
                            </div>
                            <div class="row mt-3">

                                <div class="col-md-12"><label class="labels">Payment Method</label><input type="text" name="PaymentMethod" class="form-control" value="Momo" readonly></div>                            
                                <div class="col-md-12"><label class="labels">Status</label><input type="text" name="Status" class="form-control"  value="Done" readonly></div>
                            </div>
                            <!--<div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Pay</button></div>-->
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center experience"><span>Booking Details</span><span class="border px-3 p-1 add-experience"><a href="showRoomCustomer"><i class="fa fa-plus"></i>&nbsp;Booking</a></span></div><br>
                            <div class="col-md-12"><label class="labels">Start Day</label><input type="text" class="form-control" placeholiêder="Start Day" name="checkin" readonly value="${bdt.getCheckIn()}"></div> <br>
                            <div class="col-md-12"><label class="labels">End Day</label><input type="text" class="form-control" placeholder="End Day" readonly name="checkout" value="${bdt.getCheckOut()}"></div> <br>
                            <div class="col-md-12"><label class="labels">Room Type</label><input type="text" class="form-control" placeholder="Room Type" readonly name="idroomtype" value="${bdt.getIDRoomType()}"></div> <br>
                            <div class="col-md-12"><label class="labels">Number Of Room</label><input type="text" class="form-control" placeholder="Number Of Room" readonly value="${bdt.getNumberOfRooms()}"></div> <br>
                            <div class="col-md-12"><label class="labels">Total Price</label><input type="text" class="form-control" placeholder="Total Price" readonly name="totalprice" value="${bdt.getTotalPrice()}"></div> <br>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <br>



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
