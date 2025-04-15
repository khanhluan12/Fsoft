
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <style>
            .error {
                display: block;
                font-size: 0.875em;
                color: red;
            }


        </style>
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
        <section class="accomodation_area py-5 ">
            <div class="container">
                <p class="text-center text-danger" ><strong>${mess}</strong></p>
                <div class="section_title text-center">
                    <h2 class="title_color">LIST ROOM TYPE</h2>
                    <p>Celebrate in stylish ease in our guest accommodations, which offer generous indoor-outdoor areas to enjoy time with loved ones, calmed by fresh breezes and secluded in nature.</p>
                </div>
                <!-- FORM TÌM KIẾM & FILTER -->
                <form action="checkRoomValid" method="get" class="mb-5 p-4 bg-light shadow-sm rounded">
                    <div class="row align-items-end">
                        <div class="col-md-3 mb-3">
                            <label for="check_in" class="form-label">Check-in Date</label>
                            <input type="date" class="form-control" id="check_in" name="check_in" value="${param.checkin}">
                            <span id="checkin" class="error"></span>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="check_out" class="form-label">Check-out Date</label>
                            <input type="date" class="form-control" id="check_out" name="check_out" value="${param.checkout}">
                            <span id="checkout" class="error d-block w-100"></span>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="roomType" class="form-label">Room Type</label>
                            <select class="form-control" name="roomType" id="roomType">
                                <option value="">All</option>
                                <option value="Single" ${roomTypeFilter == 'Single' ? 'selected' : ''}>Single</option>
                                <option value="Double" ${roomTypeFilter == 'Double' ? 'selected' : ''}>Double</option>
                            </select>
                        </div>
                        <div class="col-md-3 mb-3 ">
                            <button type="submit" class="btn btn-dark w-100 mt-3 mt-md-0">Search Rooms</button>
                        </div>
                    </div>
                </form>

                            <!-- comment -->

                <c:set var="hasRoom" value="false" scope="page"/>
                <c:forEach items="${requestScope.listRoom}" var="r">
                    <c:if test="${r.roomFree != null && r.roomFree > 0}">
                        <c:set var="hasRoom" value="true" scope="page"/>
                    </c:if>
                </c:forEach>

                <!-- Nếu không có phòng -->
                <c:if test="${!hasRoom}">
                    <div class="alert alert-warning text-center w-100" role="alert">
                        Không tìm thấy phòng trống phù hợp với yêu cầu của bạn!
                    </div>
                </c:if>


                <!-- Phần form và vòng lặp phòng -->
                <form action="loadRoomToBook" method="get">
                    <input type="hidden" name="numOfDays" value="${numOfDays}">
                    <c:if test="${requestScope.pagegRoom == null}">
                        <c:if test="${sessionScope.userA != null && hasRoom}">
                            <button type="submit" class="btn btn-sm btn-dark rounded mb-5 justify-content-center w-100 p-3">Book Now</button>
                        </c:if>
                    </c:if>


                    <div class="row g-4">
                        <c:forEach items="${requestScope.listRoom}" var="r">
                            <c:if test="${r.getRoomFree() == null || r.getRoomFree() > 0}">
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
                                                <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 10px;">
                                                <span style="font-size: 13px; color: #333;">Child surcharge may apply</span>

                                                <span class="tooltip-container-custom">
                                                    <i class="fas fa-info-circle" style="color: #555;"></i>
                                                    <div class="tooltip-text-custom">
                                                        Children under 1m4 will be charged.
                                                    </div>
                                                </span>
                                            </div>                                           
                                            <div>
                                                <style>
                                                .tooltip-container-custom {
                                                  position: relative;
                                                  display: inline-block;
                                                  cursor: pointer;
                                                  padding-right: 5px;
                                                }

                                                .tooltip-container-custom .tooltip-text-custom {
                                                  visibility: hidden;
                                                  background-color: #002c66;
                                                  color: #fff;
                                                  text-align: center;
                                                  border-radius: 6px;
                                                  padding: 8px 12px;
                                                  position: absolute;
                                                  z-index: 999;
                                                  top: 130%; /* Dưới icon */
                                                  left: 50%;
                                                  transform: translateX(-50%);
                                                  opacity: 0;
                                                  transition: opacity 0.3s ease;
                                                  white-space: nowrap;
                                                  font-size: 13px;
                                                  font-family: 'Poppins', sans-serif;
                                                  min-width: max-content;
                                                }

                                                .tooltip-container-custom .tooltip-text-custom::after {
                                                  content: "";
                                                  position: absolute;
                                                  top: -8px;
                                                  left: 50%;
                                                  transform: translateX(-50%);
                                                  border-width: 6px;
                                                  border-style: solid;
                                                  border-color: transparent transparent #002c66 transparent;
                                                }

                                                .tooltip-container-custom:hover .tooltip-text-custom {
                                                  visibility: visible;
                                                  opacity: 1;
                                                }
                                                </style>                                                                                                                                   
                                            </div>
                                                <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 10px;">
                                                <span style="font-size: 13px; color: #333;">Cancellation policy applies</span>

                                                <span class="tooltip-container-custom">
                                                    <i class="fas fa-info-circle" style="color: #555;"></i>
                                                    <div class="tooltip-text-custom">
                                                        This booking is non-refundable
                                                    </div>
                                                </span>
                                            </div>

                                            
                                            <div>
                                                <style>
                                                .tooltip-container-custom {
                                                  position: relative;
                                                  display: inline-block;
                                                  cursor: pointer;
                                                  padding-right: 5px;
                                                }

                                                .tooltip-container-custom .tooltip-text-custom {
                                                  visibility: hidden;
                                                  background-color: #002c66;
                                                  color: #fff;
                                                  text-align: center;
                                                  border-radius: 6px;
                                                  padding: 8px 12px;
                                                  position: absolute;
                                                  z-index: 999;
                                                  top: 130%; /* Dưới icon */
                                                  left: 50%;
                                                  transform: translateX(-50%);
                                                  opacity: 0;
                                                  transition: opacity 0.3s ease;
                                                  white-space: nowrap;
                                                  font-size: 13px;
                                                  font-family: 'Poppins', sans-serif;
                                                  min-width: max-content;
                                                }

                                                .tooltip-container-custom .tooltip-text-custom::after {
                                                  content: "";
                                                  position: absolute;
                                                  top: -8px;
                                                  left: 50%;
                                                  transform: translateX(-50%);
                                                  border-width: 6px;
                                                  border-style: solid;
                                                  border-color: transparent transparent #002c66 transparent;
                                                }

                                                .tooltip-container-custom:hover .tooltip-text-custom {
                                                  visibility: visible;
                                                  opacity: 1;
                                                }
                                                </style>                                                                                                                                   
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <a class="btn btn-sm btn-primary rounded py-2 px-4" href="roomDetail?id=${r.getIDRoomType()}">View Details</a>
                                                <c:if test="${requestScope.pagegRoom == null}">
                                                    <c:if test="${sessionScope.userA != null}">
                                                        <input type="hidden" value="${r.getIDRoomType()}" name="IDRoomType"/>
                                                        <input type="number" name="roomBook" min="0" max="${r.getRoomFree()}" oninput="validateRange(this,${r.getRoomFree()})" value="0">
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
        <script type="text/javascript">
            function setMinDate() {
                var dtToday = new Date();

                // Increment the date by one day to set tomorrow's date
                dtToday.setDate(dtToday.getDate() + 1);

                var month = dtToday.getMonth() + 1;
                var day = dtToday.getDate();
                var year = dtToday.getFullYear();

                // Format month and day with leading zeros if needed
                if (month < 10) {
                    month = '0' + month.toString();
                }
                if (day < 10) {
                    day = '0' + day.toString();
                }

                var minDate = year + '-' + month + '-' + day;

                // Set the min attribute for check-in and check-out date inputs
                document.getElementById('check_in').setAttribute('min', minDate);
                document.getElementById('check_out').setAttribute('min', minDate);

                console.log(minDate);
            }

            setMinDate();
            ;
            document.getElementById('check_in').addEventListener('change', handleDateChange);
            document.getElementById('check_out').addEventListener('change', handleDateChange);

            function handleDateChange() {
                const currentDate = new Date();
                currentDate.setDate(currentDate.getDate() - 1);
                var checkInDate = new Date(document.getElementById('check_in').value);
                var checkOutDate = new Date(document.getElementById('check_out').value);

                if (checkOutDate <= checkInDate) {
                    document.getElementById('checkout').textContent = 'Your checkout date is less than or equal checkin date.';
                    document.getElementById('check_out').value = '';
                } else if (checkOutDate <= currentDate) {
                    document.getElementById('checkout').textContent = 'Your checkout date is less than or equal currentDate.';
                    document.getElementById('check_out').value = '';
                } else {
                    document.getElementById('checkout').textContent = '';
                }

                if (checkInDate <= currentDate) {
                    document.getElementById('checkin').textContent = 'Your checkin date is less than current date.';
                    document.getElementById('check_in').value = '';
                } else {
                    document.getElementById('checkin').textContent = '';
                }
            }
        </script>
    </body>
</html>
