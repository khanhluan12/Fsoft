<%-- 
    Document   : accomodation
    Created on : May 30, 2023, 12:28:44 AM
    Author     : TuaSan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>TROPICAL Hotel</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="css/room_bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <style>
            .rating-stars {
                display: inline-block;
                color: #ffc107;
                font-size: 16px;
                position: relative;
            }
            .rating-value {
                font-size: 14px;
                color: #6c757d;
                margin-left: 5px;
                vertical-align: middle;
            }
            .no-rating {
                font-style: italic;
                color: #6c757d;
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.userA.IDRole == 1 || sessionScope.userA == null}">
            <%@include file="/includes/header.jsp" %>
        </c:if>
        <c:if test="${sessionScope.userA.IDRole == 3}">
            <%@include file="/includes/receptionist_header.jsp" %>
        </c:if>

        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8"></div>
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

        <h2 style="color: green; text-align: center;">${booksuccess}</h2>

        <section class="accomodation_area py-5">
            <div class="container">
                <p class="text-center text-danger"><strong>${mess}</strong></p>
                <div class="section_title text-center">
                    <h2 class="title_color">LIST ROOM TYPE</h2>
                    <p>Celebrate in stylish ease...</p>
                </div>

                <form action="showRoomCustomer" method="get" class="mb-5 p-4 bg-light shadow-sm rounded">
                    <div class="row g-3 align-items-end">
                        <div class="col-md-3">
                            <label for="checkin" class="form-label">Check-in Date</label>
                            <input type="date" class="form-control" id="checkin" name="checkin" value="${param.checkin}">
                        </div>
                        <div class="col-md-3">
                            <label for="checkout" class="form-label">Check-out Date</label>
                            <input type="date" class="form-control" id="checkout" name="checkout" value="${param.checkout}">
                        </div>
                        <div class="col-md-3">
                            <label for="roomTypeFilter" class="form-label">Room Type</label>
                            <select class="form-select" name="roomTypeFilter" id="roomTypeFilter">
                                <option value="">All</option>
                                <option value="Single" ${param.roomTypeFilter == 'Single' ? 'selected' : ''}>Single</option>
                                <option value="Double" ${param.roomTypeFilter == 'Double' ? 'selected' : ''}>Double</option>
                                <option value="VIP" ${param.roomTypeFilter == 'VIP' ? 'selected' : ''}>VIP</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-dark w-100">Search Rooms</button>
                        </div>
                    </div>
                </form>

                <c:set var="hasRoom" value="false" />
                <c:forEach items="${requestScope.listRoom}" var="r">
                    <c:if test="${r.getRoomFree() == null || r.getRoomFree() > 0}">
                        <c:set var="hasRoom" value="true" />
                    </c:if>
                </c:forEach>

                <c:if test="${!hasRoom}">
                    <div class="alert alert-warning text-center w-100">
                        Không tìm thấy phòng trống phù hợp với yêu cầu của bạn!
                    </div>
                </c:if>

                <form action="loadRoomToBook" method="get">
                    <input type="hidden" name="numOfDays" value="${numOfDays}">
                    <c:if test="${requestScope.pagegRoom == null && sessionScope.userA != null && hasRoom}">
                        <button type="submit" class="btn btn-sm btn-dark rounded mb-5 w-100 p-3">Book Now</button>
                    </c:if>

                    <div class="row g-4">
                        <c:forEach items="${requestScope.listRoom}" var="r">
                            <c:if test="${r.getRoomFree() == null || r.getRoomFree() > 0}">
                                <div class="col-lg-4 col-md-12 wow fadeInUp">
                                    <div class="room-item shadow rounded overflow-hidden">
                                        <div class="position-relative">
                                            <img class="img-fluid" src="images/${r.getImage()}" alt="">
                                            <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">${r.getPrice()}$/Night</small>
                                        </div>
                                        <div class="p-4 mt-2">
                                            <div class="d-flex justify-content-between mb-3">
                                                <h5 class="mb-0">${r.getNameRoomType()}</h5>
                                                <div class="rating-stars">
                                                    <c:if test="${r.getAverageRating() != null && r.getAverageRating() > 0}">
                                                        <c:set var="rounded" value="${fn:substringBefore(r.getAverageRating() + 0.5, '.')}" />
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <c:choose>
                                                                <c:when test="${i <= rounded}">
                                                                    <i class="fa fa-star text-warning"></i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa fa-star text-secondary"></i>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <span class="rating-value">(${String.format('%.1f', r.getAverageRating())})</span>
                                                    </c:if>
                                                    <c:if test="${r.getAverageRating() == null || r.getAverageRating() == 0}">
                                                        <span class="no-rating">Chưa có đánh giá</span>
                                                    </c:if>
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
                                                    <c:choose>
                                                        <c:when test="${sessionScope.userA != null}">
                                                            <input type="hidden" value="${r.getIDRoomType()}" name="IDRoomType"/>
                                                            <input type="number" name="roomBook" min="0" max="${r.getRoomFree()}" oninput="validateRange(this,${r.getRoomFree()})" value="0">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="btn btn-sm btn-dark rounded py-2 px-4" href="login.jsp">Book Now(Login)</a>
                                                        </c:otherwise>
                                                    </c:choose>
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

        <%@include file="/includes/footer.jsp" %>

        <script>
            function validateRange(input, maxValue) {
                if (input.value === '') {
                    input.value = 0;
                    return;
                }
                const value = parseInt(input.value, 10);
                const min = parseInt(input.min, 10);
                if (value < min) {
                    input.value = min;
                } else if (value > maxValue) {
                    input.value = maxValue;
                }
            }
        </script>

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