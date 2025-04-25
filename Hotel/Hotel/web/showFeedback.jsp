<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Management</title>
        <!-- Bootstrap CSS -->
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
        <style>
            /* Modern styling */
            .feedback-container {
                max-width: 1200px;
                margin: 40px auto;
                padding: 30px;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            }

            .page-header {
                margin-bottom: 30px;
                padding-bottom: 15px;
                border-bottom: 1px solid #eee;
            }

            .search-section {
                display: flex;
                gap: 15px;
                margin-bottom: 20px;
                flex-wrap: wrap;
            }

            .search-section .form-group {
                margin-bottom: 0;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .search-section label {
                margin-bottom: 0;
                font-weight: 500;
            }

            .feedback-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                margin-top: 20px;
            }

            .feedback-table th {
                background-color: #f8f9fa;
                color: #495057;
                font-weight: 600;
                padding: 12px 15px;
                border-top: 1px solid #dee2e6;
                border-bottom: 2px solid #dee2e6;
            }

            .feedback-table td {
                padding: 12px 15px;
                vertical-align: top;
                border-bottom: 1px solid #dee2e6;
            }

            .feedback-table tr:hover td {
                background-color: #f8f9fa;
            }

            .rating {
                display: inline-flex;
                align-items: center;
            }

            .rating-stars {
                color: #ffc107;
                margin-right: 5px;
                white-space: nowrap;
                display: inline-block;
            }

            .feedback-content {
                max-width: 200px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .feedback-content:hover {
                white-space: normal;
                overflow: visible;
                position: absolute;
                background: white;
                padding: 10px;
                border: 1px solid #ddd;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                z-index: 100;
            }

            .action-buttons {
                display: flex;
                gap: 8px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .action-buttons .btn {
                padding: 5px 10px;
                font-size: 13px;
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
                margin: 0 5px;
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
                background-color: #007bff;
                border-color: #007bff;
            }

            .page-item.disabled .page-link {
                color: #6c757d;
                pointer-events: none;
                background-color: #fff;
                border-color: #dee2e6;
            }

            .page-item .page-link i {
                font-size: 14px;
            }

            /* Popup styles */
            .modal-overlay {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0,0,0,0.5);
                display: flex;
                align-items: center;
                justify-content: center;
                z-index: 1000;
                opacity: 0;
                visibility: hidden;
                transition: all 0.3s ease;
            }

            .modal-overlay.active {
                opacity: 1;
                visibility: visible;
            }

            .modal-content {
                background: #fff;
                border-radius: 8px;
                width: 90%;
                max-width: 600px;
                padding: 25px;
                box-shadow: 0 5px 20px rgba(0,0,0,0.2);
                transform: translateY(-20px);
                transition: transform 0.3s ease;
            }

            .modal-overlay.active .modal-content {
                transform: translateY(0);
            }

            .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
                padding-bottom: 15px;
                border-bottom: 1px solid #eee;
            }

            .modal-header h3 {
                margin: 0;
                font-size: 20px;
                color: #333;
            }

            .close-btn {
                background: none;
                border: none;
                font-size: 24px;
                cursor: pointer;
                color: #999;
            }

            .close-btn:hover {
                color: #333;
            }

            .form-group textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                min-height: 150px;
                resize: vertical;
            }

            .modal-footer {
                display: flex;
                justify-content: flex-end;
                gap: 10px;
                margin-top: 20px;
            }

            @media (max-width: 768px) {
                .search-section {
                    flex-direction: column;
                }

                .feedback-table {
                    display: block;
                    overflow-x: auto;
                }

                .action-buttons {
                    flex-direction: column;
                }

                .feedback-content:hover {
                    position: relative;
                    box-shadow: none;
                    border: none;
                    padding: 0;
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

        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Feedback Management</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Feedback</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->

        <div class="container">
            <div class="feedback-container">
                <div class="page-header">
                    <h2><i class="fa fa-comments"></i> Customer Feedback</h2>
                </div>

                <div class="search-section">
                    <div class="form-group">
                        <label for="search" >Search:</label>
                        <form action="searchFeedback" method="GET" class="d-flex">
                            <input type="text" name="txtSearch" value="${param.txtSearch}" class="form-control" placeholder="Search feedback..." required>
                            <button class="btn btn-primary ml-2"><i class="fa fa-search"></i></button>
                        </form>
                    </div>

                    <div class="form-group">
                        <label for="filter">Filter by Rating:</label>
                        <form action="filterFeedback" method="GET" class="d-flex">
                            <select name="txtFilter" class="form-control" required>
                                <option value="">Select rating</option>
                                <option value="1" ${param.txtFilter == '1' ? 'selected' : ''}>1 Star</option>
                                <option value="2" ${param.txtFilter == '2' ? 'selected' : ''}>2 Stars</option>
                                <option value="3" ${param.txtFilter == '3' ? 'selected' : ''}>3 Stars</option>
                                <option value="4" ${param.txtFilter == '4' ? 'selected' : ''}>4 Stars</option>
                                <option value="5" ${param.txtFilter == '5' ? 'selected' : ''}>5 Stars</option>
                            </select>
                            <button class="btn btn-secondary ml-2"><i class="fa fa-filter"></i></button>
                        </form>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="feedback-table">
                        <thead>
                            <tr>                                       
                                <th>Customer</th>
                                <th>Date</th>                      
                                <th>Feedback</th>  
                                <th>Rating</th>
                                <th>Room</th>
                                <th>Reply</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="feedbackTableBody">
                            <c:forEach items="${LIST_ADMIN_FFEDBACK}" var="feedback">
                                <tr>                       
                                    <td>${feedback.accountName}</td>
                                    <td>${feedback.feedbackDate}</td>
                                    <td class="feedback-content">${feedback.content}</td>
                                    <td>
                                        <div class="rating">
                                            <div class="rating-stars">
                                                <c:forEach begin="1" end="${feedback.rating}">
                                                    <i class="fa fa-star"></i>
                                                </c:forEach>
                                            </div>
                                            (${feedback.rating})
                                        </div>
                                    </td>
                                    <td>${feedback.roomName}</td>
                                    <td class="feedback-content">${feedback.replyComment}</td>   

                                    <td>
                                        <div class="action-buttons">
                                            <form action="feedbackAdmin" method="POST" class="d-inline">
                                                <input type="hidden" name="id" value="${feedback.feedbackId}">
                                                <button class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></button>
                                            </form>
                                            <c:if test="${feedback.replyComment == null}">
                                                <button class="btn btn-primary btn-sm" onclick="openPopupReply(${feedback.feedbackId})">
                                                    <i class="fa fa-reply"></i> Reply
                                                </button>   
                                            </c:if>
                                            <c:if test="${feedback.replyComment != null}">
                                                <button class="btn btn-info btn-sm" onclick="openPopupEdit(${feedback.feedbackId}, '${feedback.replyComment}')">
                                                    <i class="fa fa-edit"></i> Edit
                                                </button>   
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <div class="pagination-container">
                    <ul class="pagination" id="pagination">
                        <li class="page-item" id="prevPage">
                            <a class="page-link" href="#" aria-label="Previous">
                                <i class="fa fa-angle-left"></i>
                            </a>
                        </li>
                        <!-- Page numbers will be added dynamically by JavaScript -->
                        <li class="page-item" id="nextPage">
                            <a class="page-link" href="#" aria-label="Next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Reply Popup -->
        <div id="popupReply" class="modal-overlay">
            <div class="modal-content">
                <div class="modal-header">
                    <h3><i class="fa fa-reply"></i> Reply to Feedback</h3>
                    <button class="close-btn" onclick="closePopup()">&times;</button>
                </div>
                <form action="ReplyFeedback" method="POST">
                    <input type="hidden" name="txtId" id="txtId" />
                    <div class="form-group">
                        <label>Your Reply:</label>
                        <textarea name="content" placeholder="Write your reply here..."></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="closePopup()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Send Reply</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Edit Reply Popup -->
        <div id="popupEdit" class="modal-overlay">
            <div class="modal-content">
                <div class="modal-header">
                    <h3><i class="fa fa-edit"></i> Edit Reply</h3>
                    <button class="close-btn" onclick="closeEditPopup()">&times;</button>
                </div>
                <form action="EditReplyFeedback" method="POST">
                    <input type="hidden" name="txtId" id="editTxtId" />
                    <div class="form-group">
                        <label>Your Reply:</label>
                        <textarea name="content" id="editContent" placeholder="Edit your reply here..."></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="closeEditPopup()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Update Reply</button>
                    </div>
                </form>
            </div>
        </div>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
                            // Pagination functionality
                            document.addEventListener('DOMContentLoaded', function () {
                                const rowsPerPage = 10;
                                const rows = document.querySelectorAll('#feedbackTableBody tr');
                                const pageCount = Math.ceil(rows.length / rowsPerPage);
                                const pagination = document.getElementById('pagination');
                                const prevPage = document.getElementById('prevPage');
                                const nextPage = document.getElementById('nextPage');

                                let currentPage = 1;

                                // Function to show rows for current page
                                function showPage(page) {
                                    const start = (page - 1) * rowsPerPage;
                                    const end = start + rowsPerPage;

                                    rows.forEach((row, index) => {
                                        row.style.display = (index >= start && index < end) ? '' : 'none';
                                    });

                                    // Update active page in pagination
                                    document.querySelectorAll('.page-item').forEach(item => {
                                        item.classList.remove('active');
                                        if (item.querySelector('.page-link').textContent == page) {
                                            item.classList.add('active');
                                        }
                                    });

                                    // Enable/disable prev/next buttons
                                    prevPage.classList.toggle('disabled', page === 1);
                                    nextPage.classList.toggle('disabled', page === pageCount);

                                    currentPage = page;
                                }

                                // Create page number links
                                for (let i = 1; i <= pageCount; i++) {
                                    const pageItem = document.createElement('li');
                                    pageItem.className = 'page-item' + (i === 1 ? ' active' : '');
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

                                // Previous page button
                                prevPage.querySelector('.page-link').addEventListener('click', function (e) {
                                    e.preventDefault();
                                    if (currentPage > 1) {
                                        showPage(currentPage - 1);
                                    }
                                });

                                // Next page button
                                nextPage.querySelector('.page-link').addEventListener('click', function (e) {
                                    e.preventDefault();
                                    if (currentPage < pageCount) {
                                        showPage(currentPage + 1);
                                    }
                                });

                                // Show first page initially
                                showPage(1);

                                // Popup functions
                                window.openPopupReply = function (id) {
                                    document.getElementById('txtId').value = id;
                                    document.getElementById('popupReply').classList.add('active');
                                };

                                window.closePopup = function () {
                                    document.getElementById('popupReply').classList.remove('active');
                                };

                                window.openPopupEdit = function (id, content) {
                                    document.getElementById('editTxtId').value = id;
                                    document.getElementById('editContent').value = content;
                                    document.getElementById('popupEdit').classList.add('active');
                                };

                                window.closeEditPopup = function () {
                                    document.getElementById('popupEdit').classList.remove('active');
                                };

                                // Show success messages
                                if (${requestScope.REPLY_SUCUESS != null}) {
                                    swal("Success", "Reply sent successfully!", "success");
                                }

                                if (${requestScope.EDIT_SUCCESS != null}) {
                                    swal("Success", "Reply updated successfully!", "success");
                                }
                            });
        </script>
    </body>
</html>