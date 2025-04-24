<%-- 
    Document   : roomDetail
    Created on : Jun 18, 2024, 10:18:38 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>TROPICAL Hotel</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css">


        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <!-- main css -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .containerfb {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                background-color: #ffffff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                margin-top: 50px;
            }

            h1 {
                text-align: center;
                margin-bottom: 30px;
                color: #007bff;
            }

            .rating {
                direction: rtl;
                unicode-bidi: bidi-override;
                text-align: center;
                margin-bottom: 20px;
            }

            .rating input {
                display: none;
            }

            .rating label {
                display: inline-block;
                padding: 10px;
                font-size: 24px;
                color: #dcdcdc;
                cursor: pointer;
            }

            .rating label:before {
                content: '\2605';
            }

            .rating input:checked ~ label,
            .rating input:checked ~ label ~ label {
                color: #ffc107;
            }

            .mb-3 {
                margin-bottom: 20px;
            }

            .form-label {
                font-weight: bold;
                color: #007bff;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0069d9;
                border-color: #0062cc;
            }

            .comments {
                margin-top: 20px;
            }

            .comment {
                align-items: flex-start;
                margin-bottom: 10px;
            }

            .comment-avatar {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                overflow: hidden;
                margin-right: 10px;
            }

            .comment-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .comment-content {
                flex-grow: 1;
                border: 1px solid #ccc;
                padding: 10px;
                border-radius: 5px;
                display: flex;
            }

            .comment-name {
                font-weight: bold;
                margin-bottom: 5px;
            }

            .comment-rating {
                margin-bottom: 5px;
            }

            .comment-text {
                margin-bottom: 0;
            }

            .comment-reply {
                display: flex;
                margin-top: 10px;
                padding-left: 70px;
            }

            .comment-reply-content {
                background-color: #f5f5f5;
                padding: 15px;
                border-radius: 15px;
                width: 380px;
            }

            .comment-reply-content .comment-name {
                font-weight: bold;
                margin-bottom: 5px;
            }

            .reply-text {
                margin: 0;
            }
.back{
            color: #000;
            background-color: #FEA116;
            border-color: #FEA116;
            }
            .back:hover{
            background-color: #e36b0a;
            border-color: #d95e08;
            }
        </style>
    </head>
    <body>
        <%@include file="/includes/header.jsp" %>
        <div class="container mt-5">
            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">Room Detail: ${ room.getNameRoomType() }</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 d-flex align-items-center justify-content-center">
                            <img src="images/${ room.getImage() }" class="img-fluid rounded" alt="${ room.getNameRoomType() }">
                        </div>
                        <div class="col-md-6">
                            <ul class="list-group list-group-flush">
                               
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong>Max Persons:</strong>
                                    <span>${ room.getMaxPerson() }</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong>Number of Beds:</strong>
                                    <span>${ room.getNumberOfBed() }</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong>Number of Baths:</strong>
                                    <span>${ room.getNumberOfBath() }</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong>Price:</strong>
                                    <span>$${ room.getPrice() }</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong>Total Rooms:</strong>
                                    <span>${ room.getTotalRoom() }</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong>Room Status:</strong>
                                    <span>${ room.getRoomStatus() }</span>
                                </li>
                                <li class="list-group-item">
                                    <strong>Content:</strong>
                                    <p class="mb-0">${ room.getContent() }</p>
                                </li>
                            </ul>
                        </div>
                                <div><button class="back" onclick="window.history.back()">Back</button></div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Add the following CSS to enhance the appearance -->
        <style>
            .card {
                border-radius: 15px;
                overflow: hidden;
            }
            .card-header {
                padding: 1rem 1.5rem;
            }
            .card-body {
                padding: 1.5rem;
            }
            .list-group-item {
                border: none;
                padding: 0.75rem 1.25rem;
            }
            .list-group-item strong {
                font-weight: 600;
            }
            .list-group-item p {
                margin: 0;
            }
        </style>

        <%@include file="/includes/footer.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
