<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>
<body>
    <%@include file="/includes/header.jsp" %>

    <!--================Breadcrumb Area =================-->
    <section class="breadcrumb_area">
        <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0"></div>
        <div class="container">
            <div class="page-cover text-center">
                <h2 class="page-cover-tittle">Laundry Service</h2>
            </div>
        </div>
    </section>

    <section class="services section_gap">
        <div class="container">
            <div class="section-title text-center mb-5">
                <h1>🧺 Laundry Services</h1>
                <p class="text-muted">Clean, fast, and convenient laundry care</p>
            </div>

            <c:choose>
                <c:when test="${not empty items}">
                    <div class="row">
                        <c:forEach var="item" items="${items}">
                            <div class="col-md-4 col-sm-6 mb-4">
                                <div class="card h-100 shadow-sm">
                                    <img src="${item.imageURL}" class="card-img-top" alt="${item.itemName}" style="height: 200px; object-fit: cover;">
                                    <div class="card-body text-center">
                                        <h5 class="card-title">${item.itemName}</h5>
                                        <p class="card-text text-success font-weight-bold">${item.price}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-info text-center" role="alert">
                        No laundry services available.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <%@include file="/includes/footer.jsp" %>
</body>
</html>
