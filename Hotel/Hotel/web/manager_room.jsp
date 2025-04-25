<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="stylesheet" href="css/room_bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <style>
            /* Enhanced Modal Styles */
            .modal-enhanced {
                display: none;
                background: rgba(0,0,0,0.6);
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 9999;
                overflow-y: auto;
            }

            .modal-dialog-enhanced {
                max-width: 700px;
                margin: 2rem auto;
                animation: modalFadeIn 0.3s ease-out;
            }

            .modal-content-enhanced {
                border-radius: 10px;
                border: none;
                box-shadow: 0 5px 20px rgba(0,0,0,0.2);
            }

            .modal-header-enhanced {
                background: linear-gradient(135deg, #3a7bd5, #00d2ff);
                color: white;
                border-radius: 10px 10px 0 0;
                padding: 1.5rem;
                border-bottom: none;
            }

            .modal-title-enhanced {
                font-weight: 600;
                font-size: 1.5rem;
            }

            .modal-body-enhanced {
                padding: 2rem;
            }

            .modal-footer-enhanced {
                border-top: 1px solid #eee;
                padding: 1.5rem;
                background: #f9f9f9;
                border-radius: 0 0 10px 10px;
            }

            .close-enhanced {
                color: white;
                opacity: 0.8;
                font-size: 1.8rem;
                transition: all 0.2s;
            }

            .close-enhanced:hover {
                opacity: 1;
                transform: scale(1.1);
            }

            .form-group-enhanced label {
                font-weight: 500;
                margin-bottom: 0.5rem;
                color: #555;
            }

            .form-control-enhanced {
                border-radius: 5px;
                padding: 0.8rem 1rem;
                border: 1px solid #ddd;
                transition: all 0.3s;
            }

            .form-control-enhanced:focus {
                border-color: #3a7bd5;
                box-shadow: 0 0 0 0.2rem rgba(58, 123, 213, 0.25);
            }

            @keyframes modalFadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Button enhancements */
            .btn-primary-enhanced {
                background: linear-gradient(135deg, #3a7bd5, #00d2ff);
                border: none;
                padding: 0.6rem 1.5rem;
                font-weight: 500;
                transition: all 0.3s;
            }

            .btn-primary-enhanced:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(58, 123, 213, 0.4);
            }

            .btn-secondary-enhanced {
                background: #f1f1f1;
                color: #555;
                border: none;
                padding: 0.6rem 1.5rem;
                font-weight: 500;
                transition: all 0.3s;
            }

            .btn-secondary-enhanced:hover {
                background: #e0e0e0;
                transform: translateY(-2px);
            }

            /* Notification styles */
            .notification {
                position: fixed;
                top: 20px;
                right: 20px;
                padding: 15px 25px;
                border-radius: 5px;
                color: white;
                font-weight: 500;
                box-shadow: 0 4px 12px rgba(0,0,0,0.15);
                z-index: 9999;
                display: flex;
                align-items: center;
                transform: translateX(150%);
                transition: transform 0.3s ease-out;
            }

            .notification.show {
                transform: translateX(0);
            }

            .notification.success {
                background: linear-gradient(135deg, #4CAF50, #81C784);
            }

            .notification.error {
                background: linear-gradient(135deg, #F44336, #E57373);
            }

            .notification i {
                margin-right: 10px;
                font-size: 1.2rem;
            }

            /* Confirmation Modal */
            .confirmation-modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.5);
                z-index: 9998;
                justify-content: center;
                align-items: center;
            }

            .confirmation-content {
                background: white;
                padding: 2rem;
                border-radius: 10px;
                max-width: 500px;
                width: 90%;
                box-shadow: 0 5px 20px rgba(0,0,0,0.2);
                text-align: center;
            }

            .confirmation-buttons {
                display: flex;
                justify-content: center;
                gap: 15px;
                margin-top: 20px;
            }

            .confirmation-title {
                font-size: 1.3rem;
                margin-bottom: 15px;
                color: #333;
            }

            .confirmation-message {
                color: #555;
                margin-bottom: 20px;
            }

            /* Star Rating styles - Updated to match customer page */
            .rating-stars {
                display: inline-block;
                color: #ffc107;
                font-size: 16px;
                position: relative;
            }
            .rating-value {
                font-size: 14px;
                color: #6c757d;
                margin-left: 5px;
                vertical-align: middle;
            }
            .no-rating {
                font-style: italic;
                color: #6c757d;
            }

            /* Star rating style for partial stars - Added from customer page */
            .stars-container {
                position: relative;
                display: inline-block;
                color: #ced4da; /* Gray for empty stars */
            }

            .stars-filled {
                position: absolute;
                top: 0;
                left: 0;
                white-space: nowrap;
                overflow: hidden;
                color: #ffc107; /* Yellow/gold for filled stars */
            }

            /* Error message style */
            .error-message {
                color: #dc3545;
                font-size: 0.875rem;
                margin-top: 0.25rem;
                display: none;
            }

            /* Image validation error */
            .image-error {
                color: #dc3545;
                font-size: 0.875rem;
                margin-top: 0.25rem;
                display: none;
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

        <!-- Success/Error Notifications -->
        <c:if test="${not empty sessionScope.successMessage}">
            <div class="notification success show" id="successNotification">
                <i class="fa fa-check-circle"></i> ${sessionScope.successMessage}
            </div>
            <c:remove var="successMessage" scope="session" />
        </c:if>
        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="notification error show" id="errorNotification">
                <i class="fa fa-exclamation-circle"></i> ${sessionScope.errorMessage}
            </div>
            <c:remove var="errorMessage" scope="session" />
        </c:if>

        <!-- Confirmation Modal -->
        <div class="confirmation-modal" id="confirmationModal">
            <div class="confirmation-content">
                <h4 class="confirmation-title">Confirm Deletion</h4>
                <p class="confirmation-message">Are you sure you want to delete this room? This action cannot be undone.</p>
                <div class="confirmation-buttons">
                    <button class="btn btn-secondary-enhanced" onclick="closeConfirmationModal()">Cancel</button>
                    <button class="btn btn-primary-enhanced" id="confirmDeleteBtn">Delete</button>
                </div>
            </div>
        </div>

        <section class="breadcrumb_area">
            <div class="overlay bg-parallax"></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Rooms</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>

        <section class="accomodation_area section_gap">
            <div class="container">
                <!-- Add Room Button as Modal Trigger -->
                <div class="d-flex justify-content-end mb-4">
                    <button class="btn btn-success rounded py-2 px-4" onclick="openAddRoomModal()" style="font-weight: 500;">
                        <i class="fa fa-plus mr-2"></i>Add Room
                    </button>
                </div>

                <div class="row g-4">
                    <c:forEach items="${sessionScope.listR}" var="room">
                        <div class="col-lg-4 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="room-item shadow rounded overflow-hidden">
                                <div class="position-relative">
                                    <img class="img-fluid" src="images/${room.getImage()}" alt="" style="height: 223px; width: 100%; object-fit: cover;">
                                    <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">
                                        <fmt:formatNumber value="${room.getPrice()}" pattern="#,##0" /> VND/Night
                                    </small>
                                </div>
                                <div class="p-4 mt-2">
                                    <div class="d-flex justify-content-between mb-3">
                                        <h5 class="mb-0">${room.getNameRoomType()}</h5>
                                        <!-- Updated Rating Stars Display -->
                                        <div class="rating-stars">
                                            <c:if test="${room.getAverageRating() != null && room.getAverageRating() > 0}">
                                                <c:set var="rating" value="${room.getAverageRating()}" />
                                                <c:set var="percent" value="${(rating / 5) * 100}" />
                                                <div class="stars-container">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <div class="stars-filled" style="width: ${percent}%;">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                </div>
                                                <span class="rating-value">(${String.format('%.1f', room.getAverageRating())})</span>
                                            </c:if>
                                            <c:if test="${room.getAverageRating() == null || room.getAverageRating() == 0}">
                                                <span class="no-rating">Chưa có đánh giá</span>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="d-flex mb-3">
                                        <small class="border-end me-3 pe-3"><i class="fa fa-user text-primary me-2"></i>${room.getMaxPerson()} Person</small>
                                        <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>${room.getNumberOfBed()} Bed</small>
                                        <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>${room.getNumberOfBath()} Bath</small>
                                        <small class="border-end me-3 pe-3"><i class="fa fa-home text-primary me-2"></i>${room.getTotalRoom()} Rooms</small>
                                        <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                    </div>
                                    <p class="text-body mb-3">${room.getContent()}</p>
                                    <div class="d-flex justify-content-between">
                                        <a class="btn btn-sm btn-primary rounded py-2 px-4" href="#" onclick="openEditRoomModal('${room.getIDRoomType()}', '${room.getNameRoomType()}', '${room.getMaxPerson()}', '${room.getNumberOfBed()}', '${room.getNumberOfBath()}', '${room.getPrice()}', '${room.getTotalRoom()}', '${room.getContent()}', '${room.getImage()}'); return false;">
                                            <i class="fa fa-edit mr-1"></i>Edit
                                        </a>
                                        <button class="btn btn-sm btn-dark rounded py-2 px-4" onclick="showConfirmationModal('${room.getIDRoomType()}')">
                                            <i class="fa fa-trash mr-1"></i>Delete
                                        </button>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </c:forEach> 
                </div>
            </div>
        </section>

        <!-- Enhanced Modal Add Room -->
        <div class="modal-enhanced" id="addRoomModal">
            <div class="modal-dialog modal-dialog-enhanced">
                <div class="modal-content modal-content-enhanced">
                    <div class="modal-header modal-header-enhanced">
                        <h5 class="modal-title modal-title-enhanced">Add New Room</h5>
                        <button type="button" class="close close-enhanced" onclick="closeAddRoomModal()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="addNewRoomType" method="post" enctype="multipart/form-data" id="addRoomForm">
                        <div class="modal-body modal-body-enhanced">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-group-enhanced">
                                        <label>Room Name</label>
                                        <input type="text" class="form-control form-control-enhanced" name="name" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-group-enhanced">
                                        <label>Price (VND)</label>
                                        <input type="text" class="form-control form-control-enhanced" name="price" id="addPrice" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group form-group-enhanced">
                                        <label>Max Persons</label>
                                        <input type="number" class="form-control form-control-enhanced" name="maxPerson" min="1" value="2" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group form-group-enhanced">
                                        <label>Number of Beds</label>
                                        <input type="number" class="form-control form-control-enhanced" name="bed" id="addBed" min="1" required>
                                        <small class="error-message" id="bedError">Number of beds must be at least 1</small>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group form-group-enhanced">
                                        <label>Number of Baths</label>
                                        <input type="number" class="form-control form-control-enhanced" name="bath" id="addBath" min="1" required>
                                        <small class="error-message" id="bathError">Number of baths must be at least 1</small>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-group-enhanced">
                                        <label>Total Rooms</label>
                                        <input type="number" class="form-control form-control-enhanced" name="totalRoom" min="1" value="1" required>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group form-group-enhanced">
                                <label>Description</label>
                                <textarea class="form-control form-control-enhanced" name="content" rows="4" required></textarea>
                            </div>

                            <div class="form-group form-group-enhanced">
                                <label>Room Image</label>
                                <div class="custom-file">
                                    <input type="file" class="form-control form-control-enhanced" name="image" id="roomImage" accept="image/*" required>
                                    <small class="form-text text-muted">Recommended size: 800x600px</small>
                                    <small class="image-error" id="imageError">Please select a valid image file (JPEG, PNG, GIF)</small>
                                </div>
                                <div class="mt-2" id="imagePreview" style="display: none;">
                                    <img id="previewImg" src="#" alt="Preview" style="max-width: 100%; max-height: 200px; border-radius: 5px; border: 1px solid #ddd; margin-top: 10px;">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer modal-footer-enhanced">
                            <button type="button" class="btn btn-secondary-enhanced" onclick="closeAddRoomModal()">
                                <i class="fa fa-times mr-1"></i>Cancel
                            </button>
                            <button type="submit" class="btn btn-primary-enhanced">
                                <i class="fa fa-plus mr-1"></i>Add Room
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Enhanced Modal Edit Room -->
        <div class="modal-enhanced" id="editRoomModal">
            <div class="modal-dialog modal-dialog-enhanced">
                <div class="modal-content modal-content-enhanced">
                    <div class="modal-header modal-header-enhanced">
                        <h5 class="modal-title modal-title-enhanced">Edit Room</h5>
                        <button type="button" class="close close-enhanced" onclick="closeEditRoomModal()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="editRoomType" method="post" enctype="multipart/form-data" id="editRoomForm">
                        <div class="modal-body modal-body-enhanced">
                            <input type="hidden" id="editRoomId" name="IDRoomType">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-group-enhanced">
                                        <label>Room Name</label>
                                        <input type="text" class="form-control form-control-enhanced" id="editRoomName" name="NameRoomType" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-group-enhanced">
                                        <label>Price (VND)</label>
                                        <input type="text" class="form-control form-control-enhanced" id="editRoomPrice" name="Price" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group form-group-enhanced">
                                        <label>Max Persons</label>
                                        <input type="number" class="form-control form-control-enhanced" id="editRoomMaxPerson" name="MaxPerson" min="1" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group form-group-enhanced">
                                        <label>Number of Beds</label>
                                        <input type="number" class="form-control form-control-enhanced" id="editRoomBed" name="NumberOfBed" min="1" required>
                                        <small class="error-message" id="editBedError">Number of beds must be at least 1</small>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group form-group-enhanced">
                                        <label>Number of Baths</label>
                                        <input type="number" class="form-control form-control-enhanced" id="editRoomBath" name="NumberOfBath" min="1" required>
                                        <small class="error-message" id="editBathError">Number of baths must be at least 1</small>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group form-group-enhanced">
                                <label>Total Rooms</label>
                                <input type="number" class="form-control form-control-enhanced" id="editTotalRoom" name="TotalRoom" min="1" required>
                            </div>

                            <div class="form-group form-group-enhanced">
                                <label>Description</label>
                                <textarea class="form-control form-control-enhanced" id="editRoomContent" name="Content" rows="4" required></textarea>
                            </div>

                            <div class="form-group form-group-enhanced">
                                <label>Current Image</label>
                                <div class="mt-2 mb-3">
                                    <img id="currentImage" src="#" alt="Current Image" style="max-width: 100%; max-height: 150px; border-radius: 5px; border: 1px solid #ddd;">
                                </div>
                                <label>Change Image (Optional)</label>
                                <div class="custom-file">
                                    <input type="file" class="form-control form-control-enhanced" name="image" id="editRoomImage" accept="image/*">
                                    <small class="form-text text-muted">Leave empty to keep current image</small>
                                    <small class="image-error" id="editImageError">Please select a valid image file (JPEG, PNG, GIF)</small>
                                </div>
                                <div class="mt-2" id="editImagePreview" style="display: none;">
                                    <img id="editPreviewImg" src="#" alt="Preview" style="max-width: 100%; max-height: 150px; border-radius: 5px; border: 1px solid #ddd; margin-top: 10px;">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer modal-footer-enhanced">
                            <button type="button" class="btn btn-secondary-enhanced" onclick="closeEditRoomModal()">
                                <i class="fa fa-times mr-1"></i>Cancel
                            </button>
                            <button type="submit" class="btn btn-primary-enhanced">
                                <i class="fa fa-save mr-1"></i>Save Changes
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="/includes/footer.jsp" %>

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
        <script>
                                // Room ID to be deleted
                                let roomIdToDelete = null;

                                // Add Room Modal functions
                                function openAddRoomModal() {
                                    document.getElementById("addRoomModal").style.display = "block";
                                    document.body.style.overflow = "hidden";
                                    // Reset form and error messages
                                    document.getElementById("addRoomForm").reset();
                                    document.querySelectorAll('#addRoomForm .error-message, #addRoomForm .image-error').forEach(el => el.style.display = 'none');
                                    document.getElementById("imagePreview").style.display = "none";
                                }

                                function closeAddRoomModal() {
                                    document.getElementById("addRoomModal").style.display = "none";
                                    document.body.style.overflow = "auto";
                                }

                                // Edit Room Modal functions
                                function openEditRoomModal(id, name, maxPerson, bed, bath, price, totalRoom, content, image) {
                                    // Set values in the edit form
                                    document.getElementById("editRoomId").value = id;
                                    document.getElementById("editRoomName").value = name;
                                    document.getElementById("editRoomMaxPerson").value = maxPerson;
                                    document.getElementById("editRoomBed").value = bed;
                                    document.getElementById("editRoomBath").value = bath;
                                    document.getElementById("editRoomPrice").value = formatVND(price);
                                    document.getElementById("editTotalRoom").value = totalRoom;
                                    document.getElementById("editRoomContent").value = content;
                                    document.getElementById("currentImage").src = "images/" + image;

                                    // Reset error messages
                                    document.querySelectorAll('#editRoomForm .error-message, #editRoomForm .image-error').forEach(el => el.style.display = 'none');
                                    document.getElementById("editImagePreview").style.display = "none";

                                    // Show the modal
                                    document.getElementById("editRoomModal").style.display = "block";
                                    document.body.style.overflow = "hidden";
                                }

                                function closeEditRoomModal() {
                                    document.getElementById("editRoomModal").style.display = "none";
                                    document.body.style.overflow = "auto";
                                    document.getElementById("editImagePreview").style.display = "none";
                                }

                                // Show confirmation modal for deletion
                                function showConfirmationModal(roomId) {
                                    roomIdToDelete = roomId;
                                    document.getElementById("confirmationModal").style.display = "flex";
                                    document.body.style.overflow = "hidden";
                                }

                                function closeConfirmationModal() {
                                    document.getElementById("confirmationModal").style.display = "none";
                                    document.body.style.overflow = "auto";
                                    roomIdToDelete = null;
                                }

                                // Handle delete confirmation
                                document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
                                    if (roomIdToDelete) {
                                        window.location.href = 'delete?IDRoomType=' + roomIdToDelete;
                                    }
                                });

                                // Close modals when clicking outside
                                window.onclick = function (event) {
                                    const addModal = document.getElementById('addRoomModal');
                                    const editModal = document.getElementById('editRoomModal');
                                    const confirmModal = document.getElementById('confirmationModal');

                                    if (event.target == addModal) {
                                        closeAddRoomModal();
                                    }
                                    if (event.target == editModal) {
                                        closeEditRoomModal();
                                    }
                                    if (event.target == confirmModal) {
                                        closeConfirmationModal();
                                    }
                                }

                                // Prevent modal content clicks from closing modal
                                document.querySelectorAll('.modal-content-enhanced, .confirmation-content').forEach(content => {
                                    content.addEventListener('click', function (e) {
                                        e.stopPropagation();
                                    });
                                });

                                // Add Room Image preview functionality
                                document.getElementById('roomImage').addEventListener('change', function (e) {
                                    const preview = document.getElementById('previewImg');
                                    const previewContainer = document.getElementById('imagePreview');
                                    const imageError = document.getElementById('imageError');

                                    // Validate image file type
                                    const file = this.files[0];
                                    const validImageTypes = ['image/jpeg', 'image/png', 'image/gif'];

                                    if (file && validImageTypes.includes(file.type)) {
                                        imageError.style.display = 'none';
                                        const reader = new FileReader();

                                        reader.onload = function (e) {
                                            preview.src = e.target.result;
                                            previewContainer.style.display = 'block';
                                        }

                                        reader.readAsDataURL(file);
                                    } else {
                                        previewContainer.style.display = 'none';
                                        if (file) {
                                            imageError.style.display = 'block';
                                        } else {
                                            imageError.style.display = 'none';
                                        }
                                    }
                                });

                                // Edit Room Image preview functionality
                                document.getElementById('editRoomImage').addEventListener('change', function (e) {
                                    const preview = document.getElementById('editPreviewImg');
                                    const previewContainer = document.getElementById('editImagePreview');
                                    const imageError = document.getElementById('editImageError');

                                    // Validate image file type
                                    const file = this.files[0];
                                    const validImageTypes = ['image/jpeg', 'image/png', 'image/gif'];

                                    if (file && validImageTypes.includes(file.type)) {
                                        imageError.style.display = 'none';
                                        const reader = new FileReader();

                                        reader.onload = function (e) {
                                            preview.src = e.target.result;
                                            previewContainer.style.display = 'block';
                                        }

                                        reader.readAsDataURL(file);
                                    } else {
                                        previewContainer.style.display = 'none';
                                        if (file) {
                                            imageError.style.display = 'block';
                                        } else {
                                            imageError.style.display = 'none';
                                        }
                                    }
                                });

                                // Auto-hide notifications after 5 seconds
                                setTimeout(function () {
                                    const notifications = document.querySelectorAll('.notification.show');
                                    notifications.forEach(notification => {
                                        notification.classList.remove('show');
                                        setTimeout(() => notification.remove(), 300);
                                    });
                                }, 5000);

                                function formatVND(amount) {
                                    return new Intl.NumberFormat('vi-VN').format(amount);
                                }

                                // Format price input with VND formatting
                                document.querySelectorAll('#addPrice, #editRoomPrice').forEach(input => {
                                    input.addEventListener('input', function (e) {
                                        // Get raw number value
                                        let value = this.value.replace(/[^0-9]/g, '');

                                        // Format with dots
                                        if (value.length > 0) {
                                            this.value = formatVND(value);
                                        }
                                    });
                                });

                                // Validate forms before submission
                                document.getElementById('addRoomForm').addEventListener('submit', function (e) {
                                    // Validate number inputs
                                    const bed = parseInt(document.getElementById('addBed').value);
                                    const bath = parseInt(document.getElementById('addBath').value);
                                    const price = parseInt(document.getElementById('addPrice').value.replace(/[^0-9]/g, ''));
                                    const imageInput = document.getElementById('roomImage');
                                    const imageError = document.getElementById('imageError');

                                    let isValid = true;

                                    // Validate beds
                                    if (bed < 1) {
                                        document.getElementById('bedError').style.display = 'block';
                                        isValid = false;
                                    } else {
                                        document.getElementById('bedError').style.display = 'none';
                                    }

                                    // Validate baths
                                    if (bath < 1) {
                                        document.getElementById('bathError').style.display = 'block';
                                        isValid = false;
                                    } else {
                                        document.getElementById('bathError').style.display = 'none';
                                    }

                                    // Validate image
                                    const file = imageInput.files[0];
                                    const validImageTypes = ['image/jpeg', 'image/png', 'image/gif'];

                                    if (!file || !validImageTypes.includes(file.type)) {
                                        imageError.style.display = 'block';
                                        isValid = false;
                                    } else {
                                        imageError.style.display = 'none';
                                    }

                                    if (!isValid) {
                                        e.preventDefault();
                                    } else {
                                        // Convert formatted price back to raw number before submission
                                        document.getElementById('addPrice').value = price;
                                    }
                                });

                                document.getElementById('editRoomForm').addEventListener('submit', function (e) {
                                    // Validate number inputs
                                    const bed = parseInt(document.getElementById('editRoomBed').value);
                                    const bath = parseInt(document.getElementById('editRoomBath').value);
                                    const price = parseInt(document.getElementById('editRoomPrice').value.replace(/[^0-9]/g, ''));
                                    const imageInput = document.getElementById('editRoomImage');
                                    const imageError = document.getElementById('editImageError');

                                    let isValid = true;

                                    // Validate beds
                                    if (bed < 1) {
                                        document.getElementById('editBedError').style.display = 'block';
                                        isValid = false;
                                    } else {
                                        document.getElementById('editBedError').style.display = 'none';
                                    }

                                    // Validate baths
                                    if (bath < 1) {
                                        document.getElementById('editBathError').style.display = 'block';
                                        isValid = false;
                                    } else {
                                        document.getElementById('editBathError').style.display = 'none';
                                    }

                                    // Validate image if new one is selected
                                    const file = imageInput.files[0];
                                    if (file) {
                                        const validImageTypes = ['image/jpeg', 'image/png', 'image/gif'];
                                        if (!validImageTypes.includes(file.type)) {
                                            imageError.style.display = 'block';
                                            isValid = false;
                                        } else {
                                            imageError.style.display = 'none';
                                        }
                                    }

                                    if (!isValid) {
                                        e.preventDefault();
                                    } else {
                                        // Convert formatted price back to raw number before submission
                                        document.getElementById('editRoomPrice').value = price;
                                    }
                                });

                                // Prevent negative numbers in number inputs
                                document.querySelectorAll('input[type="number"]').forEach(input => {
                                    input.addEventListener('change', function () {
                                        if (this.value < this.min) {
                                            this.value = this.min;
                                        }
                                    });
                                });
        </script>
    </body>
</html>