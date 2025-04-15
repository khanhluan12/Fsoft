<%-- 
    Document   : form_payment
    Created on : Jun 8, 2023, 9:20:49 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" type="text/css" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
        <!-- main css -->
        <link rel="stylesheet" href="css/room_bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/styleServicePlus.css">    <%-- Style for Service Order History section --%>
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
    </head>
    <body>
        <c:if test="${sessionScope.userA.IDRole == 1}">
            <%@include file="/includes/header.jsp" %>
        </c:if>
        <c:if test="${sessionScope.userA.IDRole == 2}">
            <%@include file="/includes/manager_header.jsp" %>
        </c:if>
        <c:if test="${sessionScope.userA.IDRole == 3}">
            <%@include file="/includes/receptionist_header.jsp" %>
        </c:if>

        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">My Profile</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Profile</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->
        <br>
        <h2 style="color: green; text-align: center;" >${editProfile} </h2>

        <form action="editProfile" method="get">

            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <!--                    <div class="col-md-2 border-right">
                                            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">${userA.getFullName()}</span><span class="text-black-50"></span><span> </span></div>
                                        </div>-->
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-12"><input type="hidden" name="IDAccount" class="form-control"  value="${userA.getIDAccount()}"></div>
                                <div class="col-md-12"><label class="labels">Full Name</label><input type="text" name="FullName" class="form-control"  value="${userA.getFullName()}"></div>
                                <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" name="Phone" class="form-control"  value="${userA.getPhone()}"></div>
                                <div class="col-md-12"><label class="labels">Email</label><input type="text" name="Email" class="form-control"value="${userA.getEmail()}"></div>
                                <div class="col-md-6"><label class="labels">City</label><input type="text" name="City" class="form-control" value="${userA.getCity()}"></div>
                                <div class="col-md-6"><label class="labels">Gender</label><input type="text" name="Gender" class="form-control" value="${userA.getGender()}" ></div>
                            </div>
                            <div class="row mt-3 d-none">
                                <div class="col-md-12"><label class="labels">UserName</label><input type="text" name="UserName" class="form-control" value="${userA.getUserName()}"></div>                            
                                <div class="col-md-12"><label class="labels">Password</label><input type="text" name="Pass" class="form-control"  value="${userA.getPass()}"></div>
                            </div>
                            <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <div class="p-3 py-5">
                            <h4>Booking Detail history</h4>
                            <table id="bookingTable" border="1" width="1" cellspacing="1" cellpadding="1" class="w-100 text-center">
                                <thead>
                                    <tr>
                                        <th>Adult</th>
                                        <th>Child</th>
                                        <th>Checkin</th>
                                        <th>Checkout</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="bookingDetail" items="${BookingDetails}">
                                        <tr>
                                            <td>${bookingDetail.getAdult()}</td>
                                            <td>${bookingDetail.getChild()}</td>
                                            <td>${bookingDetail.getCheckIn()}</td>
                                            <td>${bookingDetail.getCheckOut()}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${bookingDetail.note == 'Success'}">
                                                        <p class="text-success">Success</p>
                                                    </c:when>
                                                    <c:when test="${bookingDetail.note == 'Cancelled'}">
                                                        <p class="text-danger">Cancelled</p>
                                                    </c:when>
                                                    <c:when test="${bookingDetail.isOver()}">
                                                        <p class="text-info">This booking is overdue</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="#" onclick="confirmCancel('${bookingDetail.getIDBooking()}')">Cancel</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>


                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div id="bookingPagination" class="pagination-controls text-center my-3"></div>
                        </div>

                        <div class="p-3 py-5">
                            <h4>Service Order History</h4>
                            <table id="serviceTable" border="1" width="1" cellspacing="1" cellpadding="1" class="w-100 text-center">
                                <thead>
                                    <tr>
                                        <th>Service Name</th>
                                        <th>Quantity</th>
                                        <th>Total Price</th>
                                        <th>Order Date</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${serviceOrders}" var="order">
                                        <tr>
                                            <td>${order.serviceName}</td>
                                            <td>${order.quantity}</td>
                                            <td><fmt:formatNumber value="${order.totalPrice}" pattern="#,### đ" /></td>
                                            <td>${order.orderDate}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${order.status == 'Completed'}">
                                                        <p class="text-success">Completed</p>
                                                    </c:when>
                                                    <c:when test="${order.status == 'Cancelled'}">
                                                        <p class="text-danger">Cancelled</p>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty serviceOrders}">
                                        <tr>
                                            <td colspan="6" class="text-center">No service orders found</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                            <div id="servicePagination" class="pagination-controls text-center my-3"></div>
                        </div>
                    </div>
                </div>
            </div>

        </form>
        <br>

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

        <script>
                                                            function confirmCancel(bookingId) {
                                                                var contactInfo = prompt("Please enter your contact information for cancellation:");
                                                                if (contactInfo != null) {
                                                                    if (confirm("Are you sure you want to cancel this booking?")) {
                                                                        window.location.href = './CancelBooking?bookingId=' + bookingId + '&contactInfo=' + encodeURIComponent(contactInfo);
                                                                    }
                                                                }
                                                            }
        </script>
        <script>
            function paginateTable(tableId, paginationId, rowsPerPage = 4) {
                const table = document.getElementById(tableId);
                const tbody = table.querySelector("tbody");
                const rows = Array.from(tbody.querySelectorAll("tr"));
                const totalPages = Math.ceil(rows.length / rowsPerPage);
                const pagination = document.getElementById(paginationId);

                let currentPage = 1;

                function showPage(page) {
                    currentPage = page;
                    const start = (page - 1) * rowsPerPage;
                    const end = start + rowsPerPage;
                    rows.forEach((row, i) => {
                        row.style.display = i >= start && i < end ? "" : "none";
                    });

                    // Render pagination
                    pagination.innerHTML = '';
                    for (let i = 1; i <= totalPages; i++) {
                        const btn = document.createElement('button');
                        btn.textContent = i;
                        btn.className = 'btn btn-sm mx-1 ' + (i === page ? 'btn-primary' : 'btn-outline-primary');
                        btn.onclick = () => showPage(i);
                        pagination.appendChild(btn);
                    }
                }

                showPage(1);
            }

// On load
            window.onload = function () {
                paginateTable("bookingTable", "bookingPagination", 4);
                paginateTable("serviceTable", "servicePagination", 4);
            }
        </script>

    </body>
</html>
