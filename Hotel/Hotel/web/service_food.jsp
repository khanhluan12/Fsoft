<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
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
                    <h2 class="page-cover-tittle">Food Service</h2>
                </div>
            </div>
        </section>

        <!--================ Food Service Section =================-->
        <section class="services py-5">
            <div class="container">
                <div class="section-title text-center mb-5">
                    <h1>Food & Drink Menu</h1>
                    <p class="text-muted">Delicious meals and refreshing drinks served fresh</p>
                </div>
                <c:choose>
                    <c:when test="${not empty items}">
                        <div class="row">
                            <c:forEach var="item" items="${items}">
                                <div class="col-md-4 col-sm-6 align-items-stretch mb-4">
                                    <a href="ServicesItemDetailServlet?itemID=${item.itemID}" class="stretched-link">
                                        <div class="food-card position-relative w-100 shadow-sm"
                                             style="height: 300px; border-radius: 15px; overflow: hidden; cursor: pointer;"
                                             onclick="location.href = 'order?itemID=${item.itemID}'">
                                            <div class="food-card-bg" style="background-image: url('${item.imageURL}');"></div>
                                            <div class="food-card-overlay">
                                                <h5 class="mb-1">${item.itemName}</h5>
                                                <p class="text-success font-weight-bold">${item.price} đ</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-info text-center" role="alert">
                            No items available.
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>

        <%@include file="/includes/footer.jsp" %>
    </body>
</html>