<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>TROPICAL Hotel</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="vendors/linericon/style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <!-- SweetAlert2 CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <style>
            /* Modern styling */
            .booking-container {
                max-width: 1400px;
                margin: 40px auto;
                padding: 30px;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 15px rgba(0,0,0,0.1);
                overflow: visible;
            }

            .search-section {
                background: #f8f9fa;
                padding: 20px;
                border-radius: 8px;
                margin-bottom: 30px;
            }

            .search-section h2 {
                color: #FEA116;
                margin-bottom: 15px;
                text-align: center;
            }

            .booking-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                margin-top: 20px;
                table-layout: auto;
            }

            .booking-table th {
                background-color: #FEA116;
                color: white;
                font-weight: 600;
                padding: 12px 15px;
                text-align: center;
                white-space: nowrap;
            }

            .booking-table td {
                padding: 12px 15px;
                vertical-align: middle;
                border-bottom: 1px solid #dee2e6;
                word-break: break-word;
                text-align: left;
            }

            .booking-table tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .booking-table tr:hover {
                background-color: #f1f1f1;
            }

            .status-button {
                padding: 6px 12px;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                font-weight: 500;
                min-width: 100px;
            }

            .status-button.not-yet {
                background-color: #FEA116;
                color: white;
                transition: all 0.3s;
                text-align: center;
            }

            .status-button.not-yet:hover {
                background-color: #e08c00;
            }

            .status-button.in-progress {
                background-color: #17a2b8;
                color: white;
                text-align: center;
            }

            .status-button.success {
                background-color: #28a745;
                color: white;
                text-align: center;
            }

            .status-button.cancelled {
                background-color: #dc3545;
                color: white;
                text-align: center;
            }

            .room-list {
                margin: 0;
                padding: 0;
                list-style-type: none;
                text-align: left;
            }

            .room-list li {
                margin-bottom: 4px;
                padding: 4px 0;
            }

            /* Highlight for Not Yet bookings */
            .priority-booking {
                background-color: #fff8e1 !important;
                border-left: 3px solid #FEA116;
            }

            /* Highlight for In Progress bookings */
            .in-progress-booking {
                background-color: #e7f7fa !important;
                border-left: 3px solid #17a2b8;
            }

            /* Pagination styles */
            .pagination-container {
                display: flex;
                justify-content: center;
                margin-top: 30px;
            }

            .pagination {
                display: flex;
                list-style: none;
                padding: 0;
                margin: 0;
                align-items: center;
            }

            .page-item {
                margin: 0 3px;
            }

            .page-link {
                position: relative;
                display: block;
                padding: 6px 12px;
                color: #007bff;
                background-color: #fff;
                border: 1px solid #dee2e6;
                border-radius: 4px;
                text-decoration: none;
                transition: all 0.3s;
            }

            .page-link:hover {
                color: #0056b3;
                background-color: #e9ecef;
                border-color: #dee2e6;
            }

            .page-item.active .page-link {
                z-index: 1;
                color: #fff;
                background-color: #FEA116;
                border-color: #FEA116;
            }

            .page-item.disabled .page-link {
                color: #6c757d;
                pointer-events: none;
                background-color: #fff;
                border-color: #dee2e6;
            }

            .page-arrow {
                font-size: 18px;
                padding: 5px 10px;
            }

            /* Message styles */
            .message {
                text-align: center;
                padding: 10px;
                margin: 20px auto;
                max-width: 600px;
                border-radius: 4px;
            }

            .success-message {
                background-color: #d4edda;
                color: #155724;
                border: 1px solid #c3e6cb;
            }

            .error-message {
                background-color: #f8d7da;
                color: #721c24;
                border: 1px solid #f5c6cb;
            }

            /* Form styles */
            .form-control {
                border: 1px solid #ced4da;
                border-radius: 4px;
                padding: 10px 15px;
                width: 100%;
                margin-bottom: 10px;
            }

            .btn-primary {
                background-color: #FEA116;
                border-color: #FEA116;
                padding: 10px 20px;
                font-weight: 500;
                transition: all 0.3s;
            }

            .btn-primary:hover {
                background-color: #e08c00;
                border-color: #e08c00;
            }

            /* Email truncation */
            .email-cell {
                max-width: 200px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                position: relative;
                display: inline-block;
            }

            .email-cell:hover {
                white-space: normal;
                overflow: visible;
                z-index: 10;
                background: white;
                box-shadow: 0 0 10px rgba(0,0,0,0.2);
                padding: 5px;
                border-radius: 4px;
            }

            /* Phone number - prevent line break */
            .phone-cell {
                white-space: nowrap;
            }

            /* Status dropdown */
            .status-dropdown {
                display: none;
                position: absolute;
                background-color: white;
                min-width: 120px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                border-radius: 4px;
                overflow: hidden;
            }

            .status-dropdown button {
                width: 100%;
                padding: 8px 12px;
                text-align: left;
                border: none;
                background: none;
                cursor: pointer;
            }

            .status-dropdown button:hover {
                background-color: #f1f1f1;
            }

            .status-container {
                position: relative;
                display: inline-block;
            }

            @media (max-width: 1200px) {
                .booking-container {
                    padding: 15px;
                    margin: 20px auto;
                }

                .booking-table {
                    display: block;
                    overflow-x: auto;
                    white-space: nowrap;
                }

                .search-section {
                    padding: 15px;
                }

                .email-cell {
                    max-width: 150px;
                }
            }

