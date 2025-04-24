<%@ page import="java.util.List, model.ShiftSchedule" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ca Trực Của Tôi</title>
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
        /* Bảng với kiểu dáng sạch sẽ */
.table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
    border-collapse: collapse;
}

/* Viền bảng */
.table-bordered {
    border: 1px solid #ddd;
}

/* Định dạng tiêu đề bảng */
.table th {
    background-color: #343a40;
    color: white;
    font-weight: bold;
    text-align: center;
}

/* Định dạng các ô dữ liệu */
.table td, .table th {
    padding: 0.75rem;
    vertical-align: middle;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
}

/* Định dạng cho các dòng lẻ */
.table-striped tbody tr:nth-child(odd) {
    background-color: #f9f9f9;
}

/* Định dạng khi bảng có thể cuộn */
.table-responsive {
    max-height: 400px;
    overflow-y: auto;
    border: 1px solid #ddd;
}

/* Màu nền cho các dòng khi hover */
.table tr:hover {
    background-color: #f1f1f1;
}

       .filter-container {
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.03);
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
        <h2 class="text-center">Shift list</h2>
       <table class="table table-bordered table-striped">
    <thead class="thead-dark">
        <tr>
            <th>Shift</th>
            <th>Start</th>
            <th>End</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${not empty requestScope.shiftList}">
                <c:forEach var="shift" items="${requestScope.shiftList}">
                    <tr class="shift-row" data-date="${shift.startDateTime}">
                        <td>${shift.shiftName}</td>
                        <td>
                            <fmt:formatDate value="${shift.startDateTime}" pattern="yyyy-MM-dd HH:mm" />
                        </td>
                        <td>
                            <fmt:formatDate value="${shift.endDateTime}" pattern="yyyy-MM-dd HH:mm" />
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr><td colspan="5" class="text-center">No shift founded</td></tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>

<!-- Phân trang -->
<div id="pagination" class="text-center mt-3"></div>

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

</body>
</html>
