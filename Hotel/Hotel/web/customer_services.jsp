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
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>
        <%@include file="/includes/header.jsp" %>

        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Gallery</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Gallery</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->

        <section class="services section_gap py-5">
            <div class="container">
                <div class="section_title text-center mb-4">
                    <h2 class="title_color">Our Hotel Services</h2>
                    <p>Experience unmatched hospitality and amenities.</p>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="service-icon fa fa-concierge-bell"></i>
                                <h5 class="card-title mt-3">Room Service</h5>
                                <p class="card-text">Enjoy 24/7 room service for food and beverages.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="image/gallery/01.jpg" alt="">
                            <div class="hover">
                                <a class="light" href="image/gallery/01.jpg"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="image/gallery/02.jpg" alt="">
                            <div class="hover">
                                <a class="light" href="image/gallery/02.jpg"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="service-icon fa fa-info-circle"></i>
                                <h5 class="card-title mt-3">Concierge</h5>
                                <p class="card-text">Get assistance with tours, bookings, and local information.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="service-icon fa fa-broom"></i>
                                <h5 class="card-title mt-3">Housekeeping</h5>
                                <p class="card-text">Daily room cleaning and maintenance services.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="service-icon fa fa-tshirt"></i>
                                <h5 class="card-title mt-3">Laundry</h5>
                                <p class="card-text">Laundry and dry cleaning services available.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="image/gallery/03.jpg" alt="">
                            <div class="hover">
                                <a class="light" href="image/gallery/03.jpg"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="image/gallery/04.jpg" alt="">
                            <div class="hover">
                                <a class="light" href="image/gallery/04.jpg"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="service-icon fa fa-wifi"></i>
                                <h5 class="card-title mt-3">Free Wi-Fi</h5>
                                <p class="card-text">Stay connected with high-speed internet access.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="service-icon fa fa-dumbbell"></i>
                                <h5 class="card-title mt-3">Fitness Center</h5>
                                <p class="card-text">Fully equipped gym and wellness facilities.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="service-icon fa fa-briefcase"></i>
                                <h5 class="card-title mt-3">Business Center</h5>
                                <p class="card-text">Access to computers, printers, and office services.</p>
                            </div>
                        </div>
                    </div>
                        <div class="col-md-4 gallery_item">
                            <div class="gallery_img">
                                <img src="image/gallery/06.jpg" alt="">
                                <div class="hover">
                                    <a class="light" href="image/gallery/05.jpg"><i class="fa fa-expand"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 gallery_item">
                            <div class="gallery_img">
                                <img src="image/gallery/05.jpg" alt="">
                                <div class="hover">
                                    <a class="light" href="image/gallery/06.jpg"><i class="fa fa-expand"></i></a>
                                </div>
                            </div>
                        </div>
                    <div class="col-md-4 mb-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="service-icon fa fa-shuttle-van"></i>
                                <h5 class="card-title mt-3">Transportation</h5>
                                <p class="card-text">Shuttle services to airports and attractions.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="service-icon fa fa-conference"></i>
                                <h5 class="card-title mt-3">Event Facilities</h5>
                                <p class="card-text">Meeting rooms and banquet halls for events.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="service-icon fa fa-utensils"></i>
                                <h5 class="card-title mt-3">Restaurant & Bar</h5>
                                <p class="card-text">On-site dining and lounge options available.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="image/gallery/01-1.jpg" alt="">
                            <div class="hover">
                                <a class="light" href="image/gallery/01-1.jpg"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="image/gallery/02-1.jpg" alt="">
                            <div class="hover">
                                <a class="light" href="image/gallery/02-1.jpg"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="image/gallery/03-1.jpg" alt="">
                            <div class="hover">
                                <a class="light" href="image/gallery/03-1.jpg"><i class="fa fa-expand"></i></a>
                            </div>
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