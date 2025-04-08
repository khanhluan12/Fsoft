<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Service" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Service Management</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="vendors/linericon/style.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">
   <style>
    /* Cải thiện kiểu dáng bảng */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        color: #333;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    td a {
        color: #007bff;
        text-decoration: none;
    }

    td a:hover {
        text-decoration: underline;
    }

    .table-container {
        margin: 20px auto;
        max-width: 1000px;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* Thêm kiểu cho tiêu đề bảng */
    .table-title {
        font-size: 24px;
        color: #333;
        font-weight: bold;
        margin-bottom: 20px;
    }

    /* Cải thiện kiểu dáng các trang */
    .page-number {
        transition: all 0.2s ease-in-out;
        cursor: pointer;
    }

    .page-number:hover {
        color: #007bff;
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
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Booking</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Services</li>
                    </ol>
                </div>
            </div>
        </section>
     <div class="table-container">
        <h1 class="table-title">List of Services</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Service Name</th>
                <th>Action</th>
            </tr>
            <c:forEach var="service" items="${services}">
                <tr>
                    <td>${service.serviceID}</td>
                    <td>${service.serviceName}</td>
                    <td><a href="ServiceDetailServlet?id=${service.serviceID}">View Details</a></td>
                </tr>
            </c:forEach>
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