#pagination-order .page-item {
    display: inline-block !important; /* Đảm bảo hiển thị */
    visibility: visible !important;
}

#pagination-order .page-link {
    color: #007bff !important; /* Màu chữ rõ ràng */
    font-size: 14px !important;
    padding: 8px 12px !important;
    opacity: 1 !important;
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
            <div class="overlay bg-parallax"></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Booking Management</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Booking</li>
                    </ol>
                </div>
            </div>
        </section>

        <div class="container">
            <c:if test="${not empty bookingStatusMess}">
                <div class="message success-message">
                    ${bookingStatusMess}
                </div>
            </c:if>

            <c:if test="${not empty searchMess}">
                <div class="message error-message">
                    ${searchMess}
                </div>
            </c:if>
        </div>

        <div class="booking-container">
            <div class="search-section">
                <h2><i class="fa fa-search"></i> Search Booking</h2>
                <form action="searchBooking" method="get" onsubmit="return validateSearch()">
                    <div class="row">
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="Phone" name="Phone" placeholder="Enter customer phone number" required>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-primary btn-block">
                                <i class="fa fa-search"></i> Search
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="text-center mb-4">
                <h3><i class="fa fa-list"></i> Booking List</h3>
                <a href="showBookingCustomer" class="btn btn-outline-secondary">
                    <i class="fa fa-users"></i> View Customer Bookings
                </a>
            </div>

            <div class="table-responsive">
                <table class="booking-table">
                    <thead>
                        <tr>
                            <th>Full Name</th>
                            <th>Gender</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Adult</th>
                            <th>Child</th>
                            <th>Check In</th>
                            <th>Check Out</th>
                            <th>Room Type</th>
                            <th>Booking Time</th>
                            <th>Total Price</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody id="booking-body">
                        <!-- First sort all bookings by Booking Time (newest first) -->
                        <c:set var="sortedBookings" value="${requestScope.listB.stream()
                                                             .sorted((b1, b2) -> b2.getBookingTime().compareTo(b1.getBookingTime()))
                                                             .toList()}" />

                        <!-- First show all "Not Yet" bookings sorted by Booking Time -->
                        <c:forEach items="${sortedBookings}" var="b">
                            <c:if test="${b.getNote() eq 'Not Yet'}">
                                <tr class="booking-row priority-booking">
                                    <td>${b.getFullName()}</td>
                                    <td>${b.getGender()}</td>
                                    <td><span class="email-cell" title="${b.getEmail()}">${b.getEmail()}</span></td>
                                    <td class="phone-cell">${b.getPhone()}</td>
                                    <td>${b.getAdult()}</td>
                                    <td>${b.getChild()}</td>
                                    <td>${b.getCheckIn()}</td>
                                    <td>${b.getCheckOut()}</td>
                                    <td>
                                        <ul class="room-list">
                                            <c:forEach items="${roomMap[b.getIDBooking()]}" var="room">
                                                <li>${room.roomName} (${room.numberOfRooms})</li>
                                                </c:forEach>
                                        </ul>
                                    </td>
                                    <td>${b.getBookingTime()}</td>
                                    <td><fmt:formatNumber value="${b.getTotalPrice()}" pattern="#,##0" /> VND</td>
                                    <td>
                                        <div class="status-container">
                                            <button type="button" class="status-button not-yet" onclick="showStatusDropdown(this)">${b.getNote()}</button>
                                            <div class="status-dropdown">
                                                <form action="updateBookingStatus" method="get" onsubmit="return handleStatusUpdate(this)">
                                                    <input type="hidden" name="IDBooking" value="${b.getIDBooking()}">
                                                    <input type="hidden" name="IDAccount" value="${b.getIDAccount()}">
                                                    <button type="submit" name="Status" value="In Progress" class="status-button in-progress">In Progress</button>
                                                    <button type="submit" name="Status" value="Success" class="status-button success">Success</button>
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>

                        <!-- Then show all "In Progress" bookings sorted by Booking Time -->
                        <c:forEach items="${sortedBookings}" var="b">
                            <c:if test="${b.getNote() eq 'In Progress'}">
                                <tr class="booking-row in-progress-booking">
                                    <td>${b.getFullName()}</td>
                                    <td>${b.getGender()}</td>
                                    <td><span class="email-cell" title="${b.getEmail()}">${b.getEmail()}</span></td>
                                    <td class="phone-cell">${b.getPhone()}</td>
                                    <td>${b.getAdult()}</td>
                                    <td>${b.getChild()}</td>
                                    <td>${b.getCheckIn()}</td>
                                    <td>${b.getCheckOut()}</td>
                                    <td>
                                        <ul class="room-list">
                                            <c:forEach items="${roomMap[b.getIDBooking()]}" var="room">
                                                <li>${room.roomName} (${room.numberOfRooms})</li>
                                                </c:forEach>
                                        </ul>
                                    </td>
                                    <td>${b.getBookingTime()}</td>
                                    <td><fmt:formatNumber value="${b.getTotalPrice()}" pattern="#,##0" /> VND</td>
                                    <td>
                                        <div class="status-container">
                                            <button type="button" class="status-button in-progress" onclick="showStatusDropdown(this)">${b.getNote()}</button>
                                            <div class="status-dropdown">
                                                <form action="updateBookingStatus" method="get" onsubmit="return handleStatusUpdate(this)">
                                                    <input type="hidden" name="IDBooking" value="${b.getIDBooking()}">
                                                    <input type="hidden" name="IDAccount" value="${b.getIDAccount()}">
                                                    <button type="submit" name="Status" value="Success" class="status-button success">Success</button>
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>

                        <!-- Then show all other bookings sorted by Booking Time -->
                        <c:forEach items="${sortedBookings}" var="b">
                            <c:if test="${b.getNote() ne 'Not Yet' && b.getNote() ne 'In Progress'}">
                                <tr class="booking-row">
                                    <td>${b.getFullName()}</td>
                                    <td>${b.getGender()}</td>
                                    <td><span class="email-cell" title="${b.getEmail()}">${b.getEmail()}</span></td>
                                    <td class="phone-cell">${b.getPhone()}</td>
                                    <td>${b.getAdult()}</td>
                                    <td>${b.getChild()}</td>
                                    <td>${b.getCheckIn()}</td>
                                    <td>${b.getCheckOut()}</td>
                                    <td>
                                        <ul class="room-list">
                                            <c:forEach items="${roomMap[b.getIDBooking()]}" var="room">
                                                <li>${room.roomName} (${room.numberOfRooms})</li>
                                                </c:forEach>
                                        </ul>
                                    </td>
                                    <td>${b.getBookingTime()}</td>
                                    <td><fmt:formatNumber value="${b.getTotalPrice()}" pattern="#,##0" /> VND</td>
                                    <td>
                                        <button type="button" class="status-button ${b.getNote() eq 'Success' ? 'success' : 'cancelled'}" disabled>${b.getNote()}</button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>

            </div>

            <!-- Pagination -->
            <div class="pagination-container">
                <ul class="pagination" id="pagination">
                    <li class="page-item" id="prevPage">
                        <a class="page-link page-arrow" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <!-- Page numbers will be added by JavaScript -->
                    <li class="page-item" id="nextPage">
                        <a class="page-link page-arrow" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- Service Order Table -->
            <div class="table-responsive ">
                <h3><i class="fa fa-concierge-bell"></i> Service Orders</h3>
                <table class="booking-table">
                    <thead>
                        <tr >
                            <th>Service Name</th>
                            <th>Order Date</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Total Price</th>
                        </tr>
                    </thead>
                    <tbody id="booking-body">
                        <c:forEach items="${serviceList}" var="s">
                               <tr class="paginate-order">
                                <td class="text-center">${s.serviceName}</td> 
                                <td class="text-center">${s.orderDate.substring(0,16)}</td> 
                                <td class="text-center">${s.fullName}</td> 
                                <td class="text-center">${s.email}</td> 
                                <td class="text-center">${s.phone}</td> 
                                <td class="text-center"><fmt:formatNumber value="${s.totalPrice}" pattern="#,##0" /> VND</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
          <div class="pagination-container">
    <ul class="pagination" id="pagination-order">
        <li class="page-item" id="prevPageOrder">
            <a class="page-link page-arrow" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <!-- Page numbers will be added by JavaScript -->
        <li class="page-item" id="nextPageOrder">
            <a class="page-link page-arrow" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</div>

        </div>

        <%@include file="/includes/footer.jsp" %>

        <!-- JS scripts -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/mail-script.js"></script>
        <script src="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
        <script src="vendors/nice-select/js/jquery.nice-select.js"></script>
        <script src="js/stellar.js"></script>
        <script src="vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="js/custom.js"></script>
        <!-- SweetAlert2 JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
                                                    // Function to show status dropdown
