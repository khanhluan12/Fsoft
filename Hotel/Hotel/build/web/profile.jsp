<%-- 
    Document   : form_payment
    Created on : Jun 8, 2023, 9:20:49 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link rel="stylesheet" type="text/css" href="css/styleServicePlus.css">    <%-- Style for Service Order History section --%>
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
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
        <div class="container">
            <c:if test="${not empty cancelMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Success!</strong> ${cancelMessage}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </c:if>

            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Error!</strong> ${errorMessage}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </c:if>
        </div>
        <!--================Breadcrumb Area =================-->
        <br>
        <h2 style="color: green; text-align: center;" >${editProfile} </h2>

        <form action="editProfile" method="get">

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
                            <select name="Gender" class="form-control rounded-pill" required>
                                <option value="">--Select--</option>
                                <option value="Male" ${userA.getGender() == 'Male' ? 'selected' : ''}>Male</option>
                                <option value="Female" ${userA.getGender() == 'Female' ? 'selected' : ''}>Female</option>
                                <option value="Other" ${userA.getGender() == 'Other' ? 'selected' : ''}>Other</option>
                            </select>
                        </div>
                    </div>
                            </div>
                           
                    <div class="row mt-3 d-none">
                        <input type="text" name="UserName" value="${userA.getUserName()}">
                        <input type="text" name="Pass" value="${userA.getPass()}">
                    </div>
                            <div class="text-center mt-4">
                        <button class="btn btn-primary" type="submit">Save Profile</button>
                    </div>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <div class="p-3 py-5">
                            <h4>Booking Detail history</h4>
                            <table id="bookingTable" border="1" width="1" cellspacing="1" cellpadding="1" class="w-100 text-center">
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
                                    <c:forEach var="bookingDetail" items="${BookingDetails}">
                                        <tr>
                                            <td>${bookingDetail.getAdult()}</td>
                                            <td>${bookingDetail.getChild()}</td>
                                            <td>${bookingDetail.getCheckIn()}</td>
                                            <td>${bookingDetail.getCheckOut()}</td>
                                            <td>${bookingDetail.getNameRoomType()}</td>
                                            <td>
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
                            <div id="bookingPagination" class="pagination-controls text-center my-3"></div>
                        </div>

                    </div>
                    <div class="p-3 py-5">
                        <h4>Service Order History</h4>
                        <table id="serviceTable" border="1" width="1" cellspacing="1" cellpadding="1" class="w-100 text-center">
                            <thead>
                                <tr>
                                    <th>Service Name</th>
                                    <th>Quantity</th>
                                    <th>Total Price</th>
                                    <th>Order Date</th>

                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${serviceOrders}" var="order">
                                    <tr>
                                        <td>${order.serviceName}</td>
                                        <td>${order.quantity}</td>
                                        <td>
                                            <fmt:formatNumber type="number" value="${order.totalPrice}" pattern="#,###"/> đ <%-- Formatted price number --%>
                                        </td>
                                        <td>${order.orderDate.substring(0,16)}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${order.status == 'Completed'}">
                                                    <p class="text-success">Completed</p>
                                                </c:when>
                                                <c:when test="${order.status == 'Cancelled'}">
                                                    <p class="text-danger">Cancelled</p>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty serviceOrders}">
                                    <tr>
                                        <td colspan="6" class="text-center">No service orders found</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                        <div id="servicePagination" class="pagination-controls text-center my-3"></div>
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
                                                            function confirmCancel(bookingId) {
                                                                var contactInfo = prompt("Please enter your contact information for cancellation:");
                                                                if (contactInfo != null) {
                                                                    if (confirm("Are you sure you want to cancel this booking?")) {
                                                                        window.location.href = './CancelBooking?bookingId=' + bookingId + '&contactInfo=' + encodeURIComponent(contactInfo);
                                                                    }
                                                                }
                                                            }
        </script>
        <script>
