<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>Review Rooms - TROPICAL Hotel</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <!-- main css -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .card {
                transition: transform 0.3s;
                margin-bottom: 20px;
                background-color: #fff8e1;
                border: 1px solid #ffe0b2;
            }
            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            }
            .rating-stars {
                color: #ffc107;
                font-size: 1.2rem;
            }
            .review-popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.5);
                z-index: 1050;
                align-items: center;
                justify-content: center;
            }
            .review-popup-content {
                background: white;
                border-radius: 10px;
                width: 100%;
                max-width: 500px;
                padding: 25px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            }
            .btn-review {
                background-color: #ff9800;
                color: white;
                border: none;
            }
            .btn-review:hover {
                background-color: #f57c00;
                box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            }
            .empty-state {
                text-align: center;
                padding: 40px;
                background-color: #f8f9fa;
                border-radius: 10px;
            }
            .empty-state i {
                font-size: 3rem;
                color: #6c757d;
                margin-bottom: 15px;
            }
            .breadcrumb_area {
                padding: 100px 0;
                position: relative;
                background: #04091e;
            }
            .page-cover-tittle {
                font-size: 36px;
                color: #fff;
                margin-bottom: 15px;
            }
            .breadcrumb {
                background: transparent;
                padding: 0;
                margin-bottom: 0;
                justify-content: center;
            }
            .breadcrumb li a {
                color: #fff;
            }
            .breadcrumb li.active {
                color: #f8b600;
            }
            .card-header {
                background-color: #ffc107 !important;
                color: #212529 !important;
            }
            .review-card {
                border-left: 4px solid #ffc107;
                margin-bottom: 20px;
                display: none;
                transition: opacity 0.3s ease;
            }
            .review-card.show {
                display: block;
                opacity: 1;
            }
            .review-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }
            .review-author {
                font-weight: bold;
                color: #333;
            }
            .review-date {
                color: #6c757d;
                font-size: 0.9rem;
            }
            .admin-reply {
                background-color: #f8f9fa;
                border-left: 3px solid #6c757d;
                padding: 10px 15px;
                margin-top: 15px;
                font-style: italic;
            }
            .pagination {
                justify-content: center;
                margin-top: 30px;
            }
            .page-item.active .page-link {
                background-color: #ffc107;
                border-color: #ffc107;
                color: #212529;
            }
            .page-link {
                color: #ffc107;
            }
            .section-title {
                position: relative;
                margin-bottom: 30px;
                padding-bottom: 15px;
            }
            .section-title:after {
                content: "";
                position: absolute;
                bottom: 0;
                left: 0;
                width: 50px;
                height: 3px;
                background: #ffc107;
            }
            #paginationControls {
                margin-top: 30px;
            }
            .page-item.disabled .page-link {
                color: #6c757d;
                pointer-events: none;
                background-color: #f8f9fa;
            }
            .page-item:not(.disabled):hover .page-link {
                background-color: #ffe8a1;
            }
            /* CSS for Toast Messages */
            .toast-container {
                position: fixed;
                top: 20px;
                right: 20px;
                z-index: 1060;
            }
            .toast {
                background-color: white;
                min-width: 300px;
            }
            .toast-success .toast-header {
                background-color: #28a745;
                color: white;
            }
            .toast-error .toast-header {
                background-color: #dc3545;
                color: white;
            }
        </style>
    </head>
    <body>
        <!-- Include header -->

        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Room Reviews</h2>
                    <ol class="breadcrumb">
                        <li><a href="/Hotel">Home</a></li>
                        <li class="active">Reviews</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->

        <!-- Toast Message Container -->
        <div class="toast-container">
            <c:if test="${not empty sessionScope.message}">
                <div class="toast toast-success" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="5000">
                    <div class="toast-header">
                        <i class="fas fa-check-circle me-2"></i>
                        <strong class="me-auto">Success</strong>
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                    <div class="toast-body">
                        ${sessionScope.message}
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="toast toast-error" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="5000">
                    <div class="toast-header">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        <strong class="me-auto">Error</strong>
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                    <div class="toast-body">
                        ${sessionScope.errorMessage}
                    </div>
                </div>
            </c:if>
        </div>

        <div class="container py-5">
            <!-- Section for rooms to review (only shown if user is logged in) -->
            <c:if test="${not empty userA}">
                <div class="row mb-4">
                    <div class="col-12">
                        <h1 class="display-5 fw-bold text-primary">Your Room Reviews</h1>
                        <p class="lead">Share your experience about the rooms you've booked</p>
                    </div>
                </div>

                <div class="row mb-5">
                    <c:choose>
                        <c:when test="${not empty roomsToReview}">
                            <c:forEach var="room" items="${roomsToReview}">
                                <div class="col-md-6 col-lg-4">
                                    <div class="card h-100">
                                        <div class="card-header text-dark">
                                            <h5 class="card-title mb-0">${room.roomTypeName}</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between mb-3">
                                                <div>
                                                    <h6 class="text-muted">Room Number:</h6>
                                                    <p class="fs-5 fw-bold">${room.numberOfRoom}</p>
                                                </div>
                                                <div class="text-end">
                                                    <h6 class="text-muted">Booking ID:</h6>
                                                    <p class="fs-5 fw-bold">#${room.idBooking}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer bg-transparent">
                                            <button class="btn btn-review w-100" 
                                                    onclick="openReviewPopup('${room.idBooking}', '${room.roomTypeName}')">
                                                <i class="fas fa-pen me-2"></i>Write Review
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="col-12">
                                <div class="empty-state">
                                    <i class="far fa-smile"></i>
                                    <h3>You have no rooms to review</h3>
                                    <p class="text-muted">When you have rooms that need reviewing, they will appear here</p>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if>

            <!-- Section for all reviews (shown to everyone) -->
            <div class="row">
                <div class="col-12">
                    <h2 class="section-title">Customer Reviews</h2>

                    <c:choose>
                        <c:when test="${not empty feedbackList}">
                            <!-- Reviews list container -->
                            <div id="reviewsContainer">
                                <c:forEach var="feedback" items="${feedbackList}">
                                    <div class="card review-card">
                                        <div class="card-body">
                                            <div class="review-header">
                                                <div>
                                                    <span class="review-author">${feedback.accountName}</span>
                                                    <div class="rating-stars mt-1">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <c:choose>
                                                                <c:when test="${i <= feedback.rating}">
                                                                    <i class="fas fa-star"></i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="far fa-star"></i>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <span class="ms-2">(${feedback.rating}/5)</span>
                                                    </div>
                                                </div>
                                                <span class="review-date">${feedback.feedbackDate}</span>
                                            </div>
                                            <p class="mt-3">${feedback.content}</p>

                                            <c:if test="${not empty feedback.replyComment}">
                                                <div class="admin-reply mt-3">
                                                    <strong><i class="fas fa-reply me-2"></i>Hotel Response:</strong>
                                                    <p class="mb-0">${feedback.replyComment}</p>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- Pagination controls -->
                            <div id="paginationControls" class="d-flex justify-content-center mt-4">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination" id="paginationUL">
                                        <!-- Pagination buttons will be inserted here by JavaScript -->
                                    </ul>
                                </nav>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">
                                <i class="far fa-comment-dots"></i>
                                <h3>No reviews yet</h3>
                                <p class="text-muted">
                                    <c:choose>
                                        <c:when test="${not empty roomTypeId}">
                                            No reviews available for this room type. Be the first to review!
                                        </c:when>
                                        <c:otherwise>
                                            No reviews available yet. Be the first to share your experience!
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <!-- Review Popup (only shown if user is logged in) -->
        <c:if test="${not empty userA}">
            <div id="reviewPopup" class="review-popup">
                <div class="review-popup-content">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h3 class="mb-0">Review Room: <span id="roomTypeName" class="text-primary"></span></h3>
                        <button type="button" class="btn-close" onclick="closeReviewPopup()"></button>
                    </div>

                    <form action="submit-review" method="POST">
                        <input type="hidden" name="bookingId" id="bookingId">
                        <input type="hidden" name="roomTypeId" value="${roomTypeId}">

                        <div class="mb-3">
                            <label for="rating" class="form-label">Star Rating:</label>
                            <select class="form-select" name="rating" id="rating" required>
                                <option value="" selected disabled>Select stars</option>
                                <option value="1">1 star - Poor</option>
                                <option value="2">2 stars - Unsatisfied</option>
                                <option value="3">3 stars - Average</option>
                                <option value="4">4 stars - Satisfied</option>
                                <option value="5">5 stars - Excellent</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="content" class="form-label">Review Content:</label>
                            <textarea class="form-control" name="content" id="content" rows="4" 
                                      placeholder="Share your experience..." ></textarea>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="button" class="btn btn-outline-secondary" onclick="closeReviewPopup()">
                                <i class="fas fa-times me-2"></i>Cancel
                            </button>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-paper-plane me-2"></i>Submit Review
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </c:if>

        <!-- Footer -->
        <%@include file="/includes/footer.jsp" %>

        <!-- JavaScript Libraries -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script>
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
                                // Show toasts on page load
                                document.addEventListener('DOMContentLoaded', function () {
                                    var toastElList = [].slice.call(document.querySelectorAll('.toast'));
                                    var toastList = toastElList.map(function (toastEl) {
                                        return new bootstrap.Toast(toastEl);
                                    });
                                    toastList.forEach(toast => toast.show());

                                    // Remove messages from session after showing them
            <% session.removeAttribute("message"); %>
            <% session.removeAttribute("errorMessage");%>
                                });

                                // Client-side pagination for reviews
                                $(document).ready(function () {
                                    const reviewsPerPage = 5;
                                    const reviewCards = $('.review-card');
                                    const totalReviews = reviewCards.length;
                                    const totalPages = Math.ceil(totalReviews / reviewsPerPage);
                                    const paginationUL = $('#paginationUL');

                                    // Initialize pagination
                                    if (totalReviews > 0) {
                                        setupPagination();
                                        showPage(1);
                                    }

                                    // Set up pagination controls
                                    function setupPagination() {
                                        paginationUL.empty();

                                        // Previous button
                                        const prevLi = $('<li class="page-item" id="prevPage"></li>');
                                        prevLi.append('<a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>');
                                        prevLi.click(function (e) {
                                            e.preventDefault();
                                            const currentPage = parseInt($('.page-item.active a').text());
                                            if (currentPage > 1) {
                                                showPage(currentPage - 1);
                                            }
                                        });
                                        paginationUL.append(prevLi);

                                        // Page numbers
                                        for (let i = 1; i <= totalPages; i++) {
                                            const pageLi = $('<li class="page-item"></li>');
                                            const pageLink = $('<a class="page-link" href="#"></a>').text(i);

                                            pageLink.click(function (e) {
                                                e.preventDefault();
                                                showPage(i);
                                            });

                                            pageLi.append(pageLink);
                                            if (i === 1) {
                                                pageLi.addClass('active');
                                            }

                                            paginationUL.append(pageLi);
                                        }

                                        // Next button
                                        const nextLi = $('<li class="page-item" id="nextPage"></li>');
                                        nextLi.append('<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>');
                                        nextLi.click(function (e) {
                                            e.preventDefault();
                                            const currentPage = parseInt($('.page-item.active a').text());
                                            if (currentPage < totalPages) {
                                                showPage(currentPage + 1);
                                            }
                                        });
                                        paginationUL.append(nextLi);

                                        // Disable prev button on first page
                                        $('#prevPage').addClass('disabled');

                                        // Disable next button if only one page
                                        if (totalPages === 1) {
                                            $('#nextPage').addClass('disabled');
                                        }
                                    }

                                    // Show specific page of reviews
                                    function showPage(pageNumber) {
                                        // Hide all reviews
                                        reviewCards.hide();

                                        // Calculate start and end index
                                        const startIndex = (pageNumber - 1) * reviewsPerPage;
                                        const endIndex = startIndex + reviewsPerPage;

                                        // Show reviews for current page
                                        reviewCards.slice(startIndex, endIndex).show();

                                        // Update active state of pagination buttons
                                        $('.page-item').removeClass('active');
                                        $('.page-item').eq(pageNumber).addClass('active');

                                        // Update disabled state of prev/next buttons
                                        $('#prevPage').toggleClass('disabled', pageNumber === 1);
                                        $('#nextPage').toggleClass('disabled', pageNumber === totalPages);
                                    }
                                });

                                // Review popup functions
                                function openReviewPopup(bookingId, roomTypeName) {
                                    document.getElementById("reviewPopup").style.display = "flex";
                                    document.getElementById("bookingId").value = bookingId;
                                    document.getElementById("roomTypeName").textContent = roomTypeName;
                                }

                                function closeReviewPopup() {
                                    document.getElementById("reviewPopup").style.display = "none";
                                }

                                // Close popup when clicking outside content
                                window.addEventListener('DOMContentLoaded', (event) => {
                                    const popup = document.getElementById("reviewPopup");
                                    if (popup) {
                                        popup.addEventListener('click', function (e) {
                                            if (e.target === this) {
                                                closeReviewPopup();
                                            }
                                        });
                                    }
                                });
        </script>

        <!-- Success Message Popup -->
        <c:if test="${not empty sessionScope.message}">
            <div id="successPopup" class="review-popup" style="display: flex;">
                <div class="review-popup-content text-center">
                    <h4>${sessionScope.message}</h4>
                    <button onclick="document.getElementById('successPopup').style.display = 'none'" class="btn btn-review mt-3">OK</button>
                </div>
            </div>
            <script>
                // Automatically show popup when page loads
                window.onload = function () {
                    document.getElementById("successPopup").style.display = "flex";
                };
            </script>
            <c:remove var="message" scope="session"/>
        </c:if>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384..." crossorigin="anonymous"></script>

    </body>
</html>