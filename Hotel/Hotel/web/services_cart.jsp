<%-- 
    Document   : services_cart
    Created on : Apr 12, 2025, 2:05:52 PM
    Author     : plmin
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.ServiceItem, model.CartItem" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>Your Cart</title>
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
                    <h2 class="page-cover-tittle">Your Cart</h2>
                </div>
            </div>
        </section>

        <!--================ Food Service Section =================-->
        <section class="services py-5">
            <div class="container">
                <div class="section-title text-center mb-5">
                    <c:choose>
                        <c:when test="${empty cartItems}">
                            <p class="cart-empty-message">Your cart is empty.</p>
                            <a href="service_food.jsp" class="cart-back-link">Back to Menu</a>
                        </c:when>

                        <c:otherwise>
                            <table class="cart-table">
                                <thead>
                                    <tr>
                                        <th>Item Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="total" value="0" />
                                    <c:forEach var="cartItem" items="${cartItems}">
                                        <c:set var="item" value="${cartItem.item}" />
                                        <c:set var="qty" value="${cartItem.quantity}" />
                                        <c:set var="subtotal" value="${item.price * qty}" />
                                        <tr>
                                            <td>${item.itemName}</td>
                                            <td>${qty}</td>
                                            <td>${item.price} đ</td>
                                            <td>${subtotal} đ</td>
                                        </tr>
                                        <c:set var="total" value="${total + subtotal}" />
                                    </c:forEach>
                                </tbody>
                            </table>

                            <!-- Total and Checkout -->
                            <p class="cart-total"><strong>Total:</strong> ${total} đ</p>

                            <!--[DEBUG]-->
                            <%
                                double serviceTotal = 0.0;
                                List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
                                if (cartItems != null) {
                                    for (CartItem cartItem : cartItems) {
                                        serviceTotal += cartItem.getItem().getPrice() * cartItem.getQuantity();
                                    }
                                }
                                session.setAttribute("serviceTotal", serviceTotal);
                            %>

                            <div class="d-flex justify-content-center mt-4 gap-3 flex-wrap cart-buttons">
                                <form action="ServicesOrderServlet" method="post" class="text-center mt-4">
                                    <button type="submit" class="btn cart-btn checkout-btn">Proceed to Checkout</button>
                                </form>
                                <div class="text-center mt-4">
                                    <a href="customer_services.jsp" class="btn cart-btn continue-btn">Choose a Different Service</a>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>
        <%@include file="/includes/footer.jsp" %>
    </body>
</html>