function paginateTable(tableId, paginationId, rowsPerPage = 4) {
    const table = document.getElementById(tableId);
    const tbody = table.querySelector("tbody");
    const rows = Array.from(tbody.querySelectorAll("tr"));
    const totalPages = Math.ceil(rows.length / rowsPerPage);
    const pagination = document.getElementById(paginationId);

    let currentPage = 1;

    function showPage(page) {
        currentPage = page;
        const start = (page - 1) * rowsPerPage;
        const end = start + rowsPerPage;
        rows.forEach((row, i) => {
            row.style.display = i >= start && i < end ? "" : "none";
        });

        // Render pagination
        pagination.innerHTML = '';

        // "Previous" button
        const prevBtn = document.createElement('button');
        prevBtn.textContent = "<";
        prevBtn.className = 'btn btn-sm mx-1 ' + (page === 1 ? 'btn-secondary' : 'btn-outline-primary');
        prevBtn.onclick = () => page > 1 && showPage(page - 1);
        pagination.appendChild(prevBtn);

        // Calculate page range
        const pagesToShow = [];
        const maxPagesAround = 2; // Số trang tối đa hiển thị quanh trang hiện tại

        // Hiển thị các trang đầu tiên
        pagesToShow.push(1);

        // Hiển thị dấu ... nếu cần
        if (page - maxPagesAround > 2) {
            pagesToShow.push('...');
        }

        // Các trang quanh trang hiện tại
        for (let i = Math.max(2, page - maxPagesAround); i <= Math.min(page + maxPagesAround, totalPages - 1); i++) {
            pagesToShow.push(i);
        }

        // Hiển thị dấu ... nếu cần
        if (page + maxPagesAround < totalPages - 1) {
            pagesToShow.push('...');
        }

        // Hiển thị trang cuối cùng
        if (totalPages > 1) {
            pagesToShow.push(totalPages);
        }

        // Thêm các nút trang vào phân trang
        pagesToShow.forEach(item => {
            const btn = document.createElement('button');
            if (item === '...') {
                btn.textContent = '...';
                btn.disabled = true;
            } else {
                btn.textContent = item;
                btn.className = 'btn btn-sm mx-1 ' + (item === page ? 'btn-primary' : 'btn-outline-primary');
                btn.onclick = () => showPage(item);
            }
            pagination.appendChild(btn);
        });

        // "Next" button
        const nextBtn = document.createElement('button');
        nextBtn.textContent = ">";
        nextBtn.className = 'btn btn-sm mx-1 ' + (page === totalPages ? 'btn-secondary' : 'btn-outline-primary');
        nextBtn.onclick = () => page < totalPages && showPage(page + 1);
        pagination.appendChild(nextBtn);
    }

    showPage(1);
}

// On load
window.onload = function () {
    paginateTable("bookingTable", "bookingPagination", 4);
    paginateTable("serviceTable", "servicePagination", 4);
}


        </script>
        <script>function confirmCancel(bookingId) {
                // Create modal if it doesn't exist
                if (!document.getElementById('cancelModal')) {
                    var modalHtml = `
            <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="cancelModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="cancelModalLabel">Confirm Booking Cancellation</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to cancel this booking?</p>
                            <div class="form-group">
                                <label for="contactPhone">Please provide your contact phone number:</label>
                               <input type="text" class="form-control" id="Phone" name="Phone" 
       placeholder="Enter customer phone number" 
       maxlength="10"
       oninput="this.value = this.value.replace(/[^0-9]/g, '')"
       required>

                                <small class="form-text text-muted">Our receptionist may contact you regarding your cancellation.</small>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No, Keep Booking</button>
                            <button type="button" class="btn btn-danger" id="confirmCancelBtn">Yes, Cancel Booking</button>
                        </div>
                    </div>
                </div>
            </div>
        `;

                    // Append modal to body
                    var modalDiv = document.createElement('div');
                    modalDiv.innerHTML = modalHtml;
                    document.body.appendChild(modalDiv);

                    // Add event listener to the confirm button
                    document.getElementById('confirmCancelBtn').addEventListener('click', function () {
                        var contactPhone = document.getElementById('contactPhone').value;
                        if (!contactPhone || contactPhone.trim() === '') {
                            alert('Please enter your contact phone number');
                            return;
                        }

                        // Hide modal
                        $('#cancelModal').modal('hide');

                        // Redirect to cancel booking servlet
                        window.location.href = './CancelBooking?bookingId=' + window.currentBookingId + '&contactInfo=' + encodeURIComponent(contactPhone);
                    });
                }
                // Set current booking ID
                window.currentBookingId = bookingId;

                // Show modal
                $('#cancelModal').modal('show');
            }
                    
        </script>
    </body>
</html>
