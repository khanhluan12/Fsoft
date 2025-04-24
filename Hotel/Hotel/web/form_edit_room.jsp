<%-- 
    Document   : form_edit_room
    Created on : Jun 6, 2023, 9:45:30 PM
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
        <link rel="stylesheet" href="css/room_bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">

    </head>
    <body>
        <%@include file="/includes/manager_header.jsp" %>
        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Edit Room</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->
        <br>

        <h1 style="text-align: center;">Edit Room Type Information</h1>

        <form action="editRoomType" class="col-md-9 m-auto" method="post" role="form" enctype="multipart/form-data">
            <div class="row">
                <div class="form-group col-md-12 mb-3">
                    <label for="inputname">Image</label><br>
                    <input type="file" accept="image/*" name="image" >
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">ID</label><br>
                    <label for="inputname">${room.getIDRoomType()}</label>
                    <input type="hidden" name="IDRoomType" value="${room.getIDRoomType()}">

                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Room Type Name</label>
                    <input type="text" class="form-control mt-1" id="NameRoomType" name="NameRoomType" placeholder="Name" required value="${room.getNameRoomType()}">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Bed</label>
                    <input type="number" class="form-control mt-1" id="NumberOfBed" name="NumberOfBed" placeholder="NumberOfBed" required value="${room.getNumberOfBed()}">
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Bath</label>
                    <input type="number" class="form-control mt-1" id="NumberOfBath" name="NumberOfBath" placeholder="NumberOfBath" required value="${room.getNumberOfBath()}">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="inputname">Price</label>
                    <input type="number" class="form-control mt-1" id="Price" name="Price" placeholder="Price" required value="${room.getPrice()}">
                </div>                    
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Total Room</label>
                    <input type="number" class="form-control mt-1" id="TotalRoom" name="TotalRoom" placeholder="TotalRoom" required value="${room.getTotalRoom()}">
                </div>
            </div>

            <div class="mb-3">
                <label for="inputmessage">Content</label>
                <textarea class="form-control mt-1" id="Note" name="Content" required placeholder="Message" rows="8">${room.getContent()}</textarea>
            </div>
            <div class="row">
                <div class="col text-end mt-2">
                    <button type="submit" class="btn btn-success btn-lg px-3">Edit Room</button>
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
    </body>
</html>
