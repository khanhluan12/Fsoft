<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>TROPICAL Hotel</title>
    <link rel="icon" href="image/favicon.png" type="image/png">

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/room_bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">
</head>
<body>

<!-- Header theo role -->
<c:if test="${sessionScope.userA.IDRole == 1}">
    <%@ include file="/includes/header.jsp" %>
</c:if>
<c:if test="${sessionScope.userA.IDRole == 2}">
    <%@ include file="/includes/manager_header.jsp" %>
</c:if>
<c:if test="${sessionScope.userA.IDRole == 3}">
    <%@ include file="/includes/receptionist_header.jsp" %>
</c:if>

<!-- Breadcrumb -->
<section class="breadcrumb_area">
    <div class="overlay bg-parallax"></div>
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

<br>
<h2 style="color: green; text-align: center;">${editProfile}</h2>

<!-- Form chỉnh sửa thông tin -->
<form action="editProfile" method="get" onsubmit="return validateForm()">
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <h4 class="text-right">Profile Settings</h4>

                    <input type="hidden" name="IDAccount" value="${userA.getIDAccount()}">

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
                            <select name="Gender" class="form-control" required>
                                <option value="">--Select--</option>
                                <option value="Male" ${userA.getGender() == 'Male' ? 'selected' : ''}>Male</option>
                                <option value="Female" ${userA.getGender() == 'Female' ? 'selected' : ''}>Female</option>
                                <option value="Other" ${userA.getGender() == 'Other' ? 'selected' : ''}>Other</option>
                            </select>
                        </div>
                    </div>

                    <div class="d-none">
                        <input type="text" name="UserName" value="${userA.getUserName()}">
                        <input type="text" name="Pass" value="${userA.getPass()}">
                    </div>

                    <div class="text-center mt-4">
                        <button class="btn btn-primary" type="submit">Save Profile</button>
                    </div>
                </div>
            </div>

            <!-- Booking History -->
            <div class="col-md-7">
                <div class="p-3 py-5">
                    <h4>Booking Detail history</h4>
                    <table class="table table-bordered text-center">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Adult</th>
                            <th>Child</th>
                            <th>Checkin</th>
                            <th>Checkout</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="bookingDetail" items="${BookingDetails}">
                            <tr>
                                <td>${bookingDetail.getIDBooking()}</td>
                                <td>${bookingDetail.getAdult()}</td>
                                <td>${bookingDetail.getChild()}</td>
                                <td>${bookingDetail.getCheckIn()}</td>
                                <td>${bookingDetail.getCheckOut()}</td>
                                <td>
                                    <c:if test="${!bookingDetail.isOver()}">
                                        <c:if test="${bookingDetail.isCancel()}">
                                            <p class="text-danger">Canceled</p>
                                        </c:if>
                                        <c:if test="${!bookingDetail.isCancel()}">
                                            <a href="#" onclick="confirmCancel('${bookingDetail.getIDBooking()}')">Cancel</a>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${bookingDetail.isOver()}">
                                        <p class="text-info">This booking is overdue</p>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</form>

<%@ include file="/includes/footer.jsp" %>

<!-- JS -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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
</body>
</html>
