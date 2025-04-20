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
        <link rel="stylesheet" href="css/room_bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
    </head>

    <body>
        <h1 style="text-align: center;">Add New Room Type</h1>

        <form action="addNewRoomType" class="col-md-9 m-auto" method="POST" role="form" enctype="multipart/form-data">
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="roomImage">Image</label><br>
                    <input type="file" id="roomImage" name="image" accept="image/*" onchange="validateImage(this)" required>
                    <img id="previewImage" src="#" alt="Image Preview" style="max-height: 150px; display:none; margin-top: 10px;">
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="MaxPerson">Max Person</label>
                    <input type="number" class="form-control mt-1" id="MaxPerson" name="MaxPerson" placeholder="Max Person" required min="1" max="6">
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="NameRoomType">Room Type Name</label>
                    <input type="text" class="form-control mt-1" id="NameRoomType" name="NameRoomType" placeholder="Enter Room Type Name" required>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="NumberOfBed">Bed</label>
                    <input type="number" class="form-control mt-1" id="NumberOfBed" name="NumberOfBed" placeholder="Number of Beds" required min="1" max="3">
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="NumberOfBath">Bath</label>
                    <input type="text" class="form-control mt-1" id="NumberOfBath" name="NumberOfBath" placeholder="Number of Baths" required>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="Price">Price</label>
                    <input type="number" class="form-control mt-1" id="Price" name="Price" placeholder="Price" required min="0" step="any">
                </div>                    
                <div class="form-group col-md-6 mb-3">
                    <label for="TotalRoom">Total Room</label>
                    <input type="number" class="form-control mt-1" id="TotalRoom" name="TotalRoom" placeholder="Total Room" required min="1">
                </div>
            </div>

            <div class="mb-3">
                <label for="Content">Content</label>
                <textarea class="form-control mt-1" id="Content" name="Content" required placeholder="Message" rows="8"></textarea>
            </div>

            <div class="row">
                <div class="col text-end mt-2">
                    <button type="submit" class="btn btn-success btn-lg px-3">Add New Room Type</button>
                </div>
            </div>
        </form>

        <!-- JS validate preview + số -->
        <script>
            function validateImage(input) {
                const file = input.files[0];
                const preview = document.getElementById('previewImage');

                if (file) {
                    if (!file.type.startsWith('image/')) {
                        alert("Chỉ được chọn file hình ảnh thôi nha!");
                        input.value = '';
                        preview.style.display = 'none';
                        preview.src = '#';
                        return;
                    }

                    const reader = new FileReader();
                    reader.onload = function (e) {
                        preview.src = e.target.result;
                        preview.style.display = 'block';
                    };
                    reader.readAsDataURL(file);
                } else {
                    preview.style.display = 'none';
                    preview.src = '#';
                }
            }

            document.querySelector("form").addEventListener("submit", function (e) {
                const price = document.getElementById("Price").value;
                const totalRoom = document.getElementById("TotalRoom").value;

                if (isNaN(price) || price <= 0) {
                    alert("Giá tiền phải là số và lớn hơn 0 nha!");
                    e.preventDefault();
                }

                if (isNaN(totalRoom) || totalRoom < 1) {
                    alert("Tổng số phòng phải là số nguyên dương!");
                    e.preventDefault();
                }
            });
        </script>
    </body>
</html>
