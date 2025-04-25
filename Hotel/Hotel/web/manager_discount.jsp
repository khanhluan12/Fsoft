<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>TROPICAL Hotel</title>
        <link rel="icon" href="image/favicon.png" type="image/png">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <style>
            #booking {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #booking td, #booking th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #booking tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #booking tr:hover {
                background-color: #ddd;
            }

            #booking th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #FEA116;
                color: white;
            }

            .pagination {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .pagination a {
                color: black;
                padding: 8px 16px;
                text-decoration: none;
                transition: background-color .3s;
                border: 1px solid #ddd;
                margin: 0 4px;
            }

            .pagination a.active {
                background-color: #FEA116;
                color: white;
                border: 1px solid #FEA116;
            }

            .pagination a:hover:not(.active) {
                background-color: #ddd;
            }

            .pagination a.disabled {
                pointer-events: none;
                color: #aaa;
                border: 1px solid #ddd;
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

        <!-- Breadcrumb -->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax"></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Discount</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Discount Management</li>
                    </ol>
                </div>
            </div>
        </section>

        <div class="container">
            <!-- Thông báo -->
            <c:if test="${not empty sessionScope.message}">
                <div class="alert alert-info text-center" role="alert">
                    ${sessionScope.message}
                </div>
                <c:remove var="message" scope="session"/>
            </c:if>

            <h2 class="text-center mt-4">Discount List</h2>
            <table style="margin-top: 20px;margin-bottom: 20px;" id="booking">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Value</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Status</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody id="discountTableBody">
                    <c:forEach items="${sessionScope.listD}" var="l">
                        <tr class="discount-row">
                            <td>${l.discountName}</td>
                            <td>${l.discountValue}</td>
                            <td>${l.startDay}</td>
                            <td>${l.endDay}</td>
                            <td>${l.note}</td>
                            <td>
                                <button class="btn btn-sm btn-warning"
                                        onclick="openEditModal('${l.IDDiscount}', '${l.discountName}', '${l.discountValue}', '${l.startDay}', '${l.endDay}', '${l.note}')">
                                    Edit
                                </button>
                                |
                                <a href="delete?IDDiscount=${l.IDDiscount}" onclick="return confirm('Are you sure you want to delete this discount?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Pagination -->
            <div class="pagination" id="pagination">
                <a href="#" class="page-nav" data-page="prev">&laquo;</a>
                <!-- Page numbers will be inserted here by JavaScript -->
                <a href="#" class="page-nav" data-page="next">&raquo;</a>
            </div>

            <!-- Nút mở modal thêm -->
            <div class="text-center mt-4">
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addDiscountModal">
                    Add New Discount
                </button>
            </div>
        </div>

        <!-- Modal Thêm Discount -->
        <div class="modal fade" id="addDiscountModal" tabindex="-1" role="dialog" aria-labelledby="addDiscountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <form action="addNewDiscount" method="get" class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addDiscountModalLabel">Add New Discount</h5>
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Discount Name</label>
                            <input type="text" class="form-control" name="DiscountName" required>
                        </div>
                        <div class="form-group">
                            <label>Discount Value</label>
                            <input type="text" class="form-control" name="DiscountValue" required>
                        </div>
                        <div class="form-group">
                            <label>Note</label>
                            <input type="text" class="form-control" name="Note" required>
                        </div>
                        <div class="form-group">
                            <label>Start Day</label>
                            <input type="date" class="form-control" name="StartDay" required>
                        </div>
                        <div class="form-group">
                            <label>End Day</label>
                            <input type="date" class="form-control" name="EndDay" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Add Discount</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modal Sửa Discount -->
        <div class="modal fade" id="editDiscountModal" tabindex="-1" role="dialog" aria-labelledby="editDiscountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <form action="edit" method="post" class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editDiscountModalLabel">Edit Discount</h5>
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="IDDiscount" id="editIDDiscount">
                        <div class="form-group">
                            <label>Discount Name</label>
                            <input type="text" class="form-control" name="DiscountName" id="editDiscountName" required>
                        </div>
                        <div class="form-group">
                            <label>Discount Value</label>
                            <input type="text" class="form-control" name="DiscountValue" id="editDiscountValue" required>
                        </div>
                        <div class="form-group">
                            <label>Note</label>
                            <input type="text" class="form-control" name="Note" id="editNote" required>
                        </div>
                        <div class="form-group">
                            <label>Start Day</label>
                            <input type="date" class="form-control" name="StartDay" id="editStartDay" required>
                        </div>
                        <div class="form-group">
                            <label>End Day</label>
                            <input type="date" class="form-control" name="EndDay" id="editEndDay" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="/includes/footer.jsp" %>

        <!-- Scripts -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <script>
                                    // Pagination functionality
                                    document.addEventListener('DOMContentLoaded', function () {
                                        const rows = document.querySelectorAll('.discount-row');
                                        const rowsPerPage = 5;
                                        const pageCount = Math.ceil(rows.length / rowsPerPage);
                                        const pagination = document.getElementById('pagination');

                                        // Hide all rows initially
                                        rows.forEach(row => row.style.display = 'none');

                                        // Show first page
                                        showPage(1);

                                        // Create page numbers
                                        for (let i = 1; i <= pageCount; i++) {
                                            const pageLink = document.createElement('a');
                                            pageLink.href = '#';
                                            pageLink.textContent = i;
                                            pageLink.className = 'page-nav';
                                            pageLink.dataset.page = i;

                                            // Insert before the next button
                                            pagination.insertBefore(pageLink, pagination.lastElementChild);
                                        }

                                        // Set first page as active
                                        setActivePage(1);

                                        // Add event listeners to pagination links
                                        document.querySelectorAll('.page-nav').forEach(link => {
                                            link.addEventListener('click', function (e) {
                                                e.preventDefault();
                                                const page = this.dataset.page;

                                                if (page === 'prev') {
                                                    const active = document.querySelector('.pagination a.active');
                                                    const prevPage = parseInt(active.textContent) - 1;
                                                    if (prevPage >= 1) {
                                                        showPage(prevPage);
                                                        setActivePage(prevPage);
                                                    }
                                                } else if (page === 'next') {
                                                    const active = document.querySelector('.pagination a.active');
                                                    const nextPage = parseInt(active.textContent) + 1;
                                                    if (nextPage <= pageCount) {
                                                        showPage(nextPage);
                                                        setActivePage(nextPage);
                                                    }
                                                } else {
                                                    showPage(parseInt(page));
                                                    setActivePage(parseInt(page));
                                                }
                                            });
                                        });

                                        function showPage(pageNum) {
                                            const startIndex = (pageNum - 1) * rowsPerPage;
                                            const endIndex = startIndex + rowsPerPage;

                                            rows.forEach((row, index) => {
                                                if (index >= startIndex && index < endIndex) {
                                                    row.style.display = '';
                                                } else {
                                                    row.style.display = 'none';
                                                }
                                            });
                                        }

                                        function setActivePage(pageNum) {
                                            document.querySelectorAll('.pagination a').forEach(link => {
                                                link.classList.remove('active');
                                                if (link.dataset.page == pageNum) {
                                                    link.classList.add('active');
                                                }

                                                // Disable prev/next buttons when at first/last page
                                                const prevBtn = document.querySelector('.pagination a[data-page="prev"]');
                                                const nextBtn = document.querySelector('.pagination a[data-page="next"]');

                                                if (pageNum === 1) {
                                                    prevBtn.classList.add('disabled');
                                                } else {
                                                    prevBtn.classList.remove('disabled');
                                                }

                                                if (pageNum === pageCount) {
                                                    nextBtn.classList.add('disabled');
                                                } else {
                                                    nextBtn.classList.remove('disabled');
                                                }
                                            });
                                        }
                                    });

                                    // Validate ngày trong modal add
                                    document.querySelector("form[action='addNewDiscount']").addEventListener("submit", function (e) {
                                        const start = document.querySelector("[name='StartDay']").value;
                                        const end = document.querySelector("[name='EndDay']").value;
                                        if (start > end) {
                                            alert("⚠️ Ngày bắt đầu không được lớn hơn ngày kết thúc!");
                                            e.preventDefault();
                                        }
                                    });

                                    // Hàm mở modal sửa và set dữ liệu
                                    function openEditModal(id, name, value, start, end, note) {
                                        document.getElementById('editIDDiscount').value = id;
                                        document.getElementById('editDiscountName').value = name;
                                        document.getElementById('editDiscountValue').value = value;
                                        document.getElementById('editStartDay').value = start;
                                        document.getElementById('editEndDay').value = end;
                                        document.getElementById('editNote').value = note;
                                        $('#editDiscountModal').modal('show');
                                    }
        </script>
    </body>
</html>