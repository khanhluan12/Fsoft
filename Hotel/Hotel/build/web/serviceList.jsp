<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Service" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Service Management</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="vendors/linericon/style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <style>
            /* Cải thiện kiểu dáng bảng */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
                color: #333;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            td a {
                color: #007bff;
                text-decoration: none;
            }

            td a:hover {
                text-decoration: underline;
            }

            .table-container {
                margin: 20px auto;
                max-width: 1000px;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Thêm kiểu cho tiêu đề bảng */
            .table-title {
                font-size: 24px;
                color: #333;
                font-weight: bold;
                margin-bottom: 20px;
            }

            /* Cải thiện kiểu dáng các trang */
            .page-number {
                transition: all 0.2s ease-in-out;
                cursor: pointer;
            }

            .page-number:hover {
                color: #007bff;
            }
            /* Giới hạn chiều rộng cột Action */
            td.actions-column, th.actions-column {
                width: 220px;
                text-align: center;
            }

            /* Dàn đều các nút hành động */
            .action-buttons {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                gap: 5px;
            }
            td.service-column, th.service-column {
                max-width: 200px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

            td.service-column:hover {
                white-space: normal;
                background-color: #f0f0f0;
                z-index: 1;
                position: relative;
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
        <div class="table-container">
            <h1 class="table-title">List of Services</h1>
            <c:if test="${not empty message}">
                <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
                    ${message}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span>&times;</span>
                    </button>
                </div>
            </c:if>

            <button class="btn btn-success mb-3" onclick="openAddServiceModal()">+ Add New Service</button>
            <table>
                <tr>
                    <th>ID</th>
                    <th class="service-column">Service Name</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="service" items="${services}">
                    <tr class="shift-row">
                        <td>${service.serviceID}</td>
                        <td class="service-column" title="${service.serviceName}">${service.serviceName}</td>

                        <td class="actions-column">
                            <div class="action-buttons">
                                <a href="ServiceDetailServlet?id=${service.serviceID}" class="btn btn-info btn-sm">Details</a>
                                <button class="btn btn-warning btn-sm" onclick="openEditServiceModal(${service.serviceID}, '${service.serviceName}')">Edit</button>
                                <a href="ManageService?action=deleteService&id=${service.serviceID}" class="btn btn-danger btn-sm"
                                   onclick="return confirm('Delete this service?')">Delete</a>
                            </div>
                        </td>



                    </tr>
                </c:forEach>
            </table>
            <div id="pagination" class="text-center mt-3"></div>
            <!-- Modal Form -->
            <div class="modal fade" id="serviceModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <form action="ManageService" method="post" class="modal-content" id="serviceForm">
                        <input type="hidden" name="action" id="actionType">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitle">Service</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="id" id="serviceId">
                            <div class="form-group">
                                <label>Service Name</label>
                                <input type="text" class="form-control" name="serviceName" id="serviceName" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
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
                   function openAddServiceModal() {
                       document.getElementById("modalTitle").innerText = "Add New Service";
                       document.getElementById("serviceId").value = "";
                       document.getElementById("serviceName").value = "";
                       document.getElementById("actionType").value = "addService"; // <-- thêm dòng này
                       $('#serviceModal').modal('show');
                   }

                   function openEditServiceModal(id, name) {
                       document.getElementById("modalTitle").innerText = "Edit Service";
                       document.getElementById("serviceId").value = id;
                       document.getElementById("serviceName").value = name;
                       document.getElementById("actionType").value = "updateService"; // <-- và dòng này
                       $('#serviceModal').modal('show');
                   }
        </script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const rowsPerPage = 5; 
    const rows = document.querySelectorAll(".shift-row");
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

        window.scrollTo({ top: document.querySelector(".table").offsetTop - 100, behavior: "smooth" });
    }

    function setupPagination() {
        let pagination = document.getElementById("pagination");
        pagination.innerHTML = "";

        if (totalPages > 1) {
            for (let i = 1; i <= totalPages; i++) {
                let btn = document.createElement("button");
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
