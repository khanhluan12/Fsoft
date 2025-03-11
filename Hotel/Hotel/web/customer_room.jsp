<%-- 
    Document   : accomodation
    Created on : May 30, 2023, 12:28:44 AM
    Author     : TuaSan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- main css -->
        <link rel="stylesheet" href="css/room_bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>
        <c:if test="${sessionScope.userA.IDRole == 1}">
            <%@include file="/includes/header.jsp" %>
        </c:if>
        <c:if test="${sessionScope.userA == null}">
            <%@include file="/includes/header.jsp" %>
        </c:if>
        <c:if test="${sessionScope.userA.IDRole == 3}">
            <%@include file="/includes/receptionist_header.jsp" %>
        </c:if>


        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Room</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Accomodation</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->

        <h2 style="color: green; text-align: center;" >${booksuccess} </h2>
        <!--</div>-->        <!--================ Accomodation Area  =================-->
        <section class="accomodation_area section_gap">
            <div class="container">
                <p class="text-center text-danger" ><strong>${mess}</strong></p>
                <div class="section_title text-center">
                    <h2 class="title_color">LIST ROOM TYPE</h2>
                    <p>Celebrate in stylish ease in our guest accommodations, which offer generous indoor-outdoor areas to enjoy time with loved ones, calmed by fresh breezes and secluded in nature.</p>
                </div>
                <form action="loadRoomToBook" method="get">
                    <input type="hidden" name="numOfDays" value="${numOfDays}">
                    <c:if test="${requestScope.pagegRoom == null}">
                        <c:if test="${sessionScope.userA != null}">
                            <button type="submit" class="btn btn-sm btn-dark rounded mb-5 justify-content-center w-100 p-3">Book Now</button>
                        </c:if>
                    </c:if>
                    <div class="row g-4">
                        <!--================Database (Khi nao co database thi dung)=================--> 

                        <c:forEach items="${requestScope.listRoom}" var="r">
                            <c:if test="${r.getRoomFree()>0}">
                                <div class="col-lg-4 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
                                    <div class="room-item shadow rounded overflow-hidden">
                                        <div class="position-relative">
                                            <img class="img-fluid" src="images/${r.getImage()}" alt="">
                                            <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">${r.getPrice()}$/Night</small>
                                        </div>
                                        <div class="p-4 mt-2">
                                            <div class="d-flex justify-content-between mb-3">
                                                <h5 class="mb-0">${r.getNameRoomType()}</h5>
                                                <div class="ps-2">
                                                    <small class="fa fa-star text-primary"></small>
                                                    <small class="fa fa-star text-primary"></small>
                                                    <small class="fa fa-star text-primary"></small>
                                                    <small class="fa fa-star text-primary"></small>
                                                    <small class="fa fa-star text-primary"></small>
                                                </div>
                                            </div>
                                            <div class="d-flex mb-3">
                                                <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>${r.getNumberOfBed()} Bed</small>
                                                <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>${r.getNumberOfBath()} Bath</small>
                                                <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                            </div>
                                            <div class="d-flex">
                                                <p class="text-body mb-3 mr-5">${r.getContent()}</p>
                                                <c:if test="${requestScope.pagegRoom == null}">
                                                    <p class="text-body mb-3">Rooms Free: <strong class="text-danger">${r.getRoomFree()}</strong></p>
                                                    </c:if>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <a class="btn btn-sm btn-primary rounded py-2 px-4" href="roomDetail?id=${r.getIDRoomType()}">View Details</a>
                                                <c:if test="${requestScope.pagegRoom == null}">
                                                    <c:if test="${sessionScope.userA != null}">
                                                        <input type="hidden" value="${r.getIDRoomType()}" name="IDRoomType"/>
                                                        <input type="number" name="roomBook" min="0" max="${r.getRoomFree()}" oninput="validateRange(this,${r.getRoomFree()})" value="0">
                                                        <!--<a class="btn btn-sm btn-dark rounded py-2 px-4" href="loadRoomToBook?IDRoomType=${r.getIDRoomType()}">Book Now</a>-->
                                                    </c:if>
                                                    <c:if test="${sessionScope.userA == null}">  
                                                        <a class="btn btn-sm btn-dark rounded py-2 px-4" href="login.jsp">Book Now(Login)</a>
                                                    </c:if>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                            </c:if>
                        </c:forEach>
                        <!--================Database =================-->
                    </div>
                </form>
            </div>
        </section>
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
        <!--================ Accomodation Area  =================-->

        <!--================ Accomodation Area  =================-->
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
        <script src="vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/filter_room.js"></script>

    </body>
</html>
