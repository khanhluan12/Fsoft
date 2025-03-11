<%-- 
    Document   : manager_room
    Created on : Jun 1, 2023, 2:44:00 PM
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
                    <h2 class="page-cover-tittle">Rooms</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->

        <!--================Database (Khi nao co database thi dung)=================-->  

        <section class="accomodation_area section_gap">
            <div class="container">

                <div class="row g-4">
                    <c:forEach items="${sessionScope.listR}" var="room">

                        <div class="col-lg-4 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="room-item shadow rounded overflow-hidden">
                                <div class="position-relative">
                                    <img class="img-fluid" src="images/${room.getImage()}" alt="">
                                    <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">${room.getPrice()}$/Night</small>
                                </div>
                                <div class="p-4 mt-2">
                                    <div class="d-flex justify-content-between mb-3">
                                        <h5 class="mb-0">${room.getNameRoomType()}</h5>
                                        <div class="ps-2">
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                        </div>
                                    </div>
                                    <div class="d-flex mb-3">
                                        <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>${room.getNumberOfBed()} Bed</small>
                                        <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>${room.getNumberOfBath()} Bath</small>
                                        <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                    </div>
                                    <p class="text-body mb-3">${room.getContent()}</p>
                                    <div class="d-flex justify-content-between">
                                        <a class="btn btn-sm btn-primary rounded py-2 px-4" href="loadRoomToEdit?IDRoomType=${room.getIDRoomType()}">Edit</a>
                                        <a class="btn btn-sm btn-dark rounded py-2 px-4" href="delete?IDRoomType=${room.getIDRoomType()}">Delete</a>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </c:forEach> 
                </div>
            </div>
        </section>
        <!--================Database =================-->


        <!--================FORM ADD NEW ROOM TYPE =================-->

        <h1 style="text-align: center;">Add New Room Type</h1>

        <form action="addNewRoomType" class="col-md-9 m-auto" method="POST" role="form" enctype="multipart/form-data">
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Image</label><br>
                    <input type="file" accept="image/*" name="image" required/>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Max Person</label>
                    <input type="text" class="form-control mt-1" id="MaxPerson" name="MaxPerson" placeholder="Max Person" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">ID</label><br>
                    <label for="inputname">Auto Generate</label>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Room Type Name</label>
                    <input type="text" class="form-control mt-1" id="NameRoomType" name="NameRoomType" placeholder="Name" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Bed</label>
                    <input type="text" class="form-control mt-1" id="NumberOfBed" name="NumberOfBed" placeholder="NumberOfBed" required>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Bath</label>
                    <input type="text" class="form-control mt-1" id="NumberOfBath" name="NumberOfBath" placeholder="NumberOfBath" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="inputname">Price</label>
                    <input type="text" class="form-control mt-1" id="Content" name="Price" placeholder="Price" required>
                </div>                    
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Total Room</label>
                    <input type="text" class="form-control mt-1" id="TotalRoom" name="TotalRoom" placeholder="TotalRoom" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="inputmessage">Content</label>
                <textarea class="form-control mt-1" id="Content" name="Content" required placeholder="Message" rows="8"></textarea>
            </div>
            <div class="row">
                <div class="col text-end mt-2">
                    <button type="submit" class="btn btn-success btn-lg px-3">Add New Room Type</button>
                </div>
            </div>
        </form>
        <!--================FORM ADD NEW ROOM TYPE =================-->

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


