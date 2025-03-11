<%-- 
    Document   : owner_dashboard
    Created on : May 30, 2023, 11:27:29 AM
    Author     : TuaSan
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DASHMIN GOLDENHOTEL</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="image/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/owner_bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/owner_style.css" rel="stylesheet">

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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Static</h2>
                    <ol class="breadcrumb">
                        <li>ADMIN</li>
                        <li class="active">Static</li>
                    </ol>
                </div>
            </div>
        </section>
        <div class="content">
            <!-- Sale & Revenue Start -->
            <div class="pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">User</p>
                                <h6 class="mb-0">${requestScope.numberOfUser}</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-bar fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Booking</p>
                                <h6 class="mb-0">${requestScope.numberBooking}</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-area fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Today Revenue</p>
                                <h6 class="mb-0">${requestScope.todayRevenue}$</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Revenue</p>
                                <h6 class="mb-0">${requestScope.totalRevenue}$</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <!--<div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Best Booking</p>
                                <h6 class="mb-0">${requestScope.topNameRoomType}</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Employee</p>
                                <h6 class="mb-0">${requestScope.numberOfEmployee}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
            <!-- Sale & Revenue End -->
            <div class="container">
                <h2>Monthly Revenue Chart</h2>
                <canvas id="revenueChart"></canvas>
            </div>



            <!-- Recent Sales Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col">Date</th>
                                    <th scope="col">Number Booking</th>
                                    <th scope="col">Total Room</th>
                                    <th scope="col">Total Price</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.listBookingByDate}" var="listBookingByDate">
                                    <tr>
                                        <td>${listBookingByDate.getDateTop5()}</td>
                                        <td>${listBookingByDate.getNumberOfBooking()}</td>
                                        <td>${listBookingByDate.getTotalOfRoom()}</td>
                                        <td>${listBookingByDate.getTotalPrice()}$</td>
                                        <td>Paid</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Recent Sales End -->

            <!-- Sales Chart Start -->
            <!--                <div class="container-fluid pt-4 px-4">
                                <div class="row g-4">
                                    <div class="col-sm-12 col-xl-6">
                                        <div class="bg-light text-center rounded p-4">
                                            <div class="d-flex align-items-center justify-content-between mb-4">
                                                <h6 class="mb-0">Worldwide Sales</h6>
                                                <a href="">Show All</a>
                                            </div>
                                            <canvas id="worldwide-sales"></canvas>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-xl-6">
                                        <div class="bg-light text-center rounded p-4">
                                            <div class="d-flex align-items-center justify-content-between mb-4">
                                                <h6 class="mb-0">Salse & Revenue</h6>
                                                <a href="">Show All</a>
                                            </div>
                                            <canvas id="salse-revenue"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>-->
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/owner_main.js"></script>
        <script>
        document.addEventListener("DOMContentLoaded", function() {
            fetch('${pageContext.request.contextPath}/revenueData')
                .then(response => response.json())
                .then(data => {
                    // Ensure correct labels for 12 months
                    const labels = ['Month 1', 'Month 2', 'Month 3', 'Month 4', 'Month 5', 'Month 6', 'Month 7', 'Month 8', 'Month 9', 'Month 10', 'Month 11', 'Month 12'];
                    const revenues = new Array(12).fill(0);

                    // Fill the revenues array with data
                    data.forEach(item => {
                        const monthIndex = item.month - 1;
                        revenues[monthIndex] = item.revenue;
                    });

                    const ctx = document.getElementById('revenueChart').getContext('2d');
                    new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Revenue',
                                data: revenues,
                                borderColor: 'rgba(75, 192, 192, 1)',
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                fill: true
                            }]
                        },
                        options: {
                            responsive: true,
                            scales: {
                                x: {
                                    beginAtZero: true
                                },
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                });
        });
    </script>
    </body>

</html>
