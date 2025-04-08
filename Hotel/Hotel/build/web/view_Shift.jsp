<%@ page import="java.util.List, model.ShiftSchedule" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ca Trực Của Tôi</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="vendors/linericon/style.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">
</head>
<body>
    <c:if test="${sessionScope.userA.IDRole == 2}">
        <%@include file="/includes/manager_header.jsp" %>
    </c:if>
    <c:if test="${sessionScope.userA.IDRole == 3}">
        <%@include file="/includes/receptionist_header.jsp" %>
    </c:if>
<section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Booking</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Shifts</li>
                    </ol>
                </div>
            </div>
        </section>
    <div class="container mt-4">
        <h2 class="text-center">Danh sách ca trực</h2>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Tên Ca</th>
                    <th>Bắt Đầu</th>
                    <th>Kết Thúc</th>
                    <th>Ngày</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty requestScope.shiftList}">
                        <c:forEach var="shift" items="${requestScope.shiftList}">
                            <tr>
                                <td>${shift.shiftID}</td>
                                <td>${shift.shiftName}</td>
                                <td>${shift.startTime}</td>
                                <td>${shift.endTime}</td>
                                <td>${shift.shiftDate}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="5" class="text-center">Không có ca trực nào.</td></tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <%@include file="/includes/footer.jsp" %>

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
</body>
</html>