function showStatusDropdown(button) {
    const dropdown = button.nextElementSibling;
    const allDropdowns = document.querySelectorAll('.status-dropdown');

    // Hide all other dropdowns
    allDropdowns.forEach(item => {
        if (item !== dropdown) {
            item.style.display = 'none';
        }
    });

    // Toggle current dropdown
    dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';

    // Close dropdown when clicking outside
    document.addEventListener('click', function closeDropdown(e) {
        if (!dropdown.contains(e.target) && e.target !== button) {
            dropdown.style.display = 'none';
            document.removeEventListener('click', closeDropdown);
        }
    });
}

// Function to handle form submission with SweetAlert
function handleStatusUpdate(form) {
    event.preventDefault(); // Prevent default form submission

    // Find which button was clicked
    const clickedButton = event.submitter;
    const status = clickedButton.value;
    const statusText = status === 'In Progress' ? 'in progress' : 'successful';

    Swal.fire({
        title: 'Confirm Status Update',
        text: `Are you sure you want to mark this booking as ${statusText}?`,
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#FEA116',
        cancelButtonColor: '#d33',
        confirmButtonText: `Yes, mark as ${statusText}`
    }).then((result) => {
        if (result.isConfirmed) {
            // Show loading indicator
            Swal.fire({
                title: 'Processing...',
                text: 'Updating booking status',
                allowOutsideClick: false,
                allowEscapeKey: false,
                didOpen: () => {
                    Swal.showLoading();
                }
            });

            // Submit the form
            const formData = new FormData(form);
            formData.set('Status', status); // Ensure correct status is sent
            const url = form.action + '?' + new URLSearchParams(formData).toString();

            fetch(url)
                    .then(() => {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success!',
                            text: `Booking status updated to ${statusText}`,
                            showConfirmButton: false,
                            timer: 1500
                        }).then(() => {
                            // Reload the page to see the updated status
                            window.location.reload();
                        });
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'Failed to update booking status. Please try again.'
                        }).then(() => {
                            window.location.reload();
                        });
                    });
        }
    });

    return false;
}

