<%-- 
    Document   : manager_discount
    Created on : Jun 1, 2023, 8:34:33 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <style>
            #booking {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #booking td,
            #booking th {
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
        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Discount</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->

        <!--Table Start-->
        <table style="margin-top: 20px;margin-bottom: 20px;" id="booking">
            <thead>
                <tr>
                    <th>ID Discount</th>
                    <th>Name</th>
                    <th>Value</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Status</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <c:forEach items="${sessionScope.listD}" var="l">
                <tr>
                    <td>${l.IDDiscount}</td>
                    <td>${l.getDiscountName()}</td>
                    <td>${l.getDiscountValue()}</td>
                    <td>${l.getStartDay()}</td>
                    <td>${l.getEndDay()}</td>
                    <td>${l.getNote()}</td>
                    <td><a href="edit?IDDiscount=${l.getIDDiscount()}">Edit</a> | <a href="delete?IDDiscount=${l.getIDDiscount()}">Delete</a></td>
                </tr>
            </c:forEach>

        </table>
        <!--Table End-->

        <!--================FORM ADD NEW DISCOUNT =================-->

        <h1 style="text-align: center;">ADD NEW DISCOUNT</h1>

        <form action="addNewDiscount" class="col-md-9 m-auto" method="get" role="form">
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">ID</label><br>
                    <label for="inputname">Auto Generate</label>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Discount Name</label>
                    <input type="text" class="form-control mt-1" id="DiscountName" name="DiscountName" placeholder="Discount Name" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Discount Value</label>
                    <input type="text" class="form-control mt-1" id="DiscountValue" name="DiscountValue" placeholder="DiscountValue" required>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Note</label>
                    <input type="text" class="form-control mt-1" id="Note" name="Note" placeholder="Note" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker11'>
                            <input type='text' class="form-control" name="StartDay" placeholder="Start Day"/>
                            <span class="input-group-addon">
                                <i class="fa fa-calendar" aria-hidden="true"></i>
                            </span>
                        </div>
                    </div>
                </div>                    
                <div class="form-group col-md-6 mb-3">
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker1' >
                            <input type='text' class="form-control" name="EndDay" placeholder="End Day"/>
                            <span class="input-group-addon">
                                <i class="fa fa-calendar" aria-hidden="true"></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col text-end mt-2">
                    <button type="submit" class="btn btn-success btn-lg px-3">Add New Discount</button>
                </div>
            </div><br>
        </form>
        <!--================FORM ADD NEW DISCOUNT =================-->

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
    </body>
</html>


