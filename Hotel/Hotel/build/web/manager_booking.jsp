<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="image/favicon.png" type="image/png">
    <title>TROPICAL Hotel</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="vendors/linericon/style.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">
    <style>
        #booking {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #booking td, #booking th {
            border: 1px solid #ddd;
            padding: 8px;
        }
        #booking tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        #booking tr:hover {
            background-color: #ddd;
        }
        #booking th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #FEA116;
            color: white;
        }
    </style>
</head>
<body>

    <c:if test="${sessionScope.userA.IDRole == 2}">
        <%@include file="/includes/manager_header.jsp" %>
    </c:if>
    <c:if test="${sessionScope.userA.IDRole == 3}">
        <%@include file="/includes/receptionist_header.jsp" %>
    </c:if>

    <section class="breadcrumb_area">
        <div class="overlay bg-parallax"></div>
        <div class="container">
            <div class="page-cover text-center">
                <h2 class="page-cover-tittle">Booking</h2>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">About</li>
                </ol>
            </div>
        </div>
    </section>

    <h2 style="color: green; text-align: center;" >${bookingStatusMess}</h2>
    <h2 style="color: red; text-align: center;" >${searchMess}</h2>

    <form action="searchBooking" method="get">
        <div class="container">
            <div class="row hotel_booking_table">
                <div class="col-md-3">
                    <h2 style="color: black;">Search<br> Booking</h2>
                </div>
                <div class="col-md-9">
                    <input class="col-md-12" type="text" id="Phone" name="Phone" placeholder="Phone">
                    <div style="margin-top: 5px;">
                        <input class="book_now_btn button_hover" type="submit" value="Find">
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle" style="color: black;">Booking By</h2>
            <ol class="breadcrumb">
                <li><a href="showBookingCustomer" style="color: black;">Customer</a></li>
            </ol>
        </div>
    </div>

    <!-- Table -->
    <table style="margin-top: 20px;margin-bottom: 20px;" id="booking">
        <thead>
            <tr>
                <th>ID Booking</th>
                <th>ID Account</th>
                <th>Full Name</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Adult</th>
                <th>Child</th>
                <th>Check In</th>
                <th>Check Out</th>
                <th>Booking Time</th>
                <th>Total Price</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody id="booking-body">
            <c:forEach items="${requestScope.listB}" var="b">
                <tr class="booking-row">
                    <form action="updateBookingStatus" method="get">
                        <input type="hidden" name="IDBooking" value="${b.getIDBooking()}">
                        <input type="hidden" name="IDAccount" value="${b.getIDAccount()}">
                        <input type="hidden" name="Status" value="Success">
                        <td>${b.getIDBooking()}</td>
                        <td>${b.getIDAccount()}</td>
                        <td>${b.getFullName()}</td>
                        <td>${b.getGender()}</td>
                        <td>${b.getEmail()}</td>
                        <td>${b.getPhone()}</td>
                        <td>${b.getAdult()}</td>
                        <td>${b.getChild()}</td>
                        <td>${b.getCheckIn()}</td>
                        <td>${b.getCheckOut()}</td>
                        <td>${b.getBookingTime()}</td>
                        <td>${b.getTotalPrice()}</td>
                        <td><input type="submit" value="${b.getNote()}"></td>
                    </form>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Pagination -->
    <div id="pagination" style="text-align: center; margin-bottom: 30px;"></div>

    <%@include file="/includes/footer.jsp" %>

    <!-- JS scripts -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/mail-script.js"></script>
    <script src="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
    <script src="vendors/nice-select/js/jquery.nice-select.js"></script>
    <script src="js/stellar.js"></script>
    <script src="vendors/lightbox/simpleLightbox.min.js"></script>
    <script src="js/custom.js"></script>

    <!-- Pagination Script -->
    <script>
        const rowsPerPage = 10;
        const rows = document.querySelectorAll(".booking-row");
        const pagination = document.getElementById("pagination");

        let currentPage = 1;
        const totalPages = Math.ceil(rows.length / rowsPerPage);

        function showPage(page) {
            currentPage = page;
            let start = (page - 1) * rowsPerPage;
            let end = start + rowsPerPage;

            rows.forEach((row, index) => {
                row.style.display = (index >= start && index < end) ? "" : "none";
            });

            updatePagination();
        }

        function updatePagination() {
            pagination.innerHTML = "";

            for (let i = 1; i <= totalPages; i++) {
                let btn = document.createElement("button");
                btn.innerText = i;
                btn.style.margin = "0 5px";
                btn.style.padding = "5px 10px";
                btn.style.border = i === currentPage ? "2px solid #FEA116" : "1px solid gray";
                btn.style.backgroundColor = i === currentPage ? "#fff7e6" : "#ffffff";
                btn.onclick = function () {
                    showPage(i);
                };
                pagination.appendChild(btn);
            }
        }

        showPage(1);
    </script>
</body>
</html>
