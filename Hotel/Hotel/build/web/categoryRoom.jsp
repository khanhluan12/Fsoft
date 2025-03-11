<%-- 
    Document   : categoryRoom
    Created on : Mar 26, 2022, 12:17:29 PM
    Author     : khatr
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Object s_name = session.getAttribute("s_name");
        %>


        <div>
            <%@include file="navbarUser.jsp" %>
        </div>

        <main role="main">
            <div class="album  ">
                <div class="container">
                    <h2 class="text-center p-3 text-secondary"> Room Lists</h2>

                    <div class="row">  
                        <%
                            String category_id = request.getParameter("category_id");
                            int cat_id = Integer.parseInt(category_id);
                            Connection cn = DatabaseConnection.getConnection();
                            Statement stmt = cn.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from rooms join room_category on rooms.category_id = room_category.id where room_category.id = '" + cat_id + "'");
                            while (rs.next()) {
                        %>
                        <%
                            int id = rs.getInt("rooms.id");
                            String room_number = rs.getString("rooms.room_number");
                            String Category = rs.getString("room_category.categories_name");
                            int price = rs.getInt("rooms.price");
                            String details = rs.getString("rooms.details");
                            int status = rs.getInt("rooms.status");

                            Blob image = rs.getBlob("room_category.cover_img");
                            byte imgData[] = image.getBytes(1, (int) image.length());
                            String encodedImage = Base64.getEncoder().encodeToString(imgData);
                            String cat_img = "data:image/jpg;base64," + encodedImage;
                        %>

                        <div class="col-md-4 ">
                            <div class="card mb-4  text-secondary  ">


                                <img class="card-img-top"  src="<%= cat_img%>" alt="Card image cap" width="200px" height="200px">
                                <div class="card-body px-3 py-3">
                                    <b>Room Number:</b> <%= room_number%><br>
                                    <b> Room Category:</b> <%= Category%><br>
                                    <b>Price:</b> Rs.<%= price%><br>
                                    <b>Details:</b> <P style="color: green;"><%= details%></P>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <%if (status == 1) {%>
                                            <%if (s_name == null) {%>
                                            <button type="button" class="btn btn-sm  btn-outline-secondary mt-2"><a href="Login.jsp" class="text-decoration-none text-secondary">Book Now</a></button>
                                            <% } else {%>
                                            <button type="button" class="btn btn-sm  btn-outline-secondary mt-2"><a href="bookcart.jsp?id=<%= id%>" class="text-decoration-none text-secondary">Book Now</a></button>
                                            <% }
                                            } else {%>
                                            <button type="button" class="btn btn-sm  btn-outline-secondary mt-2"><a href="#" class="text-decoration-none text-secondary">Already Booked</a></button>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>

                    </div>

                </div>
            </div>

        </main>

        <div class="footer" style="margin-top: 420px;">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
