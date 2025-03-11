<%-- 
    Document   : bookcart
    Created on : Mar 19, 2022, 11:49:14 AM
    Author     : khatr
--%>


<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="database.DatabaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <%@include file="includes/header.jsp" %>
        <style>
            body {

                background-repeat: no-repeat;
                background-size: cover;
            }
            .box-shadow {
                box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05);
            }
            .album{
                margin-top: 30px;
                margin-left: 380px;
                width: 700px;
            }
        </style>
    </head>
    <body>
        <%
            Object u_id = session.getAttribute("s_id");
            Object uname = session.getAttribute("s_name");
        %>
        <style>
            .navbar{
                background-color: rgb(21, 172, 231);
                height: 70px;

            }
            .navbar a{
                color: white;
            }
            .navbar .mid{
                margin-left: 330px;
            }


        </style>
        <jsp:include page="navbarUser.jsp"/>
        <div class="album ">
            <div class="container ">

                <div class="row ">
                    <div class="col">

                        <div class="card bg-light mb-2">
                            <h2 class="text-center p-3 text-dark">Check Out Page</h2>
                            <div class="card-body mb-2">                                
                                <form action="RoomBookServlet" method="post">
                                    <%

                                    %>
                                    <%  
                                        String arrival_date = request.getParameter("arrival");
                                        String depature_date = request.getParameter("depature");

                                        String room_id = request.getParameter("id");
                                        int id = Integer.parseInt(room_id);
                                        Connection cn = DatabaseConnection.getConnection();
                                        Statement stmt = cn.createStatement();
                                        ResultSet rs = stmt.executeQuery("select * from rooms join room_category on rooms.category_id = room_category.id where rooms.id = '" + id + "'");
                                        while (rs.next()) {

                                            String room_number = rs.getString("rooms.room_number");
                                            String category = rs.getString("room_category.categories_name");
                                            int price = rs.getInt("rooms.price");
                                            
                                            LocalDate appDate = LocalDate.parse(arrival_date);
                                            LocalDate depDate = LocalDate.parse(depature_date);

                                            long total_days = ChronoUnit.DAYS.between(appDate, depDate);
                                            long total_price = (total_days * price);
                                            


                                    %>

                                    <input type="hidden" name="u_id" value="<%= u_id%>"/>
                                    <input type="hidden" name="room_id" value="<%= room_id%>"/>
                                    <input type="hidden" name="total_price" value="<%= total_price%>"/>
                                    <input type="hidden" name="arrival_date" value="<%= arrival_date%>"/>
                                    <input type="hidden" name="depature_date" value="<%= depature_date%>"/>
                                    <!--<input type="hidden" name="room_no" value="<%= room_number%>"/>-->
                                    <!--<input type="hidden" name="category" value="<%= category%>"/>-->
                                    <input type="hidden" name="total_days" value="<%= total_days%>"/>

                                    <div class="row m-2  ">
                                        <div class="col">
                                            <h5 class="text-left ">
                                                <b>Full Name:  &nbsp</b>   <%= uname%><br>
                                                <b>Check in Date: &nbsp</b> <%= arrival_date%><br>
                                                <b>Check out Date: &nbsp</b> <%= depature_date%><br>
                                                <b>Room Type: &nbsp</b>  <%= category%><br>
                                                <b>Room Number &nbsp</b>  <%= room_number%><br>
                                                <b>Total Days of Stay: &nbsp</b>  <%= total_days%><br>
                                                <b>Total Price: &nbsp</b>  <%= total_price%>
                                                <br><br>
                                                                 
                                        </div>
                                        <hr>

                                        <% } %>

                                    </div> 
                                    <input type ="submit" value="Confirm Booking" class="btn btn-primary" style="margin-left:20px; border-radius: 20px;"/>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <div style="margin-top: 330px;"> 
            <%@include file="includes/footer.jsp" %>
        </div>
        <script src="js/paypal.js" type="text/javascript"></script>
    </body>
</html>
