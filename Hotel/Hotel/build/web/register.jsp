<%-- 
    Document   : SignUpPage
    Created on : Jun 3, 2023, 2:22:20 AM
    Author     : duclu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <link rel="stylesheet" type="text/css" href="css/register.css">
    </head>
    <body>
        <div class="container">
            <div class="registration">
                <div class="logo-container">
                    <img src="image/logo1.png" alt="Logo">
                </div>
                <h2>Register</h2>
                <form class="registration-form" action="register" method="POST">

                    <div class="alert alert-danger" role="alert">
                        <p style="color: red;"class="text-danger">${mess} </p>
                    </div>
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" required>
                    <!--                
                                    <label for="gender">Gender</label>
                                    <select type="text" id="gender" name="gender" required>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                    
                                    <label for="city">City</label>
                                    <input type="text" id="city" name="city" required>-->

                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>

                    <label for="phone">Phone</label>
                    <input type="text" id="phone" name="phone" required>

                    <label for="username">UserName</label>
                    <input type="text" id="username" name="username" required>

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" 
                           pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" 
                           title="Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character (@$!%*?&)." 
                           required>

                    <label for="confirm_password">Confirm Password</label>
                    <input type="password" id="confirm_password" name="confirm_password" 
                           pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" 
                           title="Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character (@$!%*?&)." 
                           required>
                    <input type="hidden" id="idrole" name="idrole" value="1">
                    <input type="checkbox"> <a href="#">I agree with the hotel policy</a>

                    <button type="submit">Register</button>

                    <div class="mt-4 text-center">
                        <p class="text-sm">Do you already have an account ? <a href="login.jsp"
                                                                               class="text-red-700 hover:underline">Login</a></p>
                    </div>
                </form>
            </div>
            <div class="image">
                <img src="image/bglogin.png" alt="Image">
            </div>
        </div>
    </body>
</html>
