package controller;

import com.google.gson.Gson;
import dbcontext.DBContext;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/roomTypeStats")
public class RoomTypeStats extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        Map<String, Integer> roomTypeCount = new HashMap<>();

        try (Connection conn = DBContext.getConnection()) {
            String query = "SELECT rt.NameRoomType, SUM(bd.NumberOfRoom) AS TotalRooms " +
                           "FROM BookingDetail bd " +
                           "JOIN RoomType rt ON bd.IDRoomType = rt.IDRoomType " +
                           "GROUP BY rt.NameRoomType";

            try (PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    roomTypeCount.put(rs.getString("NameRoomType"), rs.getInt("TotalRooms"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        out.print(new Gson().toJson(roomTypeCount));
        out.flush();
    }
}
