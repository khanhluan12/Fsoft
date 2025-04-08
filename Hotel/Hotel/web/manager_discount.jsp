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
                        <th>ID Discount</th>
                        <th>Name</th>
                        <th>Value</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Status</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <c:forEach items="${sessionScope.listD}" var="l">
                    <tr>
                        <td>${l.IDDiscount}</td>
                        <td>${l.discountName}</td>
                        <td>${l.discountValue}</td>
                        <td>${l.startDay}</td>
                        <td>${l.endDay}</td>
                        <td>${l.note}</td>
                        <td>
                            <a href="edit?IDDiscount=${l.IDDiscount}">Edit</a> | 
                            <a href="delete?IDDiscount=${l.IDDiscount}" onclick="return confirm('Are you sure you want to delete this discount?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <!-- Nút mở modal -->
            <div class="text-center mt-4">
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addDiscountModal">
                    Add New Discount
                </button>
            </div>
        </div>

        <!-- Modal Thêm Discount -->
        <div class="modal fade" id="addDiscountModal" tabindex="-1" role="dialog" aria-labelledby="addDiscountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addDiscountModalLabel">Add New Discount</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="addNewDiscount" method="get">
                            <div class="form-group">
                                <label>Discount Name</label>
                                <input type="text" class="form-control" name="DiscountName" placeholder="Discount Name" required>
                            </div>
                            <div class="form-group">
                                <label>Discount Value</label>
                                <input type="text" class="form-control" name="DiscountValue" placeholder="Discount Value" required>
                            </div>
                            <div class="form-group">
                                <label>Note</label>
                                <input type="text" class="form-control" name="Note" placeholder="Note" required>
                            </div>
                            <div class="form-group">
                                <label>Start Day</label>
                                <input type="date" class="form-control" name="StartDay" required>
                            </div>
                            <div class="form-group">
                                <label>End Day</label>
                                <input type="date" class="form-control" name="EndDay" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-success">Add Discount</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/includes/footer.jsp" %>

        <!-- Scripts -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <!-- JavaScript validate -->
        <script>
            document.querySelector("form[action='addNewDiscount']").addEventListener("submit", function (e) {
                const start = document.querySelector("[name='StartDay']").value;
                const end = document.querySelector("[name='EndDay']").value;

                if (start > end) {
                    alert("⚠️ Ngày bắt đầu không được lớn hơn ngày kết thúc!");
                    e.preventDefault();
                }
            });
        </script>
    </body>
</html>
