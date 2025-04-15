<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            .status-button.success, .status-button.cancelled {
                background-color: #e0e0e0;
                color: #555;
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
                            <form action="updateBookingStatus" method="get" onsubmit="return handleStatusUpdate(this)">
                                <input type="hidden" name="IDBooking" value="${b.getIDBooking()}">
                                <input type="hidden" name="IDAccount" value="${b.getIDAccount()}">
                                <input type="hidden" name="Status" value="Success">
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
                                <td>$${b.getTotalPrice()}</td>
                                <td>
                                    <input type="submit" class="status-button not-yet" value="${b.getNote()}">
                                </td>
                            </form>
                            </tr>
                        </c:if>
                    </c:forEach>

                    <!-- Then show all other bookings sorted by Booking Time -->
                    <c:forEach items="${sortedBookings}" var="b">
                        <c:if test="${b.getNote() ne 'Not Yet'}">
                            <tr class="booking-row">
                            <form action="updateBookingStatus" method="get">
                                <input type="hidden" name="IDBooking" value="${b.getIDBooking()}">
                                <input type="hidden" name="IDAccount" value="${b.getIDAccount()}">
                                <input type="hidden" name="Status" value="Success">
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
                                <td>$${b.getTotalPrice()}</td>
                                <td>
                                    <button type="button" class="status-button ${b.getNote() eq 'Success' ? 'success' : 'cancelled'}" disabled>${b.getNote()}</button>
                                </td>
                            </form>
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
                                // Function to handle form submission with SweetAlert
                                function handleStatusUpdate(form) {
                                    event.preventDefault(); // Prevent default form submission

                                    Swal.fire({
                                        title: 'Confirm Status Update',
                                        text: 'Are you sure you want to mark this booking as successful?',
                                        icon: 'question',
                                        showCancelButton: true,
                                        confirmButtonColor: '#FEA116',
                                        cancelButtonColor: '#d33',
                                        confirmButtonText: 'Yes, update it!'
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
                                            const url = form.action + '?' + new URLSearchParams(formData).toString();

                                            fetch(url)
                                                    .then(() => {
                                                        Swal.fire({
                                                            icon: 'success',
                                                            title: 'Success!',
                                                            text: 'Booking status updated successfully',
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
    </body>
</html>