<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TROPICAL Hotel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/viewDetails.css">

    <link rel="icon" href="image/favicon.png" type="image/png">
    <title>Details Room</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="vendors/linericon/style.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
    <!-- main css -->
    <link rel="stylesheet" href="css/room_bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>

<body>

    <%@include file="/includes/header.jsp" %>
        <div class="main-wrapper">
            <div class="container">
                <div class="item-list">
                    <div class="item">
                        <div class="item-img">
                            <img src="images/${r.getImage()}">
                            <div class="icon-list">
                                <button type="button">
                                    <i class="fas fa-sync-alt"></i>
                                </button>
                                <button type="button">
                                    <i class="fas fa-shopping-cart"></i>
                                </button>
                                <button type="button">
                                    <i class="far fa-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="item-detail">
                            <a href="#" class="item-name">Accent Chair</a>
                            <div class="ps-2">
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                            </div>

                            <div class="d-flex mb-3">
                            <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>${r.getNumberOfBed()} Bed</small>
                            <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>${r.getNumberOfBath()} Bath</small>
                            </div>
                            

                            <div class="item-price">
                                <span class="new-price">$220.00</span>
                                <span class="old-price">$275.60</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore fugiat quod corporis
                                delectus sequi laudantium molestias vero distinctio, qui numquam dolore, corrupti, enim
                                consectetur cum?</p>

                                <span class="new-price">Service</span>

                                <div class="d-flex mb-3">

                                    <small class="border-end me-3 pe-3"><i class="fas fa-cocktail text-primary me-2"></i>Bar-Cocktail</small>
                                    <small class="border-end me-3 pe-3"><i class="fa fa-car text-primary me-2" aria-hidden="true"></i></i>Airport transfer</small>
                                    <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                </div>
                            <button type="button" class="add-btn">add to cart</button>
                        </div>
                    </div>

                    <div class="item">
                        <div class="item-img">
                            <img src="image/room-2.jpg">
                            <div class="icon-list">
                                <button type="button">
                                    <i class="fas fa-sync-alt"></i>
                                </button>
                                <button type="button">
                                    <i class="fas fa-shopping-cart"></i>
                                </button>
                                <button type="button">
                                    <i class="far fa-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="item-detail">
                            <a href="#" class="item-name">Nightstands</a>
                            <div class="ps-2">
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                            </div>

                            <div class="d-flex mb-3">
                                <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>${r.getNumberOfBed()} Bed</small>
                                <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>${r.getNumberOfBath()} Bath</small>
                            </div>
                            
                            <div class="item-price">
                                <span class="new-price">$220.00</span>
                                <span class="old-price">$275.60</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore fugiat quod corporis
                                delectus sequi laudantium molestias vero distinctio, qui numquam dolore, corrupti, enim
                                consectetur cum?</p>

                                <span class="new-price">Service</span>

                                <div class="d-flex mb-3">
                                    <small class="border-end me-3 pe-3"><i class="fas fa-cocktail text-primary me-2"></i>Bar-Cocktail</small>
                                    <small class="border-end me-3 pe-3"><i class="fa fa-car text-primary me-2" aria-hidden="true"></i></i>Airport transfer</small>
                                    <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                </div>
                            <button type="button" class="add-btn">add to cart</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/includes/footer.jsp" %>


        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
        <script src="vendors/nice-select/js/jquery.nice-select.js"></script>
        <script src="js/mail-script.js"></script>
        <script src="js/stellar.js"></script>
        <script src="vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="js/custom.js"></script>
</body>

</html>