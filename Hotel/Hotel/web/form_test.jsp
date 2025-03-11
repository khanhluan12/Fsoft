<%-- Document : form_book_room Created on : Jun 8, 2023, 1:13:09 AM Author : admin --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <link rel="stylesheet" type="text/css"
              href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">

        <!-- main css -->
        <link rel="stylesheet" href="css/room_bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <style>
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
        <%@include file="/includes/header.jsp" %>

        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0"
                 data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Booking Room</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->
        <br>
        <h2 style="color: red; text-align: center;">${messFail} </h2>

        <!--onsubmit="return validateForm()"-->

        <form action="confirmInformation" id="bookingForm" class="col-md-9 m-auto" name="myForm" method="get"
              role="form">
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Name:</label>
                    <c:forEach var="r" items="${rooms}">
                        <input type="hidden" class="form-control mt-1" id="IDRoomType" name="IDRoomType" value="${r.getIDRoomType()}">
                    </c:forEach>
                    <input type="hidden" class="form-control mt-1" id="IDAccount" name="IDAccount"
                           value="${userA.getIDAccount()}">
                    <input type="text" class="form-control mt-1" id="FullName" name="FullName"
                           placeholder="Name" required value="${userA.getFullName()}">
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Gender:</label>
                    <input type="text" class="form-control mt-1" id="Gender" name="Gender"
                           placeholder="Gender" required value="${userA.getGender()}">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Phone:</label>
                    <input type="text" class="form-control mt-1" id="Phone" name="Phone" placeholder="Phone"
                           required value="${userA.getPhone()}">
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Email:</label>
                    <input type="text" class="form-control mt-1" id="Email" name="Email" placeholder="Email"
                           required value="${userA.getEmail()}">
                </div>
            </div>
            <br/>
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
                    <input type="number" class="form-control mt-1" id="Adult" name="Adult" min="1" max="${maxPerson}" oninput="validateRange(this,${maxPerson})" placeholder="Adult" required value="1">
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Child:Old 5-13</label>
                    <input type="number" class="form-control mt-1" id="Child" name="Child" min="0" placeholder="Child" required value="0">
                </div>
            </div>



            <div class="row">
                <div class="form-group col-md-6">
                    <label for="checkInDate">Check-In:</label><br>
                    <input type="date" class="form-control" name="checkInDate" id="check_in" value="${check_in}" required readonly="true" />
                    <span id="checkInDate" style="color: red;" class="error"></span>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="checkOutDate">Check-Out:</label><br>
                    <input type="date" class="form-control" name="checkOutDate" id="check_out" value="${check_out}"required readonly="true"/>
                    <span id="checkOutDate" style="color: red;" class="error"></span>
                </div>
            </div>


            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Total Price</label>
                    <input type="text" class="form-control mt-1" id="TotalPrice" name="Price"
                           placeholder="TotalPrice" value="${price}" readonly>
                </div>

                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Discount</label>
                    <input type="text" class="form-control mt-1" id="DiscountCode" name="DiscountCode" placeholder="DiscountCode" value="">
                </div>
            </div>

            <div class="col text-end mt-2">
                <button type="submit" class="btn btn-success btn-lg px-3">Book Now</button>
            </div>
        </form>

        <br>

        <script>
            function validateRange(input, maxValue) {
                if (input.value === '') {
                    input.value = 0;
                    return;
                }

                const value = parseInt(input.value, 10);
                const min = parseInt(input.min, 10);
                const max = maxValue;

                if (value < min) {
                    input.value = min;
                } else if (value > max) {
                    input.value = max;
                }
            }
        </script>
        <!--=========
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
    </body>

</html>