<%-- 
    Document   : roomDetail
    Created on : Jun 18, 2024, 10:18:38 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>TROPICAL Hotel</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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
        <link rel="stylesheet" href="css/mystyle.css"
    </head>
    <body>
        <%@include file="/includes/header.jsp" %>
        <div class="container mt-5">
            <div class="room-card">
                <div class="card-header bg-primary text-white">
                    <h2 class="mb-0">${room.getNameRoomType()}</h2>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="images/${ room.getImage() }" class="img-fluid room-image" alt="${ room.getNameRoomType() }">
                        </div>
                        <div class="col-md-6">
                            <div class="room-details">

                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-hotel"></i>
                                    </div>
                                    <div class="detail-label">Room Type:</div>
                                    <div class="detail-value">${room.getNameRoomType()}</div>
                                </div>
                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-users"></i>
                                    </div>
                                    <div class="detail-label">Max Persons:</div>
                                    <div class="detail-value">${ room.getMaxPerson() }</div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-bed"></i>
                                    </div>
                                    <div class="detail-label">Number of Beds:</div>
                                    <div class="detail-value">${ room.getNumberOfBed() }</div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-bath"></i>
                                    </div>
                                    <div class="detail-label">Number of Baths:</div>
                                    <div class="detail-value">${ room.getNumberOfBath() }</div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-tag"></i>
                                    </div>
                                    <div class="detail-label">Price:</div>
                                    <div class="detail-value">
                                        <fmt:formatNumber value="${room.getPrice()}" pattern="#,###" /> VND/night
                                    </div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-door-open"></i>
                                    </div>
                                    <div class="detail-label">Total Rooms:</div>
                                    <div class="detail-value">${ room.getTotalRoom() }</div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-info-circle"></i>
                                    </div>
                                    <div class="detail-label">Room Status:</div>
                                    <div class="detail-value">
                                        <span class="badge ${room.getRoomStatus() == 'Available' ? 'bg-success' : 'bg-warning'}">
                                            ${ room.getRoomStatus() }
                                        </span>
                                    </div>
                                </div>

                                <div class="detail-item mt-4">
                                    <div class="detail-icon">
                                        <i class="fas fa-align-left"></i>
                                    </div>
                                    <div>
                                        <div class="detail-label">Description:</div>
                                        <div class="detail-value mt-2">${ room.getContent() }</div>
                                    </div>
                                </div>

                                <div class="mt-4">
                                    <button class="back-btn" onclick="window.history.back()">
                                        <i class="fas fa-arrow-left"></i> Back to Rooms
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Reviews Section -->
            <div class="reviews-section">
                <h3 class="section-title">
                    Guest Reviews 
                    <span class="review-count">${feedbackCount} reviews</span>
                </h3>

                <div class="reviews-container" id="reviewsContainer">
                    <c:choose>
                        <c:when test="${empty feedbackList}">
                            <div class="no-reviews">
                                <i class="far fa-comment-dots"></i>
                                <h4>No Reviews Yet</h4>
                                <p>Be the first to share your experience about this room!</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="feedback" items="${feedbackList}" varStatus="loop">
                                <div class="review-card" data-review-index="${loop.index}">
                                    <div class="review-header">
                                        <div class="user-avatar">
                                            ${feedback.getAccountName().charAt(0)}
                                        </div>
                                        <div class="user-info">
                                            <div class="user-name">${feedback.getAccountName()}</div>
                                            <div class="review-date">
                                                <i class="far fa-calendar-alt"></i> ${feedback.getFeedbackDate()}
                                            </div>
                                        </div>
                                    </div>

                                    <div class="review-rating">
                                        <c:forEach begin="1" end="${feedback.getRating()}">
                                            <i class="fas fa-star"></i>
                                        </c:forEach>
                                        <c:forEach begin="${feedback.getRating() + 1}" end="5">
                                            <i class="far fa-star"></i>
                                        </c:forEach>
                                        <span class="ms-2">${feedback.getRating()}.0</span>
                                    </div>

                                    <div class="review-content">
                                        ${feedback.getContent()}
                                    </div>

                                    <c:if test="${not empty feedback.getReplyComment()}">
                                        <div class="review-reply">
                                            <div class="reply-header">
                                                <i class="fas fa-reply"></i>
                                                <span class="reply-author">Hotel Staff</span>
                                                <c:if test="${not empty feedback.getAuthorReply()}">
                                                    <span class="text-muted">(${feedback.getAuthorReply()})</span>
                                                </c:if>
                                            </div>
                                            <div class="reply-content">
                                                ${feedback.getReplyComment()}
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Pagination Controls -->
                <div class="pagination-container" id="paginationContainer">
                    <ul class="pagination" id="pagination">
                        <!-- Pagination will be generated by JavaScript -->
                    </ul>
                    <div class="page-info" id="pageInfo"></div>
                </div>
            </div>
        </div>

        <%@include file="/includes/footer.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script>
        <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                            const reviewsPerPage = 5;
                                            const reviewCards = document.querySelectorAll('.review-card');
                                            const totalReviews = reviewCards.length;
                                            const totalPages = Math.ceil(totalReviews / reviewsPerPage);
                                            const paginationContainer = document.getElementById('paginationContainer');
                                            const paginationElement = document.getElementById('pagination');
                                            const pageInfoElement = document.getElementById('pageInfo');
                                            const reviewsContainer = document.getElementById('reviewsContainer');

                                            // Only initialize pagination if there are reviews
                                            if (totalReviews > 0) {
                                                // Initialize pagination
                                                let currentPage = 1;

                                                // Function to show reviews for a specific page
                                                function showPage(page) {
                                                    currentPage = page;
                                                    const startIndex = (page - 1) * reviewsPerPage;
                                                    const endIndex = Math.min(startIndex + reviewsPerPage, totalReviews);

                                                    // Hide all reviews
                                                    reviewCards.forEach(card => {
                                                        card.style.display = 'none';
                                                    });

                                                    // Show reviews for current page
                                                    for (let i = startIndex; i < endIndex; i++) {
                                                        if (reviewCards[i]) {
                                                            reviewCards[i].style.display = 'block';
                                                        }
                                                    }

                                                    // Update page info
                                                    pageInfoElement.textContent = `Showing reviews \${startIndex + 1}-\${endIndex} of \${totalReviews}`;

                                                    // Update active page in pagination
                                                    updatePaginationUI();
                                                }

                                                // Function to update pagination UI
                                                function updatePaginationUI() {
                                                    paginationElement.innerHTML = '';

                                                    // Previous button
                                                    const prevLi = document.createElement('li');
                                                    prevLi.className = 'page-item';
                                                    const prevLink = document.createElement('a');
                                                    prevLink.className = 'page-link';
                                                    prevLink.href = '#';
                                                    prevLink.innerHTML = '<i class="fas fa-chevron-left"></i>';
                                                    prevLink.addEventListener('click', (e) => {
                                                        e.preventDefault();
                                                        if (currentPage > 1) {
                                                            showPage(currentPage - 1);
                                                        }
                                                    });
                                                    if (currentPage === 1) {
                                                        prevLink.classList.add('disabled');
                                                    }
                                                    prevLi.appendChild(prevLink);
                                                    paginationElement.appendChild(prevLi);

                                                    // Page numbers
                                                    const maxVisiblePages = 5; // Maximum number of visible page buttons
                                                    let startPage, endPage;

                                                    if (totalPages <= maxVisiblePages) {
                                                        // Show all pages
                                                        startPage = 1;
                                                        endPage = totalPages;
                                                    } else {
                                                        // Calculate start and end pages
                                                        const maxPagesBeforeCurrent = Math.floor(maxVisiblePages / 2);
                                                        const maxPagesAfterCurrent = Math.ceil(maxVisiblePages / 2) - 1;

                                                        if (currentPage <= maxPagesBeforeCurrent) {
                                                            // Current page near the start
                                                            startPage = 1;
                                                            endPage = maxVisiblePages;
                                                        } else if (currentPage + maxPagesAfterCurrent >= totalPages) {
                                                            // Current page near the end
                                                            startPage = totalPages - maxVisiblePages + 1;
                                                            endPage = totalPages;
                                                        } else {
                                                            // Current page somewhere in the middle
                                                            startPage = currentPage - maxPagesBeforeCurrent;
                                                            endPage = currentPage + maxPagesAfterCurrent;
                                                        }
                                                    }

                                                    // Add first page and ellipsis if needed
                                                    if (startPage > 1) {
                                                        const firstLi = document.createElement('li');
                                                        firstLi.className = 'page-item';
                                                        const firstLink = document.createElement('a');
                                                        firstLink.className = 'page-link';
                                                        firstLink.href = '#';
                                                        firstLink.textContent = '1';
                                                        firstLink.addEventListener('click', (e) => {
                                                            e.preventDefault();
                                                            showPage(1);
                                                        });
                                                        firstLi.appendChild(firstLink);
                                                        paginationElement.appendChild(firstLi);

                                                        if (startPage > 2) {
                                                            const ellipsisLi = document.createElement('li');
                                                            ellipsisLi.className = 'page-item disabled';
                                                            const ellipsisSpan = document.createElement('span');
                                                            ellipsisSpan.className = 'page-link';
                                                            ellipsisSpan.textContent = '...';
                                                            ellipsisLi.appendChild(ellipsisSpan);
                                                            paginationElement.appendChild(ellipsisLi);
                                                        }
                                                    }

                                                    // Add page numbers
                                                    for (let i = startPage; i <= endPage; i++) {
                                                        const pageLi = document.createElement('li');
                                                        pageLi.className = 'page-item';
                                                        const pageLink = document.createElement('a');
                                                        pageLink.className = 'page-link';
                                                        pageLink.href = '#';
                                                        pageLink.textContent = i;
                                                        if (i === currentPage) {
                                                            pageLink.classList.add('active');
                                                        }
                                                        pageLink.addEventListener('click', (e) => {
                                                            e.preventDefault();
                                                            showPage(i);
                                                        });
                                                        pageLi.appendChild(pageLink);
                                                        paginationElement.appendChild(pageLi);
                                                    }

                                                    // Add last page and ellipsis if needed
                                                    if (endPage < totalPages) {
                                                        if (endPage < totalPages - 1) {
                                                            const ellipsisLi = document.createElement('li');
                                                            ellipsisLi.className = 'page-item disabled';
                                                            const ellipsisSpan = document.createElement('span');
                                                            ellipsisSpan.className = 'page-link';
                                                            ellipsisSpan.textContent = '...';
                                                            ellipsisLi.appendChild(ellipsisSpan);
                                                            paginationElement.appendChild(ellipsisLi);
                                                        }

                                                        const lastLi = document.createElement('li');
                                                        lastLi.className = 'page-item';
                                                        const lastLink = document.createElement('a');
                                                        lastLink.className = 'page-link';
                                                        lastLink.href = '#';
                                                        lastLink.textContent = totalPages;
                                                        lastLink.addEventListener('click', (e) => {
                                                            e.preventDefault();
                                                            showPage(totalPages);
                                                        });
                                                        lastLi.appendChild(lastLink);
                                                        paginationElement.appendChild(lastLi);
                                                    }

                                                    // Next button
                                                    const nextLi = document.createElement('li');
                                                    nextLi.className = 'page-item';
                                                    const nextLink = document.createElement('a');
                                                    nextLink.className = 'page-link';
                                                    nextLink.href = '#';
                                                    nextLink.innerHTML = '<i class="fas fa-chevron-right"></i>';
                                                    nextLink.addEventListener('click', (e) => {
                                                        e.preventDefault();
                                                        if (currentPage < totalPages) {
                                                            showPage(currentPage + 1);
                                                        }
                                                    });
                                                    if (currentPage === totalPages) {
                                                        nextLink.classList.add('disabled');
                                                    }
                                                    nextLi.appendChild(nextLink);
                                                    paginationElement.appendChild(nextLi);
                                                }

                                                // Initialize first page
                                                showPage(1);

                                                // Show pagination controls
                                                paginationContainer.style.display = 'block';
                                            } else {
                                                // Hide pagination controls if no reviews
                                                paginationContainer.style.display = 'none';
                                            }
                                        });
        </script>
    </body>
</html>