<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
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

            #booking tr:nth-child(even) {background-color: #f2f2f2;}
            #booking tr:hover {background-color: #ddd;}
            #booking th {
                padding: 12px;
                text-align: left;
                background-color: #FEA116;
                color: white;
            }

            /* Modal styles */
            .modal {
                display: none;
                position: fixed;
                z-index: 999;
                padding-top: 100px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.5);
            }

            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 30px;
                border: 1px solid #888;
                width: 60%;
                border-radius: 8px;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }

            .close:hover,
            .close:focus {
                color: black;
            }

            .pagination-container {
                margin-top: 20px;
                text-align: center;
            }

            .pagination-container button {
                margin: 0 5px;
                padding: 5px 10px;
                background-color: #FEA116;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .pagination-container button.active {
                background-color: #e98e00;
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
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Account</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>

        <div class="container mt-4 mb-4">
            <button id="openModalBtn" class="btn btn-warning mb-3">+ Add New Receptionist</button>

            <table id="booking">
                <thead>
                    <tr>
                        <th>ID Account</th>
                        <th>Full Name</th>
                        <th>Gender</th>
                        <th>City</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>UserName</th>
                        <th>Password</th>
                        <th>Role</th>
                        <th>Manager</th>
                    </tr>
                </thead>
                <tbody id="tableBody">
                    <c:forEach items="${sessionScope.listU}" var="l">
                        <tr>
                            <td>${l.IDAccount}</td>
                            <td>${l.getFullName()}</td>
                            <td>${l.getGender()}</td>
                            <td>${l.getCity()}</td>
                            <td>${l.getEmail()}</td>
                            <td>${l.getPhone()}</td>
                            <td>${l.getUserName()}</td>
                            <td>${l.getPass()}</td>
                            <td>${l.getIDRole()}</td>
                            <td>
                                <a href="delete?IDAccount=${l.getIDAccount()}">Delete</a> |
                                <c:if test="${l.isIsBan()}">
                                    <a class="text-info" href="BanAccount?id=${l.getIDAccount()}&status=unban">Unban</a>
                                </c:if>
                                <c:if test="${!l.isIsBan()}">
                                    <a class="text-danger" href="BanAccount?id=${l.getIDAccount()}&status=ban">Ban</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="pagination-container" id="pagination"></div>
        </div>

        <!-- Modal -->
        <div id="accountModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2 style="text-align: center;">Add New Receptionist Account</h2>
                <div class="alert alert-danger" role="alert">
                    <p style="color: red; text-align: center;" class="text-danger">${mess}</p>
                </div>
                <form action="register" method="get">
                    <div class="row">
                        <div class="form-group col-md-6 mb-3">
                            <label>ID</label><br>
                            <label>Auto Generate</label>
                        </div>
                        <div class="form-group col-md-6 mb-3">
                            <label>Full Name</label>
                            <input type="text" class="form-control" name="fullname" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6 mb-3">
                            <label>Gender</label>
                            <input type="text" class="form-control" name="gender" required>
                        </div>
                        <div class="form-group col-md-6 mb-3">
                            <label>City</label>
                            <input type="text" class="form-control" name="city" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6 mb-3">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email" required>
                        </div>
                        <div class="form-group col-md-6 mb-3">
                            <label>Phone</label>
                            <input type="text" class="form-control" name="phone" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6 mb-3">
                            <label>Username</label>
                            <input type="text" class="form-control" name="username" required>
                        </div>
                        <div class="form-group col-md-6 mb-3">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" required>
                            <input type="hidden" name="idrole" value="3">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6 mb-3">
                            <label>Confirm Password</label>
                            <input type="password" class="form-control" name="confirm_password" required>
                        </div>
                        <div class="col text-end mt-2">
                            <button type="submit" class="btn btn-success px-4">Add</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="/includes/footer.jsp" %>

        <!-- Scripts -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script>
            // Modal logic
            var modal = document.getElementById("accountModal");
            var btn = document.getElementById("openModalBtn");
            var span = document.getElementsByClassName("close")[0];
            btn.onclick = () => modal.style.display = "block";
            span.onclick = () => modal.style.display = "none";
            window.onclick = function(event) {
                if (event.target == modal) modal.style.display = "none";
            }

            // Pagination logic
            const rowsPerPage = 5;
            const rows = document.querySelectorAll("#tableBody tr");
            const totalPages = Math.ceil(rows.length / rowsPerPage);
            const pagination = document.getElementById("pagination");

            function displayPage(page) {
                rows.forEach((row, index) => {
                    row.style.display = (index >= (page - 1) * rowsPerPage && index < page * rowsPerPage) ? "" : "none";
                });

                const buttons = pagination.querySelectorAll("button");
                buttons.forEach(btn => btn.classList.remove("active"));
                buttons[page - 1].classList.add("active");
            }

            function setupPagination() {
                pagination.innerHTML = "";
                for (let i = 1; i <= totalPages; i++) {
                    const button = document.createElement("button");
                    button.innerText = i;
                    button.addEventListener("click", () => displayPage(i));
                    pagination.appendChild(button);
                }
                displayPage(1);
            }

            setupPagination();
        </script>
    </body>
</html>
