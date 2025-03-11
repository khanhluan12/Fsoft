<%-- 
    Document   : Account.jsp
    Created on : Jun 8, 2024, 11:32:26 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <c:if test="${requestScope.MessageActive != null}">
                <div class="text-center mt-5 bg-success text-white w-100">
                    <h1 class="">
                        ${requestScope.MessageActive}
                    </h1>
                    <a href="login.jsp" class="btn btn-primary text-center">Back to login Page</a>
                </div>
            </c:if>
            <c:if test="${requestScope.MessageReset != null}">
                <div class="modal-content border rounded-5 mt-5 p-3 bg-white shadow box-area">
                    <form method="post" action="Account" onsubmit="return validateForm()">
                        <input type="hidden" name="AccountId" value="${requestScope.AccountId}">
                        <input type="hidden" name="Action" value="ResetPassword">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalChangePassLabel">Change Password</h5>
                        </div>
                        <div class="modal-body mt-5">
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">New Password</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="password" id="NewPass" name="NewPass" class="form-control" value="" placeholder="New password"
                                           pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" 
                                           title="Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character (@$!%*?&)." 
                                           required>
                                </div>
                                 <div class="col-sm-3">
                                    <h6 class="mb-0">Confirm Password</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="password" id="CFPass" name="NewPass" class="form-control" value="" placeholder="Confirm password" required>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer ">
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Save change</button>
                            </div>
                        </div>
                    </form>
                </div>
            </c:if>
        </div>
        <script type="text/javascript">
            function validateForm() {
                var password = document.getElementById("NewPass").value;
                var confirmPassword = document.getElementById("CFPass").value;

                if (password != confirmPassword) {
                    alert("Confirm password does not match!");
                    return false;
                }
                return true;
            }

        </script>
    </body>
</html>

