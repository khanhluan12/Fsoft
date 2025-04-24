<%-- Document : customer_home Created on : May 29, 2023, 11:45:53 PM Author : TuaSan --%>
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
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
    </head>

    <body>
        <%@include file="/includes/header.jsp" %>
        <!--================Banner Area =================-->
        <section class="banner_area">
            <div class="booking_table d_flex align-items-center">
                <div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0"
                     data-background=""></div>
                <div class="container">
                    <div class="banner_content text-center">
                        <h6>Away from monotonous life</h6>
                        <h2>Relax Your Mind</h2>
                        <p>If you are looking at blank cassettes on the web, you may be very confused at
                            the<br> difference in price. You may see some for as low as 300.000VNĐ each.</p>
                        <a href="#" class="btn theme_btn button_hover">Get Started</a>
                    </div>
                </div>
            </div>
            <div class="hotel_booking_area position">
                <div class="container">
                    <div class="hotel_booking_table">
                        <%@include file="/includes/search_room.jsp" %>
                    </div>
                </div>
            </div>
        </section>
        <!--================Banner Area =================-->

        <!--================ Accomodation Area  =================-->

        <!--================ Accomodation Area  =================-->

        <!--================ Facilities Area  =================-->
        <section class="facilities_area section_gap">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0"
                 data-background="">
            </div>
            <div class="container">
                <div class="section_title text-center">
                    <h2 class="title_w">Golden Facilities</h2>
                    <p>Who are in extremely love with eco friendly system.</p>
                </div>
                <div class="row mb_30">
                    <div class="col-lg-4 col-md-6">
                        <div class="facilities_item">
                            <h4 class="sec_h4"><i class="lnr lnr-dinner"></i>Restaurant</h4>
                            <p>Usage of the Internet is becoming more common due to rapid advancement of
                                technology and power.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="facilities_item">
                            <h4 class="sec_h4"><i class="lnr lnr-bicycle"></i>Sports CLub</h4>
                            <p>Usage of the Internet is becoming more common due to rapid advancement of
                                technology and power.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="facilities_item">
                            <h4 class="sec_h4"><i class="lnr lnr-shirt"></i>Swimming Pool</h4>
                            <p>Usage of the Internet is becoming more common due to rapid advancement of
                                technology and power.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="facilities_item">
                            <h4 class="sec_h4"><i class="lnr lnr-car"></i>Rent a Car</h4>
                            <p>Usage of the Internet is becoming more common due to rapid advancement of
                                technology and power.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="facilities_item">
                            <h4 class="sec_h4"><i class="lnr lnr-construction"></i>Gymnesium</h4>
                            <p>Usage of the Internet is becoming more common due to rapid advancement of
                                technology and power.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="facilities_item">
                            <h4 class="sec_h4"><i class="lnr lnr-coffee-cup"></i>Bar</h4>
                            <p>Usage of the Internet is becoming more common due to rapid advancement of
                                technology and power.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================ Facilities Area  =================-->

        <!--================ About History Area  =================-->
        <section class="about_history_area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 d_flex align-items-center">
                        <div class="about_content ">
                            <h2 class="title title_color">About Us <br>Our History<br>Mission & Vision</h2>
                            <p>inappropriate behavior is often laughed off as “boys will be boys,” women
                                face higher conduct standards especially in the workplace. That’s why it’s
                                crucial that, as women, our behavior on the job is beyond reproach.
                                inappropriate behavior is often laughed.</p>
                            <a href="#" class="button_hover theme_btn_two">Request Custom Price</a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img class="img-fluid" src="image/about_bg.jpg" alt="img">
                    </div>
                </div>
            </div>
        </section>
        <!--================ About History Area  =================-->

        <!--================ Testimonial Area  =================-->
        <section class="testimonial_area section_gap">
            <div class="container">
                <div class="section_title text-center">
                    <h2 class="title_color">Testimonial from our Clients</h2>
                    <p>The French Revolution constituted for the conscience of the dominant aristocratic
                        class a fall from </p>
                </div>
                <div class="testimonial_slider owl-carousel">
                    <div class="media testimonial_item">
                        <img class="rounded-circle" src="image/testtimonial-1.jpg" alt="">
                        <div class="media-body">
                            <p>As conscious traveling Paupers we must always be concerned about our dear
                                Mother Earth. If you think about it, you travel across her face, and She is
                                the </p>
                            <a href="#">
                                <h4 class="sec_h4">Fanny Spencer</h4>
                            </a>
                            <div class="star">
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star-half-o"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="media testimonial_item">
                        <img class="rounded-circle" src="image/testtimonial-1.jpg" alt="">
                        <div class="media-body">
                            <p>As conscious traveling Paupers we must always be concerned about our dear
                                Mother Earth. If you think about it, you travel across her face, and She is
                                the </p>
                            <a href="#">
                                <h4 class="sec_h4">Fanny Spencer</h4>
                            </a>
                            <div class="star">
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star-half-o"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="media testimonial_item">
                        <img class="rounded-circle" src="image/testtimonial-1.jpg" alt="">
                        <div class="media-body">
                            <p>As conscious traveling Paupers we must always be concerned about our dear
                                Mother Earth. If you think about it, you travel across her face, and She is
                                the </p>
                            <a href="#">
                                <h4 class="sec_h4">Fanny Spencer</h4>
                            </a>
                            <div class="star">
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star-half-o"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="media testimonial_item">
                        <img class="rounded-circle" src="image/testtimonial-1.jpg" alt="">
                        <div class="media-body">
                            <p>As conscious traveling Paupers we must always be concerned about our dear
                                Mother Earth. If you think about it, you travel across her face, and She is
                                the </p>
                            <a href="#">
                                <h4 class="sec_h4">Fanny Spencer</h4>
                            </a>
                            <div class="star">
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star-half-o"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================ Testimonial Area  =================-->

        <!--================ Latest Blog Area  =================-->
        <section class="latest_blog_area section_gap">
            <div class="container">
                <div class="section_title text-center">
                    <h2 class="title_color">latest posts from blog</h2>
                    <p>The French Revolution constituted for the conscience of the dominant aristocratic
                        class a fall from </p>
                </div>
                <div class="row mb_30">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-recent-blog-post">
                            <div class="thumb">
                                <img class="img-fluid" src="image/blog/blog-1.jpg" alt="post">
                            </div>
                            <div class="details">
                                <div class="tags">
                                    <a href="#" class="button_hover tag_btn">Travel</a>
                                    <a href="#" class="button_hover tag_btn">Life Style</a>
                                </div>
                                <a href="#">
                                    <h4 class="sec_h4">Low Cost Advertising</h4>
                                </a>
                                <p>Acres of Diamonds… you’ve read the famous story, or at least had it
                                    related to you. A farmer.</p>
                                <h6 class="date title_color">31st January,2018</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-recent-blog-post">
                            <div class="thumb">
                                <img class="img-fluid" src="image/blog/blog-2.jpg" alt="post">
                            </div>
                            <div class="details">
                                <div class="tags">
                                    <a href="#" class="button_hover tag_btn">Travel</a>
                                    <a href="#" class="button_hover tag_btn">Life Style</a>
                                </div>
                                <a href="#">
                                    <h4 class="sec_h4">Creative Outdoor Ads</h4>
                                </a>
                                <p>Self-doubt and fear interfere with our ability to achieve or set goals.
                                    Self-doubt and fear are</p>
                                <h6 class="date title_color">31st January,2018</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-recent-blog-post">
                            <div class="thumb">
                                <img class="img-fluid" src="image/blog/blog-3.jpg" alt="post">
                            </div>
                            <div class="details">
                                <div class="tags">
                                    <a href="#" class="button_hover tag_btn">Travel</a>
                                    <a href="#" class="button_hover tag_btn">Life Style</a>
                                </div>
                                <a href="#">
                                    <h4 class="sec_h4">It S Classified How To Utilize Free</h4>
                                </a>
                                <p>Why do you want to motivate yourself? Actually, just answering that
                                    question fully can </p>
                                <h6 class="date title_color">31st January,2018</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================ Recent Area  =================-->

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
        <c:if test="${param.vnp_ResponseCode eq '00'}">
            <script>
                window.onload = function () {
                    const toast = document.createElement("div");
                    toast.innerText = "Payment successful! Thank you for booking with us 🌴";
                    toast.style.position = "fixed";
                    toast.style.top = "20px";
                    toast.style.right = "20px";
                    toast.style.background = "#4BB543";
                    toast.style.color = "white";
                    toast.style.padding = "15px 20px";
                    toast.style.borderRadius = "8px";
                    toast.style.boxShadow = "0 0 10px rgba(0,0,0,0.3)";
                    toast.style.zIndex = "9999";
                    document.body.appendChild(toast);
                    setTimeout(() => toast.remove(), 5000);
                };
            </script>
        </c:if>
        <c:if test="${param.vnp_ResponseCode eq '24'}">
            <script>
                window.onload = function () {
                    const toast = document.createElement("div");
                    toast.innerText = "Payment failed or was cancelled. Please try again 💳";
                    toast.style.position = "fixed";
                    toast.style.top = "20px";
                    toast.style.right = "20px";
                    toast.style.background = "#D8000C";
                    toast.style.color = "white";
                    toast.style.padding = "15px 20px";
                    toast.style.borderRadius = "8px";
                    toast.style.boxShadow = "0 0 10px rgba(0,0,0,0.3)";
                    toast.style.zIndex = "9999";
                    document.body.appendChild(toast);
                    setTimeout(() => toast.remove(), 5000);
                };
            </script>
        </c:if>



    </body>

</html>