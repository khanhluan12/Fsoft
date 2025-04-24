<%-- 
    Document   : add_room
    Created on : Mar 27, 2025, 8:40:08 AM
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
</html>