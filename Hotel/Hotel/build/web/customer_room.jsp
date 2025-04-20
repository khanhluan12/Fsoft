

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            .error {
                display: block;
                font-size: 0.875em;
                color: red;
                 position: absolute;
            }
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
            .price-vnd {
                font-weight: bold;
                color: #d70018; /* Màu đỏ đặc trưng của VND */
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

            /* Star rating style for partial stars */
            .stars-container {
                position: relative;
                display: inline-block;
                color: #ced4da; /* Gray for empty stars */
            }

            .stars-filled {
                position: absolute;
                top: 0;
                left: 0;
                white-space: nowrap;
                overflow: hidden;
                color: #ffc107; /* Yellow/gold for filled stars */
            }
           .nice-select {
    height: 37px; /* Điều chỉnh chiều cao của nút */
    padding: 0.375rem 0.75rem; /* Giữ khoảng cách giữa nội dung và viền */
}
.form{
    max-width: 100%;
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

        <h2 style="color: green; text-align: center;">${booksuccess}</h2>

        <!--================ Accomodation Area  =================-->
        <section class="accomodation_area py-5">
            <div class="container">
                <p class="text-center text-danger"><strong>${mess}</strong></p>
                <div class="section_title text-center">
                    <h2 class="title_color">LIST ROOM TYPE</h2>
                    <p>Celebrate in stylish ease in our guest accommodations, which offer generous indoor-outdoor areas to enjoy time with loved ones, calmed by fresh breezes and secluded in nature.</p>
                </div>

                <!-- Search Form - Combined from both files -->
   <form action="checkRoomValid" method="get" class="mb-5 p-4 bg-light shadow-sm rounded">
    <div class="row align-items-end">
        <div class="col-md-3 mb-3">
            <label for="check_in" class="form-label">Check-in Date</label>
            <input type="date" class="form-control" id="check_in" name="check_in" value="${param.check_in}">
            <span id="checkin" class="error"></span>
        </div>
       <div class="col-md-3 mb-3 position-relative">
    <label for="check_out" class="form-label">Check-out Date</label>
    <input type="date" class="form-control" id="check_out" name="check_out" value="${param.check_out}">
    <span id="checkout" class="error d-block"></span>
</div>

        <div class="col-md-3 mb-3">
            <label for="roomType" class="form-label">Room Type</label>
            <select class="form-control" name="roomType" id="roomType">
                <option value="">All</option>
                <c:forEach var="rt" items="${allRoomTypes}">
                  <option value="${rt.nameRoomType}"
    <c:if test="${roomType eq rt.nameRoomType}">selected</c:if>>
    ${rt.nameRoomType}
</option>

                </c:forEach>
            </select>
        </div>
        <div class="col-md-3 mb-3">
            <button type="submit" class="btn btn-dark w-100 mt-3 mt-md-0">Search Rooms</button>
        </div>
    </div>
</form>


                <!-- No rooms found message -->
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

                <form id="bookForm"  action="loadRoomToBook" method="get"  onsubmit="return validateBooking()">
                    <input type="hidden" name="numOfDays" value="${numOfDays}">
                    
                  

                    <div class="row g-4">
                        <!--================Database (Khi nao co database thi dung)=================--> 
                        <c:forEach items="${requestScope.listRoom}" var="r">
                            <c:if test="${r.getRoomFree() == null || r.getRoomFree() > 0}">
                                <div class="col-lg-4 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
                                    <div class="room-item shadow rounded overflow-hidden">
                                        <div class="position-relative">
                                            <img class="img-fluid" src="images/${r.getImage()}" alt="">
                                            <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">
                                                <fmt:formatNumber value="${r.getPrice()}" pattern="#,##0" /> VND/Night
                                            </small>
                                        </div>
                                        <div class="p-4 mt-2">
                                            <div class="d-flex justify-content-between mb-3">
                                                <h5 class="mb-0">${r.getNameRoomType()}</h5>
                                                <!-- Fixed rating stars display -->
                                                <div class="rating-stars">
                                                    <c:if test="${r.getAverageRating() != null && r.getAverageRating() > 0}">
                                                        <c:set var="rating" value="${r.getAverageRating()}" />
                                                        <c:set var="percent" value="${(rating / 5) * 100}" />
                                                        <div class="stars-container">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <div class="stars-filled" style="width: ${percent}%;">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </div>
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

                                            <!-- Info tooltips from second file -->
                                            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 10px;">
                                                <span style="font-size: 13px; color: #333;">Child surcharge may apply</span>
                                                <span class="tooltip-container-custom">
                                                    <i class="fas fa-info-circle" style="color: #555;"></i>
                                                    <div class="tooltip-text-custom">
                                                        Children under 1m4 will be charged.
                                                    </div>
                                                </span>
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
                          <c:if test="${requestScope.pagegRoom == null && sessionScope.userA != null && hasRoom}">
                        <button type="submit" class="btn btn-sm btn-dark rounded mb-5 w-100 p-3">Book Now</button>
                    </c:if>
                        <!--================Database =================-->
                    </div>
                </form>
            </div>
        </section>
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

        <script>


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
            // Hàm định dạng số tiền VND
            function formatVND(amount) {
                return new Intl.NumberFormat('vi-VN').format(amount);
            }

// Áp dụng định dạng cho tất cả các phần tử có class 'price-amount'
            document.querySelectorAll('.price-amount').forEach(element => {
                if (element.textContent) {
                    const amount = parseFloat(element.textContent.replace(/[^0-9]/g, ''));
                    element.textContent = formatVND(amount) + ' VND';
                }
            });
          document.getElementById('bookForm').addEventListener('submit', function () {
    document.querySelectorAll('input[name="price"]').forEach(input => {
        input.value = input.value.replace(/[^0-9]/g, '');
    });

                // Khi submit form, chuyển về số nguyên không dấu chấm
                input.form.addEventListener('submit', function () {
                    input.value = input.value.replace(/[^0-9]/g, '');
                });
            });
        </script>
        <script>
          // Chỉ gắn sự kiện cho nút 'Book Now'
document.querySelector('.btn.btn-sm.btn-dark').addEventListener('click', function(event) {
    var checkInDate = document.getElementById('check_in').value;
    var checkOutDate = document.getElementById('check_out').value;
    
    // Kiểm tra xem người dùng đã chọn ngày chưa
    if (!checkInDate || !checkOutDate) {
        event.preventDefault(); // Ngừng việc gửi form
        alert('Vui lòng chọn ngày check-in và check-out trước khi đặt phòng.');
    }
});


        </script>
        <script>
    function validateBooking() {
        const inputs = document.querySelectorAll('input[name="roomBook"]');
        let totalRooms = 0;

        inputs.forEach(input => {
            totalRooms += parseInt(input.value) || 0;
        });

        if (totalRooms <= 0) {
            alert("Vui lòng chọn ít nhất 1 phòng để đặt.");
            return false; // Ngăn submit form
        }

        return true; // Cho phép submit
    }

   function validateRange(input, maxValue) {
    const value = parseInt(input.value) || 0;
    const warning = input.nextElementSibling;

    if (value < 0) {
        input.value = 0;
    } else if (value > maxValue) {
        input.value = maxValue;
        if (warning) warning.textContent = "Số phòng tối đa: " + maxValue;
    } else {
        if (warning) warning.textContent = "";
    }
}


</script>

    </body>
</html>