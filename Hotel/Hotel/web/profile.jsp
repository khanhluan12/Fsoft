
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
        <style>
             table.booking-history {
        border-collapse: collapse;
        width: 100%;
        background-color: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    table.booking-history th,
    table.booking-history td {
        padding: 12px 15px;
        text-align: center;
    }

    table.booking-history thead {
        background-color: #007bff;
        color: #fff;
    }

    table.booking-history tbody tr {
        border-bottom: 1px solid #ddd;
    }

    table.booking-history tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    table.booking-history tbody tr:hover {
        background-color: #f1f1f1;
    }
  #pagination .page-link {
        margin: 0 3px;
        padding: 6px 12px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #pagination .page-link.active {
        background-color: #0056b3;
    }

    #pagination .page-link:hover {
        background-color: #0056b3;
    }
            .small-select {

    height: 37px;
}
    td.action-column {
        text-align: center;
        vertical-align: middle;
    }
    td.action-column p {
        margin: 0; 
        vertical-align: middle; 
    }


</style>

    </head>
    <body>
        <c:if test="${sessionScope.userA.IDRole == 1}">
            <%@include file="/includes/header.jsp" %>
        </c:if>
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
                    <h2 class="page-cover-tittle">My Profile</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Profile</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->
        <br>
        <h2 style="color: green; text-align: center;" >${editProfile} </h2>

        <form action="editProfile" method="get" onsubmit="return validateForm()">

            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <!--                    <div class="col-md-2 border-right">
                                            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">${userA.getFullName()}</span><span class="text-black-50"></span><span> </span></div>
                                        </div>-->
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-12"><input type="hidden" name="IDAccount" class="form-control"  value="${userA.getIDAccount()}"></div>
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <input type="text" name="FullName" class="form-control" required
                                           value="${userA.getFullName()}" pattern="[A-Za-zÀ-ỹ\s]{2,}"
                                           title="Tên phải có ít nhất 2 ký tự và chỉ chứa chữ cái.">
                                </div>
                                <div class="form-group">
                                    <label>Phone Number</label>
                                    <input type="tel" name="Phone" class="form-control" required
                                           value="${userA.getPhone()}" pattern="0[0-9]{9}"
                                           title="Số điện thoại phải có 10 số và bắt đầu bằng số 0.">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" name="Email" class="form-control" required value="${userA.getEmail()}">
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>City</label>
                                        <input type="text" name="City" class="form-control" required value="${userA.getCity()}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Gender</label>
                                        <select name="Gender" class="form-control small-select"  required>
                                            <option value="">--Select--</option>
                                            <option value="Male" ${userA.getGender() == 'Male' ? 'selected' : ''}>Male</option>
                                            <option value="Female" ${userA.getGender() == 'Female' ? 'selected' : ''}>Female</option>
                                            <option value="Other" ${userA.getGender() == 'Other' ? 'selected' : ''}>Other</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3 d-none">
                                <div class="col-md-12"><label class="labels">UserName</label><input type="text" name="UserName" class="form-control" value="${userA.getUserName()}"></div>                            
                                <div class="col-md-12"><label class="labels">Password</label><input type="text" name="Pass" class="form-control"  value="${userA.getPass()}"></div>
                            </div>
                            <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <div class="p-3 py-5">
                            <h4>Booking Detail history</h4>
                            <table id="bookingTable" class="booking-history" >
                                <thead>
                                    <tr>
                                        <th>Adult</th>
                                        <th>Child</th>
                                        <th>Checkin</th>
                                        <th>Checkout</th>
                                        <th>Room Type</th> 
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="bookingDetail" items="${BookingDetails}" varStatus="loop">
                                        <tr class="book-row">
                                            <td>${bookingDetail.getAdult()}</td>
                                            <td>${bookingDetail.getChild()}</td>
                                            <td>${bookingDetail.getCheckIn()}</td>
                                            <td>${bookingDetail.getCheckOut()}</td>
                                            <td>${bookingDetail.getNameRoomType()}</td> 
                                            <td  class="action-column">
                                                <c:choose>
                                                    <c:when test="${bookingDetail.note == 'Success'}">
                                                        <p class="text-success">Success</p>
                                                    </c:when>
                                                    <c:when test="${bookingDetail.note == 'Cancelled'}">
                                                        <p class="text-danger">Cancelled</p>
                                                    </c:when>
                                                    <c:when test="${bookingDetail.isOver()}">
                                                        <p class="text-info">This booking is overdue</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="#" onclick="confirmCancel('${bookingDetail.getIDBooking()}')">Cancel</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
<div id="pagination" class="text-center mt-3"></div>

                        </div>
                    </div>
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

        <script>
                                function confirmCancel(bookingId) {
                                    var contactInfo = prompt("Please enter your contact information for cancellation:");
                                    if (contactInfo != null) {
                                        if (confirm("Are you sure you want to cancel this booking?")) {
                                            window.location.href = './CancelBooking?bookingId=' + bookingId + '&contactInfo=' + encodeURIComponent(contactInfo);
                                        }
                                    }
                                }
                                function validateForm() {
                                    const phone = document.querySelector('input[name="Phone"]').value;
                                    const fullName = document.querySelector('input[name="FullName"]').value;

                                    if (fullName.trim().length < 2) {
                                        alert("Tên phải có ít nhất 2 ký tự.");
                                        return false;
                                    }

                                    const phonePattern = /^0\d{9}$/;
                                    if (!phonePattern.test(phone)) {
                                        alert("Số điện thoại phải có 10 số và bắt đầu bằng số 0.");
                                        return false;
                                    }

                                    return true;
                                }
        </script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const rowsPerPage = 5; 
    const rows = document.querySelectorAll(".book-row");
    const totalRows = rows.length;
    const totalPages = Math.ceil(totalRows / rowsPerPage);
    let currentPage = 1;

    function showPage(page) {
        let start = (page - 1) * rowsPerPage;
        let end = start + rowsPerPage;

        rows.forEach((row, index) => {
            row.style.display = (index >= start && index < end) ? "table-row" : "none";
        });

        document.querySelectorAll(".page-number").forEach(button => {
            button.classList.remove("active");
            if (parseInt(button.dataset.page) === page) {
                button.classList.add("active");
            }
        });

      
    }

    function setupPagination() {
        let pagination = document.getElementById("pagination");
        pagination.innerHTML = "";

        if (totalPages > 1) {
            for (let i = 1; i <= totalPages; i++) {
                let btn = document.createElement("span"); 
btn.style.cursor = "pointer";
                btn.innerText = i;
                btn.className = "page-number btn btn-outline-primary mx-1";
                btn.dataset.page = i;
                btn.addEventListener("click", function() {
                    currentPage = parseInt(this.dataset.page);
                    showPage(currentPage);
                });
                pagination.appendChild(btn);
            }
        }

        showPage(currentPage);
    }
    setupPagination();
});

</script>

    </body>
</html>
