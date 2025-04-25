<%@ page import="java.util.List, model.ShiftSchedule" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Danh Sách Ca Làm</title>
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
        .shift-management-container {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
        }
        .shift-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }
        .shift-title {
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 0;
        }
        .shift-table {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.03);
        }
        .shift-table thead th {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 15px;
            font-weight: 500;
        }
        .shift-table tbody td {
            vertical-align: middle;
            padding: 12px 15px;
            border-color: #f1f1f1;
        }
        .shift-table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .shift-table tbody tr:hover {
            background-color: #f1f7fd;
        }
        .btn-add-shift {
            background-color: #27ae60;
            border: none;
            padding: 8px 20px;
            font-weight: 500;
            transition: all 0.3s;
        }
        .btn-add-shift:hover {
            background-color: #219653;
            transform: translateY(-2px);
        }
        .btn-edit {
            background-color: #3498db;
            border: none;
            padding: 5px 12px;
            margin-right: 5px;
        }
        .btn-delete {
            padding: 5px 12px;
        }
        .filter-container {
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.03);
        }
        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 25px;
        }
        .page-item.active .page-link {
            background-color: #3498db;
            border-color: #3498db;
        }
        .page-link {
            color: #3498db;
        }
        .modal-header {
            background-color: #3498db;
            color: white;
        }
        .modal-title {
            font-weight: 500;
        }
        .shift-time {
            font-weight: 500;
            color: #2c3e50;
        }
        .no-shifts {
            text-align: center;
            padding: 30px;
            color: #7f8c8d;
            font-size: 1.1rem;
        }
        .shift-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: 500;
            background-color: #e3f2fd;
            color: #1976d2;
        }
        .nice-select{
            margin-top: 30px;
            height:38px;
            text-align: center;
            align-items: center;
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
                        <li class="active">Shifts</li>
                    </ol>
                </div>
            </div>
        </section>
         <div class="container mt-4 mb-5">
        <div class="shift-management-container">
            <div class="shift-header">
                <h2 class="shift-title"><i class="fa fa-calendar-alt mr-2"></i>Shift list</h2>
                <button type="button" class="btn btn-success btn-add-shift" data-toggle="modal" data-target="#addShiftModal">
                    <i class="fa fa-plus mr-2"></i>Add shift
                </button>
            </div>
            
            <div class="filter-container">
                <div class="form-group row align-items-center">
                    <label for="filterDate" class="col-sm-2 col-form-label font-weight-bold">Search:</label>
                    <div class="col-sm-4">
                        <input type="date" class="form-control" id="filterDate">
                    </div>
                    <div class="col-sm-2">
                        <button class="btn btn-outline-secondary" id="clearFilter">
                            <i class="fa fa-times mr-1"></i>Clear
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table table-hover shift-table">
                    <thead class="thead-dark">
                        <tr>
                            <th>Shift</th>
                            <th>Start</th>
                            <th>End</th>
                            <th>Employee</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty shifts}">
                                <c:forEach var="shift" items="${shifts}">
                                    <tr class="shift-row" data-date="${shift.startDateTime}">
                                        <td><span class="shift-badge">${shift.shiftName}</span></td>
                                        <td class="shift-time">
                                            <fmt:formatDate value="${shift.startDateTime}" pattern="dd/MM/yyyy HH:mm" />
                                        </td>
                                        <td class="shift-time">
                                            <fmt:formatDate value="${shift.endDateTime}" pattern="dd/MM/yyyy HH:mm" />
                                        </td>
                                        <td>${shift.employeeName != null ? shift.employeeName : "<span class='text-muted'>Chưa phân công</span>"}</td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm btn-edit"
                                                    data-toggle="modal" data-target="#editShiftModal"
                                                    data-shiftid="${shift.shiftID}" 
                                                    data-shiftname="${shift.shiftName}"
                                                    data-starttime="${shift.startDateTime}" 
                                                    data-endtime="${shift.endDateTime}"
                                                    data-idaccount="${shift.IDAccount}"
                                                    data-employeename="${shift.employeeName}">
                                                <i class="fa fa-edit mr-1"></i>Edit
                                            </button>
                                            <form id="deleteShiftForm-${shift.shiftID}" action="ShiftServlet" method="POST" style="display:inline;" 
                                                  onsubmit="deleteShift(event, ${shift.shiftID});">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="shiftID" value="${shift.shiftID}">
                                                <button type="submit" class="btn btn-danger btn-sm">
                                                    <i class="fa fa-trash mr-1"></i>Delete
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" class="no-shifts">
                                        <i class="fa fa-calendar-times fa-3x mb-3 text-muted"></i>
                                        <p>No shift found</p>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            
            <div class="pagination-container">
                <nav aria-label="Page navigation">
                    <ul class="pagination" id="pagination">
                        <!-- Pagination will be inserted here by JavaScript -->
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    
    <%@include file="/includes/footer.jsp" %>

    <!-- Add Shift Modal -->
    <div class="modal fade" id="addShiftModal" tabindex="-1" role="dialog" aria-labelledby="addShiftModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addShiftModalLabel"><i class="fa fa-plus-circle mr-2"></i>Add shift</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="addShiftForm">
                        <input type="hidden" name="action" value="add">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="shiftName">Shift</label>
                                <input type="text" class="form-control" id="shiftName" name="shiftName" required readonly>
                            </div>
                            <div class="form-group col-md-6" >
                                <label for="IDAccount"></label>
                                <select class="form-control" id="IDAccount" name="IDAccount" >
                                    <option value="">-- Select Employee --</option>
                                    <c:forEach var="employee" items="${employees}">
                                        <option value="${employee.IDAccount}">${employee.fullName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="startTime">Start</label>
                                <input type="datetime-local" class="form-control" id="startTime" name="startTime" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="endTime">End</label>
                                <input type="datetime-local" class="form-control" id="endTime" name="endTime" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Shift Modal -->
    <div class="modal fade" id="editShiftModal" tabindex="-1" role="dialog" aria-labelledby="editShiftModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editShiftModalLabel"><i class="fa fa-edit mr-2"></i>Edit shift</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
 <div class="modal-body">
    <form id="editShiftForm">
        <input type="hidden" id="shiftID" name="shiftID">
        <input type="hidden" name="action" value="update">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="editShiftName">Shift</label>
                <input type="text" class="form-control" id="editShiftName" name="shiftName" required readonly>
            </div>
            <div class="form-group col-md-6">
                <label for="editEmployeeID"></label>
               <select class="form-control" id="editEmployeeID" name="employeeID">
    <option value="">Chọn nhân viên</option>
    <c:forEach var="employee" items="${employees}">
        <option value="${employee.IDAccount}" ${employee.IDAccount == currentEmployeeID ? 'selected' : ''}>
            ${employee.fullName}
        </option>
    </c:forEach>
</select>

            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="editStartTime">Start</label>
                <input type="datetime-local" class="form-control" id="editStartTime" name="startTime" required>
            </div>
            <div class="form-group col-md-6">
                <label for="editEndTime">End</label>
                <input type="datetime-local" class="form-control" id="editEndTime" name="endTime" required>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary">Update</button>
        </div>
    </form>
</div>

            </div>
        </div>
    </div>



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
    $(document).ready(function () {
        const startInput = document.getElementById("startTime");
        const endInput = document.getElementById("endTime");
         const employeeSelect = document.getElementById("IDAccount");
        // Set min datetime = thời gian hiện tại
        const now = new Date();
        const formattedNow = now.toISOString().slice(0, 16);
        startInput.min = formattedNow;
        endInput.min = formattedNow;

        $("#addShiftForm").submit(function (event) {
            event.preventDefault(); // Ngăn form submit mặc định

            const startValue = startInput.value;
            const endValue = endInput.value;
            const employeeValue = employeeSelect.value;
             if (!employeeValue) {
                alert("⚠️ Vui lòng chọn nhân viên trước khi thêm ca trực!");
                employeeSelect.focus();
                return;
            }

            if (!startValue || !endValue) {
                alert("⛔ Vui lòng điền đầy đủ thời gian.");
                return;
            }

            const start = new Date(startValue);
            const end = new Date(endValue);
            const now = new Date();

            if (start < now) {
                alert("❌ Thời gian bắt đầu không được ở quá khứ!");
                return;
            }

            if (end < now) {
                alert("❌ Thời gian kết thúc không được ở quá khứ!");
                return;
            }

            if (end <= start) {
                alert("❌ Thời gian kết thúc phải sau thời gian bắt đầu!");
                return;
            }

            // ✅ Nếu hợp lệ thì gọi AJAX
            $.ajax({
                type: "POST",
                url: "ShiftServlet",
                data: $(this).serialize(),
                success: function (response) {
                    alert("✅ Thêm ca trực thành công!");
                    location.reload();
                },
                error: function () {
                    alert("❌ Có lỗi xảy ra, vui lòng thử lại!");
                }
            });
        });
    });
</script>
<script>
$(document).ready(function () {
    var selectedID = null;

    $(".btn-edit").click(function () {
        const shiftID = $(this).data("shiftid");
        const shiftName = $(this).data("shiftname");
        const startTime = $(this).data("starttime");
        const endTime = $(this).data("endtime");
        selectedID = $(this).data("idaccount"); 
        const employeeName = $(this).data("employeename");

        console.log(">>> Setting select to ID:", selectedID);
        console.log("Name:", employeeName);

        // Đưa dữ liệu vào form
        $("#shiftID").val(shiftID);
        $("#editShiftName").val(shiftName);
        $("#editStartTime").val(startTime);
        $("#editEndTime").val(endTime);

        // In thử các option trong select
        $("#editEmployeeID option").each(function () {
            console.log("Option value:", $(this).val());
        });

        // Hiển thị modal
        $("#editShiftModal").modal("show");
    });

    // Chỉ gắn 1 lần sau khi modal hiển thị
    $("#editShiftModal").on("shown.bs.modal", function () {
        if (selectedID) {
            console.log("➡️ Setting selectedID in modal:", selectedID);
            $("#editEmployeeID").val(selectedID).trigger("change");
        }
    });
});
</script>

<script>
    $(document).ready(function () {
        $("#editShiftForm").submit(function (event) {
            event.preventDefault(); // Ngăn không cho form load lại trang

            const startInput = $("#editStartTime");
            const endInput = $("#editEndTime");

            // Cập nhật min cho input theo thời gian hiện tại
            const now = new Date();
            const formattedNow = now.toISOString().slice(0, 16); // yyyy-MM-ddTHH:mm
            startInput.attr("min", formattedNow);
            endInput.attr("min", formattedNow);

            const startValue = startInput.val();
            const endValue = endInput.val();

            // Kiểm tra validate
            if (!startValue || !endValue) {
                alert("⛔ Vui lòng điền đầy đủ thời gian.");
                return;
            }

            const start = new Date(startValue);
            const end = new Date(endValue);

            if (start < now) {
                alert("❌ Thời gian bắt đầu không được ở quá khứ!");
                return;
            }

            if (end < now) {
                alert("❌ Thời gian kết thúc không được ở quá khứ!");
                return;
            }

            if (end <= start) {
                alert("❌ Thời gian kết thúc phải sau thời gian bắt đầu!");
                return;
            }

            // Nếu tất cả các điều kiện hợp lệ, gửi dữ liệu bằng AJAX
            $.ajax({
                type: "POST",
                url: "ShiftServlet", // Gửi request đến ShiftServlet
                data: $(this).serialize(), // Chuyển dữ liệu form thành chuỗi query
                success: function (response) {
                    alert("✅ Cập nhật ca trực thành công!");
                    location.reload(); // Reload trang để hiển thị dữ liệu mới
                },
                error: function () {
                    alert("❌ Có lỗi xảy ra, vui lòng thử lại!");
                }
            });
        });
    });
</script>

        <<script>
            function deleteShift(event, shiftID) {
                event.preventDefault();

                if (!confirm('Bạn có chắc chắn muốn xóa ca trực này không?'))
                    return;

                $.ajax({
                    type: "POST",
                    url: "ShiftServlet",
                    data: {action: "delete", shiftID: shiftID},
                    success: function (response) {
                        alert("Xóa ca trực thành công!");
                        location.reload();
                    },
                    error: function () {
                        alert("Xóa ca trực thất bại. Vui lòng thử lại!");
                    }
                });
            }

        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
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

                    window.scrollTo({top: document.querySelector(".table").offsetTop - 100, behavior: "smooth"});
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
                            btn.addEventListener("click", function () {
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
<script>
    document.getElementById("filterDate").addEventListener("change", function () {
        const selectedDate = this.value;
        const rows = document.querySelectorAll(".shift-row");

        rows.forEach(row => {
            const shiftDate = new Date(row.getAttribute("data-date")).toISOString().split('T')[0];
            if (selectedDate === "" || shiftDate === selectedDate) {
                row.style.display = "table-row";
            } else {
                row.style.display = "none";
            }
        });

        // Ẩn phân trang khi lọc
        if (selectedDate !== "") {
            document.getElementById("pagination").style.display = "none";
        } else {
            document.getElementById("pagination").style.display = "block";
        }
    });
</script>
<script>
    const filterInput = document.getElementById("filterDate");
    const rows = document.querySelectorAll(".shift-row");
    const pagination = document.getElementById("pagination");

    function applyFilter(date) {
        rows.forEach(row => {
            const shiftDate = new Date(row.getAttribute("data-date")).toISOString().split('T')[0];
            if (date === "" || shiftDate === date) {
                row.style.display = "table-row";
            } else {
                row.style.display = "none";
            }
        });

        pagination.style.display = (date === "") ? "block" : "none";
    }

    filterInput.addEventListener("change", function () {
        applyFilter(this.value);
    });

    document.getElementById("clearFilter").addEventListener("click", function () {
        filterInput.value = "";
        applyFilter("");
    });
</script>
<script>
document.getElementById("startTime").addEventListener("change", function() {
    const shiftNameInput = document.getElementById("shiftName");
    const selectedTime = new Date(this.value);
    const hour = selectedTime.getHours();

    let shiftName = "";
    if (hour >= 6 && hour < 12) {
        shiftName = "Ca sáng";
    } else if (hour >= 12 && hour < 18) {
        shiftName = "Ca trưa";
    } else if (hour >= 18 && hour <= 23) {
        shiftName = "Ca tối";
    } else {
        shiftName = "Ca đêm";
    }

    shiftNameInput.value = shiftName;
});
</script>
<script>
document.getElementById("editStartTime").addEventListener("change", function() {
    const shiftNameInput = document.getElementById("editShiftName");
    const selectedTime = new Date(this.value);
    const hour = selectedTime.getHours();

    let shiftName = "";
    if (hour >= 6 && hour < 12) {
        shiftName = "Ca sáng";
    } else if (hour >= 12 && hour < 18) {
        shiftName = "Ca trưa";
    } else if (hour >= 18 && hour <= 23) {
        shiftName = "Ca tối";
    } else {
        shiftName = "Ca đêm";
    }

    shiftNameInput.value = shiftName;
});
</script>


    </body>
</html>
