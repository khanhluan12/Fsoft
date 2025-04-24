<%-- 
    Document   : form_payment
    Created on : Jun 8, 2023, 9:20:49 PM
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
        <%@include file="/includes/header.jsp" %>
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

        <h1 style="text-align: center;">Payment Room</h1>
        
        <form action="bookingRoom" id="bookingForm" class="col-md-9 m-auto" name="myForm" method="post"
              role="form">
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Name:</label>
                    <input type="text" class="form-control mt-1" id="FullName" name="FullName" placeholder="Name" value="${booking.getFullName()}" readonly>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Gender:</label>
                    <input type="text" class="form-control mt-1" id="Gender" name="Gender" placeholder="Gender" value="${booking.getGender()}" readonly>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Phone:</label>
                    <input type="text" class="form-control mt-1" id="Phone" name="Phone" placeholder="Phone" value="${booking.getPhone()}" readonly>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Email:</label>
                    <input type="text" class="form-control mt-1" id="Email" name="Email" placeholder="Email" value="${booking.getEmail()}" readonly>
                </div>
            </div>
            <hr>

            <c:forEach var="r" items="${rooms}">
                <div class="row justify-content-center">
                    <div class="col-md-4">
                        <P for="inputname">Room Type: <span>${r.getNameRoomType()}</span></P>
                    </div>
                    <div class="col-md-4">
                        <P for="inputname">Price: <span>${r.getPrice()}$/Night</span></P>
                    </div>
                    <div class="col-md-4">
                        <P for="inputname">Number of room: <span class="text-danger">${r.getNumberRoomBook()}</span></P>
                    </div>
                </div>
            </c:forEach>

            <div class="row">
                <div class="form-group col-md-6">
                    <label for="inputname">Adult: (Old 13+)</label>
                    <input type="number" class="form-control mt-1" id="Adult" name="Adult" value="${booking.getAdult()}" readonly/>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Child:Old 5-13</label>
                    <input type="number" class="form-control mt-1" id="Child" name="Child" value="${booking.getChild()}" readonly/>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6">
                    <label for="checkInDate">Check-In:</label><br>
                    <input type="date" class="form-control" name="checkInDate" id="check_in" value="${booking.getCheckIn()}"readonly />
                    <span id="checkInDate" style="color: red;" class="error"></span>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="checkOutDate">Check-Out:</label><br>
                    <input type="date" class="form-control" name="checkOutDate" id="check_out" value="${booking.getCheckOut()}" readonly/>
                </div>
            </div>


            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Total Price</label>
                    <input type="text" class="form-control mt-1" id="TotalPrice" name="TotalPrice" value="${booking.getTotalPrice()}" readonly>
                </div>
            </div>


            <div class="col text-end mt-2">
                <button type="submit" class="btn btn-success btn-lg px-3">Book Now</button>
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
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>
</html>
