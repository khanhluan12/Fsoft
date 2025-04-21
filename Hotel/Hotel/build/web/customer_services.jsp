<%-- 
    Document   : customer_services
    Created on : May 30, 2023, 12:32:34 AM
    Author     : TuaSan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
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
        <link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css">
        <!-- main css -->
        <!--<link rel="stylesheet" href="css/styleServices.css">-->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styleServices.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>
        <%@include file="/includes/header.jsp" %>

        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Services</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Services</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->

        <section class="hotel-service-section py-5">
            <div class="container">
                <div class="section_title text-center mb-4">
                    <h2 class="title_color">Our Hotel Services</h2>
                    <p>Experience unmatched hospitality and amenities.</p>
                </div>
                <div class="row">

                    <!-- Food Service -->
                    <div class="col-md-4 mb-4">
                        <div class="service-card-custom" onclick="location.href = 'service?type=foods'">
                            <div class="service-card-bg" style="background-image: url('image/gallery/services_cooking.jpg');"></div>
                            <div class="service-card-overlay">
                                <h5 class="service-card-title">Foods Service</h5>
                                <p class="service-card-text">Delicious dining options delivered to your room</p>
                            </div>
                        </div>
                    </div>

                    <!-- Drink Service -->
                    <div class="col-md-4 mb-4">
                        <div class="service-card-custom" onclick="location.href = 'service?type=drinks'">
                            <div class="service-card-bg" style="background-image: url('image/gallery/services_drinks.jpg');"></div>
                            <div class="service-card-overlay">
                                <h5 class="service-card-title">Drinks Service</h5>
                                <p class="service-card-text">Refreshing drinks delivered straight to your room, anytime you need</p>
                            </div>
                        </div>
                    </div>

                    <!-- Bike Rental -->
                    <div class="col-md-4 mb-4">
                        <div class="service-card-custom" onclick="location.href = 'service?type=bikes'">
                            <div class="service-card-bg" style="background-image: url('image/gallery/services_bikes.jpg');"></div>
                            <div class="service-card-overlay">
                                <h5 class="service-card-title">Bikes Rental</h5>
                                <p class="service-card-text">Rent a bike for city exploration and convenience</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="services">
            <div class="container">
                <div class="section_title text-center mb-4">
                    <h2 class="title_color">Other Services</h2>
                    <p>Experience unmatched hospitality and amenities.</p>
                </div>
            </div>

            <!-- Full Width Image Cards -->
            <div class="custom-service-card" style="background-image: url('image/gallery/services_room.jpg');">
                <div class="custom-service-overlay">
                    <div class="custom-service-content">
                        <h3 class="custom-service-title">Room Service</h3>
                        <p class="custom-service-text">Enjoy 24/7 room service for food and beverages.</p>
                    </div>
                </div>
            </div>

            <div class="custom-service-card" style="background-image: url('image/gallery/services_concierge.jpg');">
                <div class="custom-service-overlay">
                    <div class="custom-service-content">
                        <h3 class="custom-service-title">Concierge</h3>
                        <p class="custom-service-text">Get assistance with tours, bookings, and local information.</p>
                    </div>
                </div>
            </div>

            <div class="custom-service-card" style="background-image: url('image/gallery/services_housekeeping.jpg');">
                <div class="custom-service-overlay">
                    <div class="custom-service-content">
                        <h3 class="custom-service-title">Housekeeping</h3>
                        <p class="custom-service-text">Daily room cleaning and maintenance services.</p>
                    </div>
                </div>
            </div>

            <div class="custom-service-card" style="background-image: url('image/gallery/services_wifi.jpg');">
                <div class="custom-service-overlay">
                    <div class="custom-service-content">
                        <h3 class="custom-service-title">Free Wi-Fi</h3>
                        <p class="custom-service-text">Stay connected with high-speed internet access.</p>
                    </div>
                </div>
            </div>

            <div class="custom-service-card" style="background-image: url('image/gallery/services_fitness_center.jpg');">
                <div class="custom-service-overlay">
                    <div class="custom-service-content">
                        <h3 class="custom-service-title">Fitness Center</h3>
                        <p class="custom-service-text">Fully equipped gym and wellness facilities.</p>
                    </div>
                </div>
            </div>

            <div class="custom-service-card" style="background-image: url('image/gallery/services_bussiness_center.jpg');">
                <div class="custom-service-overlay">
                    <div class="custom-service-content">
                        <h3 class="custom-service-title">Business Center</h3>
                        <p class="custom-service-text">Access to computers, printers, and office services.</p>
                    </div>
                </div>
            </div>

            <div class="custom-service-card" style="background-image: url('image/gallery/services_event_facs.jpg');">
                <div class="custom-service-overlay">
                    <div class="custom-service-content">
                        <h3 class="custom-service-title">Event Facilities</h3>
                        <p class="custom-service-text">Meeting rooms and banquet halls for events.</p>
                    </div>
                </div>
            </div>

            <div class="custom-service-card" style="background-image: url('image/gallery/services_res_bar.jpg');">
                <div class="custom-service-overlay">
                    <div class="custom-service-content">
                        <h3 class="custom-service-title">Restaurant & Bar</h3>
                        <p class="custom-service-text">On-site dining and lounge options available.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@include file="/includes/footer.jsp" %>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
    <script src="vendors/nice-select/js/jquery.nice-select.js"></script>
    <script src="js/mail-script.js"></script>
    <script src="js/stellar.js"></script>
    <script src="vendors/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="vendors/isotope/isotope-min.js"></script>
    <script src="js/stellar.js"></script>
    <script src="vendors/lightbox/simpleLightbox.min.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>