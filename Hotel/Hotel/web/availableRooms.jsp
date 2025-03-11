<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbcontext.DBContext"%>
<!doctype html>
<html lang="en">
    <!DOCTYPE html>
    <html lang="en">

        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <link rel="icon" href="image/favicon.png" type="image/png">
            <title>TROPICAL Hotel</title>
            <!-- Bootstrap CSS -->
            <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
            <link rel="stylesheet" type="text/css" href="vendors/linericon/style.css">
            <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
            <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
            <link rel="stylesheet" type="text/css"
                  href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
            <link rel="stylesheet" type="text/css" href="vendors/nice-select/css/nice-select.css">
            <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
            <!-- main css -->
            <link rel="stylesheet" type="text/css" href="css/style.css">
            <link rel="stylesheet" type="text/css" href="css/responsive.css">
        </head>
        <body>

            <%@include file="includes/header.jsp" %>
<!--            <form action="availableRooms.jsp" method="post" onsubmit="return validateForm()" name="myForm">
                <div class=" row maindiv bg-secondary px-4, form_day">

                    <div class="col-4">
                        <div>
                            <label><b class="text-white">Check In Date</b></label>
                        </div>
                        <input type="date" class="form-control"  name="check_in" id="check_in"   required/>
                        <span id="checkin" class="error"></span>
                    </div>
                    <div class="col-4">
                        <div>
                            <label><b class="text-white">Check Out Date</b></label>
                        </div>
                        <input type="date" class="form-control " name="check_out" id="check_out"  required />
                        <span id="checkout" class="error"></span>
                    </div>

                    <div class="col-2 mt-3 px-5 btn">
                        <input type="submit"  class="btn bg-primary text-white" value="Search Availability" />
                    </div>

                </div>
            </form>-->
            
            
            <main role="main">
                <div class="album  ">
                    <div class="container">
                        <h2 class="text-center p-3 text-secondary">Available Rooms</h2>
                        <div class="row">   
                            <div class="col-md-4 ">
                                <div class="card mb-4  text-secondary  ">

                                    <img class="card-img-top"  src="image/room1.jpg" alt="Card image cap" width="200px" height="200px">
                                    <div class="card-body px-3 py-3">
                                        <form action="bookcart.jsp">
                                            <input type="hidden" value="" name="arrival"/>
                                            <input type="hidden" value="" name="depature"/>
                                            <input type="hidden" value="" name="id" >

                                            <b>Room Type:</b>r <br>
                                            <b>Price:</b> p<br>
                                            <b>Details:</b> <P style="color: green;">Content</P>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-sm  btn-outline-secondary mt-2"><a href="Login.jsp" class="text-decoration-none text-secondary">Book Now</a></button>

                                                    <input type="submit" value="Book Now" class="btn btn-sm btn-outline-secondary mt-2" />
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </main>

            <div class="footer" style="margin-top: 80px;">
                <%@include file="includes/footer.jsp" %>
            </div>

        </body>
    </html>