// Form validation
function validateSearch() {
    const phoneInput = document.getElementById('Phone');
    if (phoneInput.value.trim() === '') {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Please enter a phone number to search!',
        });
        return false;
    }
    return true;
}

// Pagination functionality
document.addEventListener('DOMContentLoaded', function () {
    const rowsPerPage = 5;
    const table = document.querySelector('.booking-table');
    const tbody = document.getElementById('booking-body');
    const rows = Array.from(tbody.querySelectorAll('.booking-row'));
    const pageCount = Math.ceil(rows.length / rowsPerPage);
    const pagination = document.getElementById('pagination');
    const prevPage = document.getElementById('prevPage');
    const nextPage = document.getElementById('nextPage');

    let currentPage = 1;

    // Function to show rows for a specific page
    function showPage(page) {
        const start = (page - 1) * rowsPerPage;
        const end = start + rowsPerPage;

        rows.forEach((row, index) => {
            row.style.display = (index >= start && index < end) ? '' : 'none';
        });

        // Update active state of page buttons
        document.querySelectorAll('.page-number').forEach(item => {
            item.classList.remove('active');
            if (item.textContent == page) {
                item.classList.add('active');
            }
        });

        // Update disabled state of prev/next buttons
        prevPage.classList.toggle('disabled', page === 1);
        nextPage.classList.toggle('disabled', page === pageCount);

        currentPage = page;
    }

    // Create page number buttons
    function setupPagination() {
        // Clear existing page numbers (except prev/next)
        while (pagination.children.length > 2) {
            pagination.removeChild(pagination.children[1]);
        }

        // Add page numbers
        for (let i = 1; i <= pageCount; i++) {
            const pageItem = document.createElement('li');
            pageItem.className = 'page-item page-number' + (i === 1 ? ' active' : '');

            const pageLink = document.createElement('a');
            pageLink.className = 'page-link';
            pageLink.href = '#';
            pageLink.textContent = i;

            pageLink.addEventListener('click', function (e) {
                e.preventDefault();
                showPage(i);
            });

            pageItem.appendChild(pageLink);
            pagination.insertBefore(pageItem, nextPage);
        }
    }

    // Previous page button event
    prevPage.querySelector('.page-link').addEventListener('click', function (e) {
        e.preventDefault();
        if (currentPage > 1) {
            showPage(currentPage - 1);
        }
    });

    // Next page button event
    nextPage.querySelector('.page-link').addEventListener('click', function (e) {
        e.preventDefault();
        if (currentPage < pageCount) {
            showPage(currentPage + 1);
        }
    });

    // Initialize pagination
    setupPagination();
    showPage(1);
});
        </script>
