<%-- 
    Document   : receptionist_booking
    Created on : Jun 23, 2023, 10:27:46 PM
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
            body {
                font-family: Arial, sans-serif;
            }

            form {
                width: 300px;
                margin: 0 auto;
            }

            label {
                display: inline-block;
                width: 100px;
                text-align: right;
            }

            input[type="submit"] {
                margin-left: 100px;
            }

            h1 {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%@include file="/includes/receptionist_header.jsp" %>
        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Booking</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->

        <!--================Booking Tabel Area =================-->
        <form action="searchBooking">
            <div class="container">
                <div class="row hotel_booking_table">
                    <div class="col-md-3">
                        <h2>Search<br> Booking</h2>
                    </div>
                    <div class="col-md-9">
                        <input class="col-md-12" type="text" id="Phone" name="Phone" placeholder="Phone">
                        <!--<input class="col-md-4" type="text" id="BookingCode" name="BookingCode" placeholder="BookingCode">-->
                        <div style="margin-top: 5px;">
                            <input class="book_now_btn button_hover" type="submit" value="Find">
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!--================Booking Tabel Area  =================-->

        <!--Table Start-->
        <table style="margin-top: 20px;margin-bottom: 20px;" id="booking">
            <thead>
                <tr>
                    <th>ID Booking</th>
                    <th>ID Account</th>
                    <th>ID Room</th>

                    <th>Full Name</th>
                    <th>Gender</th>
                    <th>Phone</th>
                    <th>Email</th>

                    <th>Adult</th>
                    <th>Child</th>
                    <th>Number of room</th>
                    <th>Check In</th>
                    <th>Check Out</th>
                    <th>Booking Time</th>
                    <th>Total Price</th>
                    <th>Status</th>
                    <th>View Details</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.listB}" var="b">
                    <tr>
                <form action="loadBookingDetails">
                    <input type="hidden" class="form-control mt-1" id="IDBooking" name="IDBooking" value="${b.getIDBooking()}">
                    <input type="hidden" class="form-control mt-1" id="IDAccount" name="IDAccount" value="${b.getIDAccount()}">
                    <td>${b.getIDBooking()}</td>
                    <td>${b.getIDAccount()}</td>
                    <td>${b.getIDRoomType()}</td>

                    <td>${b.getFullName()}</td>
                    <td>${b.getGender()}</td>
                    <td>${b.getEmail()}</td>
                    <td>${b.getPhone()}</td>

                    <td>${b.getAdult()}</td>
                    <td>${b.getChild()}</td>
                    <td>${b.getNumberOfRooms()}</td>
                    <td>${b.getCheckIn()}</td>
                    <td>${b.getCheckOut()}</td>
                    <td>${b.getBookingTime()}</td> 
                    <td>${b.getTotalPrice()}</td>
                    <td>${b.getNote()}</td>
                    <td><button>View Details</button></td>
                </form>
            </tr>
        </c:forEach>
    </tbody>

</table>
        <!--Table End-->


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
