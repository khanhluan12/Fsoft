

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>Item Details</title>
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
        <link rel="stylesheet" href="css/styleServicePlus.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>
        <%@include file="/includes/header.jsp" %>

        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0"></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Item Details</h2>
                </div>
            </div>
        </section>

        <!--================ Item Details Section =================-->
        <section class="services py-5">
            <div class="item-detail-container">
                <!-- Add error message display here -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-3" role="alert">
                        ${error}
                    </div>
                </c:if>

                <h2>${item.itemName}</h2>
                <img src="${item.imageURL}" alt="${item.itemName}" />
                <p class="price"><fmt:formatNumber value="${item.price}" pattern="#,###" /> đ</p>
                <p class="description">${item.description}</p>

                <p class="category">Category:
                    <c:choose>
                        <c:when test="${item.serviceID == 1}">Food</c:when>
                        <c:when test="${item.serviceID == 2}">Drink</c:when>
                        <c:when test="${item.serviceID == 3}">Bike Rental</c:when>
                        <c:otherwise>Unknown</c:otherwise>
                    </c:choose>
                </p>

                <c:choose>
                    <%-- Case 1: User not logged in --%>
                    <c:when test="${empty sessionScope.userA}">
                        <div class="alert alert-warning mt-3" role="alert">
                            Please <a href="login.jsp">log in</a> to order this service.
                        </div>
                    </c:when>

                    <%-- Case 2: Bike rental with no active booking --%>
                    <c:when test="${item.serviceID == 3 and not hasActiveBooking}">
                        <div class="alert alert-warning mt-3" role="alert">
                            Bike rental is only available for guests with an active hotel booking.
                            Please <a href="customer_home.jsp">make a reservation</a> first.
                        </div>
                    </c:when>

                    <%-- Case 3: Bike rental with active booking --%>
                    <c:when test="${item.serviceID == 3 and hasActiveBooking}">
                        <div class="alert alert-success mt-3" role="alert">
                            <h4>Bike Rental Available</h4>
                            <p>You have active bookings and can rent up to ${totalAdults} bikes.</p>
                        </div>

                        <div class="booking-info mb-3">
                            <h5>Your Active Bookings:</h5>
                            <ul>
                                <c:forEach var="booking" items="${activeBookings}">
                                    <li>
                                        ${booking.checkIn} to ${booking.checkOut} - 
                                        ${booking.adult} adults
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="order-form-wrapper">
                            <form action="ServicesCartServlet" method="post">
                                <input type="hidden" name="itemId" value="${item.itemID}" />
                                <div class="form-group">
                                    <label>Quantity (Max ${totalAdults}):</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <button class="btn btn-outline-secondary" type="button" onclick="changeQty(-1)">−</button>
                                        </div>
                                        <input type="number" name="quantity" id="quantity" class="form-control text-center" 
                                               value="1" min="1" max="${totalAdults}" oninput="validateQty()" />
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button" onclick="changeQty(1)">+</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <label>Rental Date:</label>
                                        <input type="date" name="rentalDate" class="form-control" required 
                                               min="${activeBookings[0].checkIn}" max="${activeBookings[0].checkOut}" />
                                    </div>
                                    <div class="col-md-6">
                                        <label>Rental Time:</label>
                                        <input type="time" name="rentalTime" class="form-control" required />
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">Order Now</button>
                            </form>
                        </div>
                    </c:when>

                    <%-- Case 4: Food/Drink service --%>
                    <c:otherwise>
                        <div class="order-form-wrapper">
                            <form action="ServicesCartServlet" method="post">
                                <input type="hidden" name="itemId" value="${item.itemID}" />
                                <div class="form-group">
                                    <label>Quantity:</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <button class="btn btn-outline-secondary" type="button" onclick="changeQty(-1)">−</button>
                                        </div>
                                        <input type="number" name="quantity" id="quantity" class="form-control text-center" 
                                               value="1" min="1" oninput="validateQty()" />
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button" onclick="changeQty(1)">+</button>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">Order Now</button>
                            </form>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
        <%@include file="/includes/footer.jsp" %>
    </body>
    <script>
        function validateQty() {
            const qtyInput = document.getElementById("quantity");
            let value = parseInt(qtyInput.value);
            const max = parseInt(qtyInput.max) || Infinity;
            const min = parseInt(qtyInput.min) || 1;

            if (isNaN(value)) {
                qtyInput.value = min;
            } else if (value < min) {
                qtyInput.value = min;
            } else if (value > max) {
                qtyInput.value = max;
            }
        }

        function changeQty(amount) {
            const qtyInput = document.getElementById("quantity");
            let current = parseInt(qtyInput.value) || 1;
            const max = parseInt(qtyInput.max) || Infinity;
            const min = parseInt(qtyInput.min) || 1;

            current += amount;
            if (current < min)
                current = min;
            if (current > max)
                current = max;

            qtyInput.value = current;
        }
    </script>
</html>