<script>
const orderRowsPerPage = 5;
const orderRows = document.querySelectorAll('.paginate-order');
const paginationOrder = document.getElementById('pagination-order');
const prevPageOrder = document.getElementById('prevPageOrder');
const nextPageOrder = document.getElementById('nextPageOrder');
let currentOrderPage = 1;
const orderPageCount = Math.ceil(orderRows.length / orderRowsPerPage);

function displayOrderPage(page) {
    const start = (page - 1) * orderRowsPerPage;
    const end = start + orderRowsPerPage;
    orderRows.forEach((row, index) => {
        row.style.display = (index >= start && index < end) ? '' : 'none';
    });
}

function setupOrderPagination() {
    // Xóa các page cũ trước khi tạo mới
    const oldPages = document.querySelectorAll('#pagination-order .page-item:not(#prevPageOrder):not(#nextPageOrder)');
    oldPages.forEach(page => page.remove());

    // Tạo trang mới
    for (let i = 1; i <= orderPageCount; i++) {
        const li = document.createElement('li');
        li.className = 'page-item';
        
        // Cách cứng cáp nhất: dùng createElement
        const a = document.createElement('a');
        a.className = 'page-link';
        a.href = '#';
        a.textContent = i; // Số trang hiện rõ ở đây
        li.appendChild(a);
        
        li.addEventListener('click', (e) => {
            e.preventDefault();
            currentOrderPage = i;
            displayOrderPage(currentOrderPage);
            updateOrderActivePage();
        });
        
        document.getElementById('pagination-order').insertBefore(li, nextPageOrder);
    }
}

function updateOrderActivePage() {
    // Get all page items excluding prev/next buttons
    const pageItems = Array.from(paginationOrder.querySelectorAll('.page-item:not(#prevPageOrder):not(#nextPageOrder)'));
    
    // Remove active class from all items
    pageItems.forEach(item => item.classList.remove('active'));
    
    // Add active class to current page (need to subtract 1 for zero-based indexing)
    const activePageItem = pageItems[currentOrderPage - 1];
    if (activePageItem) {
        activePageItem.classList.add('active');
    }
}

prevPageOrder.addEventListener('click', function (e) {
    e.preventDefault();
    if (currentOrderPage > 1) {
        currentOrderPage--;
        displayOrderPage(currentOrderPage);
        updateOrderActivePage();
    }
});

nextPageOrder.addEventListener('click', function (e) {
    e.preventDefault();
    if (currentOrderPage < orderPageCount) {
        currentOrderPage++;
        displayOrderPage(currentOrderPage);
        updateOrderActivePage();
    }
});

// Init
displayOrderPage(currentOrderPage);
setupOrderPagination();
updateOrderActivePage();
</script>

    </body>
</html>