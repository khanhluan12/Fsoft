<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/login.css">

    </head>
    <body>
        <div class="container">
            <div class="Login">
                <div class="">
                    <img style="width: 120%;" src="image/logo1_2.png" alt="Logo">
                </div>
                <h2>Login</h2>

                <form class="Login-form" action="login" method="POST">
                    <div style="color: red;" class="alert alert-danger" role="alert">
                        <p class="text-danger">${loginFail} </p>
                    </div>
                    <label for="username">UserName</label>
                    <input type="text" id="userName" name="userName" required>

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                    <!--                <div class"GM">
                                    <button  type="submit">Đăng nhập bằng  Gmail</button>
                                    </div>-->
                    <button type="submit">Login</button>

                    <div class="mt-4 text-center">
                        <p class="text-sm">Do not have an account ? <a href="register.jsp"
                                                                       class="text-red-700 hover:underline">Register</a></p>
                    </div>
                </form>

                <div class="forgot">
                    <small>
                        <a href="#" data-toggle="modal" data-target="#forgotModal">Forgot Password?</a>
                    </small>
                    <div class="modal fade mt-5 pt-5" id="forgotModal" tabindex="0" role="dialog" aria-labelledby="forgotModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content border rounded-5 p-3 bg-white shadow box-area">
                                <div class="modal-body " >
                                    <div class="input-group mb-3">
                                        <input type="email" id="resetEmail" class="form-control form-control-lg bg-light fs-6" placeholder="Your Email">
                                    </div>
                                    <div class="row mb-3 fade bg-danger" id="resetMessageBox">
                                        <div class="col-sm-12 text-secondary">
                                            <p class="text-white text-center" id="resetMessage"></p>
                                        </div>
                                    </div>
                                    <div class="input-group mb-3">
                                        <button class="btn btn-lg btn-primary w-100 fs-6" onclick="sendRequest()">Send</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="image">
                <img src="image/bglogin.png" alt="Image">
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
        <<script>
                                            function sendRequest() {
                                                var userEmail = $('#resetEmail').val();

                                                var boxMess = $('#resetMessageBox');
                                                var Mess = $('#resetMessage');

                                                $.ajax({// call api
                                                    url: "/Hotel/ForgotPass",
                                                    method: "POST",
                                                    data: {
                                                        Action: "ForgetPasswork",
                                                        userEmail: userEmail,
                                                    },
                                                    success: function (data) {
                                                        boxMess.removeClass("fade")

                                                        if (data.toLowerCase().includes("incorrect")) {
                                                            boxMess.removeClass("bg-success").addClass("bg-danger")
                                                            if (data.length < 50) {
                                                                Mess.text(data)
                                                            } else {
                                                                Mess.text("Send request success, please check your mail")
                                                            }
                                                        } else {
                                                            Mess.text("Send request success, please check your mail")
                                                            boxMess.removeClass("bg-danger").addClass("bg-success")
                                                        }
                                                        // hide message action
                                                        setTimeout(() => {
                                                            boxMess.addClass("fade")
                                                        }, 3000)
                                                    },
                                                    error: function (Error) {
                                                        
                                                    }
                                                });
                                            }

                                            function ValidatePassword(pass) {
                                                const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

                                                return passwordPattern.test(pass);
                                            }
        </script>
    </body>
</html>
