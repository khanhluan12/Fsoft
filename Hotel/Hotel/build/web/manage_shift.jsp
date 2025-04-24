<%@ page import="java.util.List, model.ShiftSchedule" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .page-number {
    transition: all 0.2s ease-in-out;
}
.page-number {
    cursor: pointer;
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
    <div class="container mt-4">
        <h2 class="text-center">Danh sách ca trực</h2>
       <button type="button" class="btn btn-success mb-3" data-toggle="modal" data-target="#addShiftModal">
    Thêm ca trực
</button>

   <table class="table table-bordered table-striped">
    <thead class="thead-dark">
        <tr>
            <th>Shift Name</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Shift Date</th>
            <th>Employee</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody >
        <c:forEach var="shift" items="${shifts}">
            <tr class="shift-row">
                <td>${shift.shiftName}</td>
                <td>${shift.startTime}</td>
                <td>${shift.endTime}</td>
                <td>${shift.shiftDate}</td>
                <td>${shift.employeeName != null ? shift.employeeName : "Không có nhân viên"}</td>
                <td>
                    <button type="button" class="btn btn-primary btn-edit"
                        data-toggle="modal" data-target="#editShiftModal"
                        data-shiftid="${shift.shiftID}" 
                        data-shiftname="${shift.shiftName}"
                        data-starttime="${shift.startTime}" 
                        data-endtime="${shift.endTime}"
                        data-shiftdate="${shift.shiftDate}"
                        data-idaccount="${shift.IDAccount}"
                        data-employeename="${shift.employeeName}">
                        Sửa
                    </button>
                    <form id="deleteShiftForm-${shift.shiftID}" action="ShiftServlet" method="POST" style="display:inline;" 
                        onsubmit="deleteShift(event, ${shift.shiftID});">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="shiftID" value="${shift.shiftID}">
                        <button type="submit" class="btn btn-danger">Xóa</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

        <div id="pagination" class="mt-3 text-center"></div>
        </div>
    <%@include file="/includes/footer.jsp" %>
    
 <!-- Add modal -->   
<div class="modal fade" id="addShiftModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm Ca Trực</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="addShiftForm">
              <input type="hidden" name="action" value="add">
          <div class="form-group">
            <label for="shiftName">Tên Ca</label>
            <input type="text" class="form-control" id="shiftName" name="shiftName" required>
          </div>
          <div class="form-group">
            <label for="startTime">Thời Gian Bắt Đầu</label>
            <input type="time" class="form-control" id="startTime" name="startTime" required>
          </div>
          <div class="form-group">
            <label for="endTime">Thời Gian Kết Thúc</label>
            <input type="time" class="form-control" id="endTime" name="endTime" required>
          </div>
              <div class="form-group">
    <label for="shiftDate">Ngày Làm Việc</label>
    <input type="date" class="form-control" id="shiftDate" name="shiftDate" required>
</div>

         <div class="form-group">         
    <label for="IDAccount"></label>
    <select class="form-control" id="IDAccount" name="IDAccount" required>
        <option value="">-- Chọn nhân viên --</option>
        <c:forEach var="employee" items="${employees}">
            <p>Danh sách nhân viên: ${employees}</p>
            <option value="${employee.IDAccount}">${employee.fullName}</option>
        </c:forEach>
    </select>
</div>

          <button type="submit" class="btn btn-primary">Lưu</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Update modal -->
<div class="modal fade" id="editShiftModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chỉnh sửa ca trực</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="editShiftForm">
                    <input type="hidden" id="shiftID" name="shiftID">
                    <div class="form-group">
                        <label for="shiftName">Tên Ca</label>
                        <input type="text" class="form-control" id="shiftName" name="shiftName" required>
                    </div>
                    <div class="form-group">
                        <label for="startTime">Thời Gian Bắt Đầu</label>
                        <input type="time" class="form-control" id="startTime" name="startTime" required>
                    </div>
                    <div class="form-group">
                        <label for="endTime">Thời Gian Kết Thúc</label>
                        <input type="time" class="form-control" id="endTime" name="endTime" required>
                    </div>
                    <div class="form-group">
                        <label for="shiftDate">Ngày Làm Việc</label>
                        <input type="date" class="form-control" id="shiftDate" name="shiftDate" required>
                    </div>
                  <div class="form-group mb-4">
    <label for="employeeID">Nhân Viên</label><br>
    <select class="form-control" id="employeeID" name="employeeID">
        <option id="currentEmployee" value="">Chọn nhân viên </option>
        <c:forEach var="employee" items="${employees}">
            <option value="${employee.IDAccount}">${employee.fullName}</option>
        </c:forEach>
    </select><br>
</div>

                    <input type="hidden" name="action" value="update">
                    <button type="submit" class="btn btn-primary">Cập nhật</button>
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
  $(document).ready(function(){
    $("#addShiftForm").submit(function(event){
        event.preventDefault(); // Ngăn chặn load lại trang

        $.ajax({
            type: "POST",
            url: "ShiftServlet", // Servlet xử lý thêm ca trực
            data: $(this).serialize(),
            success: function(response){
                alert("Thêm ca trực thành công!");
                location.reload(); // Load lại trang để hiển thị dữ liệu mới
            },
            error: function(){
                alert("Có lỗi xảy ra, vui lòng thử lại!");
            }
        });
    });
});


</script>
<script>
$(document).ready(function(){
    $(".btn-edit").click(function(){
        const shiftID = $(this).data("shiftid");
        const shiftName = $(this).data("shiftname");
        const startTime = $(this).data("starttime");
        const endTime = $(this).data("endtime");
        const shiftDate = $(this).data("shiftdate");
        const IDAccount = $(this).data("idaccount"); 
        let employeeName = $(this).data("employeename");
        console.log(employeeName);
        // Kiểm tra nếu tên nhân viên không có thì đặt giá trị mặc định
        employeeName = (employeeName === undefined || employeeName === "") 
            ? "Không có nhân viên" 
            : employeeName;

        // Cập nhật tên nhân viên vào phần hiển thị trong modal
        $("#currentEmployeeName").text(employeeName);

        // Cập nhật các giá trị vào các trường khác trong modal
        $("#editShiftModal #shiftID").val(shiftID);
        $("#editShiftModal #shiftName").val(shiftName);
        $("#editShiftModal #startTime").val(startTime);
        $("#editShiftModal #endTime").val(endTime);
        $("#editShiftModal #shiftDate").val(shiftDate);
        $("#editShiftModal #employeeID").val(IDAccount);  // Cập nhật giá trị vào select
    });
});

      
 
</script>

<script>
$(document).ready(function(){
    $("#editShiftForm").submit(function(event){
        event.preventDefault(); // Ngăn không cho form load lại trang

        $.ajax({
            type: "POST",  
            url: "ShiftServlet",  // Gửi request đến ShiftServlet
            data: $(this).serialize(), // Chuyển dữ liệu form thành chuỗi query
            success: function(response){
                alert("Cập nhật ca trực thành công!");
                location.reload(); // Reload trang để hiển thị dữ liệu mới
            },
            error: function(){
                alert("Có lỗi xảy ra, vui lòng thử lại!");
            }
        });
    });
});

</script>
<<script>
    function deleteShift(event, shiftID) {
    event.preventDefault(); 

    if (!confirm('Bạn có chắc chắn muốn xóa ca trực này không?')) return;

    $.ajax({
        type: "POST",
        url: "ShiftServlet",
        data: { action: "delete", shiftID: shiftID },
        success: function(response) {
            alert("Xóa ca trực thành công!");
            location.reload();
        },
        error: function() {
            alert("Xóa ca trực thất bại. Vui lòng thử lại!");
        }
    });
}

</script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const rowsPerPage = 8; 
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
