<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.ServiceItem" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Service Details</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/style.css">

        <style>
            .card {
                background-color: #ffffff;
                border: 2px solid #dee2e6;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
                transition: transform 0.3s ease;
            }

            .card:hover {
                transform: scale(1.02);
                box-shadow: 0 10px 18px rgba(0, 0, 0, 0.2);
            }

            .image-container {
                height: 200px;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: rgba(249, 249, 249, 0.5);
            }

            .row > .col-sm-6 {
                margin-bottom: 30px;
            }

            #previewImg {
                width: 100%;
                max-height: 200px;
                object-fit: scale-down;
                display: none;
                margin-top: 10px;
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
                    <h2 class="page-cover-tittle">Booking</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Services</li>
                    </ol>
                </div>
            </div>
        </section>

        <div class="container my-5">
            <c:if test="${not empty message}">
                <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
                    ${message}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span>&times;</span>
                    </button>
                </div>
            </c:if>

           <p class="text-center">     
    <button class="btn btn-success mb-4"
            onclick="openAddModal(${serviceID})">
        + Add New Item
    </button>
</p>

            <c:if test="${not empty service}">
                <h2 class="text-center mb-4">Service Details</h2>
                <div class="row">
                    <c:forEach var="item" items="${service}">

                        <div class="col-sm-6 col-md-4">
                            <div class="card shadow rounded-4 border-0 mb-4 h-100 d-flex flex-column">
                                <div class="card-body d-flex flex-column">
                                    <h4 class="card-title text-primary mb-3">${item.itemName}</h4>
                                    <p class="fw-bold text-dark fs-5 mb-3"><span class="text-secondary">Price:</span> $${item.price}</p>
                                    <div class="mt-auto">
                                        <div class="image-container">
                                            <img src="${item.imageURL}" alt="Service Image" class="img-fluid"
                                                 style="max-height: 100%; max-width: 100%; object-fit: scale-down;">
                                        </div>
                                        <p class="mt-3">

                                            <button class="btn btn-sm btn-warning"
                                                    onclick="openEditModal(${item.itemID}, '${item.itemName}', ${item.price}, '${item.imageURL}', ${item.serviceID})">
                                                Edit
                                            </button>

                                            <a href="ManageService?action=delete&id=${item.itemID}" class="btn btn-sm btn-danger"
                                               onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <c:if test="${empty service}">
                <div class="alert alert-warning text-center">
                    <strong>No service found.</strong>
                </div>
            </c:if> 
        </div>

        <!-- Modal -->
        <div class="modal fade" id="serviceModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <form action="ManageService" method="post" class="modal-content" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitle">Service</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id" id="serviceId">
                        <input type="hidden" name="oldImageURL" id="oldImageURL">
                        <input type="hidden" name="serviceID" id="serviceID">
                        <div class="form-group">
                            <label>Item Name</label>
                            <input type="text" class="form-control" name="itemName" id="itemName" required>
                        </div>

                        <div class="form-group">
                            <label>Price ($)</label>
                            <input type="number" step="0.01" class="form-control" name="price" id="price" required>
                        </div>

                        <div class="form-group">
                            <label>Image</label>
                            <input type="file" class="form-control-file" name="image" id="image" accept="image/*">
                            <img id="previewImg" src="" alt="Preview" style="max-width: 100px; max-height: 100px; margin-top: 10px; border: 1px solid #ddd;">

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Save</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="/includes/footer.jsp" %>

        <!-- Scripts -->
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
                                                   function openAddModal(serviceID) {
                                                       document.getElementById("modalTitle").innerText = "Add New Service";
                                                       document.getElementById("serviceId").value = "";
                                                       document.getElementById("itemName").value = "";
                                                       document.getElementById("price").value = "";
                                                       document.getElementById("oldImageURL").value = "";
                                                       document.getElementById("previewImg").style.display = "none";
                                                       document.getElementById("previewImg").src = "";
                                                       document.getElementById("image").required = true;
                                                       document.getElementById("serviceID").value = serviceID; // Gán ở đây nè
                                                       $('#serviceModal').modal('show');
                                                   }


                                                   function openEditModal(itemID, name, price, imageURL, serviceID) {
                                                       document.getElementById("modalTitle").innerText = "Edit Service";
                                                       document.getElementById("serviceId").value = itemID;
                                                       document.getElementById("itemName").value = name;
                                                       document.getElementById("price").value = price;
                                                       document.getElementById("oldImageURL").value = imageURL;
                                                       document.getElementById("serviceID").value = serviceID; // ✅ Gán serviceID
                                                       document.getElementById("previewImg").src = imageURL;
                                                       document.getElementById("previewImg").style.display = "block";
                                                       document.getElementById("image").required = false;
                                                       $('#serviceModal').modal('show');
                                                   }


                                                   document.getElementById("image").addEventListener("change", function (event) {
                                                       const [file] = event.target.files;
                                                       if (file) {
                                                           document.getElementById("previewImg").src = URL.createObjectURL(file);
                                                       }
                                                   });
        </script>
    </body>
</html>
