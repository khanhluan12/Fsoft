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
                <input type="file" id="roomImage" name="image" accept="image/*" onchange="validateImage(this)" required>
            </div>
            <div class="form-group col-md-6 mb-3">
                <label for="inputname">Max Person</label>
                <input type="number" class="form-control mt-1" id="MaxPerson" name="MaxPerson" placeholder="Max Person" required min="1" max="6">
            </div>
        </div>
        <div class="row">
          
            <div class="form-group col-md-6 mb-3">
                <label for="inputname">Room Type Name</label>
               <select class="form-control mt-1" id="NameRoomType" name="NameRoomType" required onchange="suggestBed()">
        <option value="">-- Select Room Type --</option>
        <option value="VIP Single">VIP Single</option>
        <option value="VIP Double">VIP Double</option>
        <option value="Normal Single">Normal Single</option>
        <option value="Normal Double">Normal Double</option>
    </select>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-6 mb-3">
                <label for="inputname">Bed</label>
               <input type="number" class="form-control mt-1" id="NumberOfBed" name="NumberOfBed" placeholder="NumberOfBed" required min="1" max="3">
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
</script>
<script>
    function suggestBed() {
        const roomType = document.getElementById('NameRoomType').value;
        const bedInput = document.getElementById('NumberOfBed');
        const personInput = document.getElementById('MaxPerson');

        switch(roomType) {
            case 'VIP Single':
                bedInput.value = 1;
                personInput.value = 2;
                break;
            case 'VIP Double':
                bedInput.value = 2;
                personInput.value = 4;
                break;
            case 'Normal Single':
                bedInput.value = 1;
                personInput.value = 1;
                break;
            case 'Normal Double':
                bedInput.value = 2;
                personInput.value = 3;
                break;
            default:
                bedInput.value = '';
                personInput.value = '';
        }
    }
</script>
<script>
    function suggestBed() {
        const roomType = document.getElementById('NameRoomType').value;
        const bedInput = document.getElementById('NumberOfBed');

        if (roomType.includes('Single')) {
            bedInput.value = 1;
        } else if (roomType.includes('Double')) {
            bedInput.value = 2;
        } else {
            bedInput.value = '';
        }
    }
</script>
</html>