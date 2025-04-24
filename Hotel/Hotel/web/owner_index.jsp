
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
            #yearSelect{
                width: 150px;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                text-align-last: center;
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
                                <p class="mb-2">Total Booking Room</p>
                                <h6 class="mb-0">${requestScope.numberBooking}</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-area fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Today Revenue</p>
                                <h6 class="mb-0">${requestScope.todayRevenue}VND</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Revenue</p>
                                <h6 class="mb-0">${requestScope.totalRevenue}VND</h6>
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
         <div class="container mt-5">
    <div class="row">
 <div class="mb-3 text-center">
   <select id="yearSelect" class="form-select mx-auto">
    <option value="" disabled selected>Select Year</option>
</select>

</div>

        <div class="col-md-6 ">
            <h4>Monthly Revenue Chart</h4>
               
            <canvas id="revenueChart" height="250"></canvas>
        </div>


        <div class="col-md-6 ">
            <h4>All Type Booking Statistics</h4>
            <div style="max-width: 100%; height: auto;">
                <canvas id="roomTypePieChart" style="max-width: 100%; height: 250px;"></canvas>
            </div>
        </div>
    </div>
</div>




            <!-- Recent Sales Start -->
<!--            <div class="container-fluid pt-4 px-4">
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
          -->
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
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>

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
document.addEventListener("DOMContentLoaded", function () {
    const currentYear = new Date().getFullYear();
    const yearSelect = document.getElementById('yearSelect');


    for (let y = currentYear; y >= 2020; y--) {
        let option = document.createElement("option");
        option.value = y;
        option.text = y;
        yearSelect.appendChild(option);
    }

    // Load dữ liệu mặc định theo năm hiện tại
     loadCharts(currentYear);
    // Gọi lại dữ liệu khi đổi năm
     yearSelect.addEventListener("change", function () {
        const selectedYear = this.value;
        loadCharts(selectedYear);
    });

    function loadCharts(year) {
        loadRevenueData(year);
        loadRoomTypePieChart(year);
    }
   let revenueChartInstance = null;
    let pieChartInstance = null;
    
    function loadRevenueData(year) {
        fetch('${pageContext.request.contextPath}/revenueData?year=' + year)
            .then(response => response.json())
            .then(data => {
                const labels = ['Month 1', 'Month 2', 'Month 3', 'Month 4', 'Month 5', 'Month 6',
                                'Month 7', 'Month 8', 'Month 9', 'Month 10', 'Month 11', 'Month 12'];
                const revenues = new Array(12).fill(0);
                data.forEach(item => {
                    const monthIndex = item.month - 1;
                    revenues[monthIndex] = item.revenue;
                });

                // Nếu chart đã tồn tại thì cập nhật lại, không tạo mới
                if (window.revenueChartInstance) {
                    window.revenueChartInstance.data.datasets[0].data = revenues;
                    window.revenueChartInstance.update();
                } else {
                    const ctx = document.getElementById('revenueChart').getContext('2d');
                    window.revenueChartInstance = new Chart(ctx, {
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
                }
            });
    }
});
function loadRoomTypePieChart(year) {
    fetch('${pageContext.request.contextPath}/roomTypeStats?year=' + year)
        .then(response => response.json())
        .then(data => {
            const labels = Object.keys(data);
            const values = Object.values(data);

            if (window.pieChartInstance) {
                // Nếu chart đã có => cập nhật lại data
                window.pieChartInstance.data.labels = labels;
                window.pieChartInstance.data.datasets[0].data = values;
                window.pieChartInstance.update();
            } else {
                // Nếu chưa có => tạo mới
                const ctx = document.getElementById('roomTypePieChart').getContext('2d');
                window.pieChartInstance = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: labels,
                        datasets: [{
                            data: values,
                            backgroundColor: [
                                '#FF6384', '#36A2EB', '#FFCE56', '#76FF03',
                                '#8E24AA', '#00BCD4', '#FF5722', '#9C27B0',
                                '#8BC34A', '#FFC107'
                            ]
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'right'
                            },
                            datalabels: {
                                formatter: function (value, ctx) {
                                    let sum = 0;
                                    let dataArr = ctx.chart.data.datasets[0].data;
                                    dataArr.map(function (currentValue) {
                                        sum += currentValue;
                                    });
                                    let percentage = (value * 100 / sum).toFixed(2) + '%';
                                    return percentage;
                                },
                                color: '#fff',
                                font: {
                                    weight: 'bold',
                                    size: 12
                                }
                            }
                        }
                    }
                });
            }
        });
}

    </script>


    </body>

</html>
