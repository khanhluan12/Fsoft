<%-- 
    Document   : service_detail
    Created on : Apr 12, 2025, 1:58:12 PM
    Author     : plmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                <h2>${item.itemName}</h2>
                <img src="${item.imageURL}" alt="${item.itemName}" />
                <p class="price">${item.price} đ</p>
                <p class="description">${item.description}</p>

                <p class="category">Category:
                    <c:choose>
                        <c:when test="${item.serviceID == 1}">Drinks</c:when>
                        <c:when test="${item.serviceID == 2}">Laundry</c:when>
                        <c:when test="${item.serviceID == 3}">Car Rental</c:when>
                        <c:otherwise>Unknown</c:otherwise>
                    </c:choose>
                </p>

                <c:if test="${not empty sessionScope.userA}">
                    <div class="order-form-wrapper">
                        <form action="ServicesCartServlet" method="post">
                            <input type="hidden" name="itemId" value="${item.itemID}" />
                            <label for="quantity">Quantity:</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <button class="btn btn-outline-secondary" type="button" onclick="changeQty(-1)">−</button>
                                </div>
                                <input type="number" name="quantity" id="quantity" class="form-control text-center" value="1" min="1" oninput="validateQty()" />
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button" onclick="changeQty(1)">+</button>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Order Now</button>
                        </form>
                    </div>
                </c:if>
                <c:if test="${empty sessionScope.userA}">
                    <div class="alert alert-warning mt-3" role="alert">
                        Please <a href="login.jsp">log in</a> to order this service.
                    </div>
                </c:if>
            </div>
        </section>
        <%@include file="/includes/footer.jsp" %>
    </body>
    <script>
        function changeQty(amount) {
            const qtyInput = document.getElementById("quantity");
            let current = parseInt(qtyInput.value) || 1;
            current += amount;
            if (current < 1)
                current = 1;
            qtyInput.value = current;
        }

        function validateQty() {
            const qtyInput = document.getElementById("quantity");
            let value = parseInt(qtyInput.value);
            if (isNaN(value) || value < 1) {
                qtyInput.value = 1;
            }
        }
    </script>
</html>
