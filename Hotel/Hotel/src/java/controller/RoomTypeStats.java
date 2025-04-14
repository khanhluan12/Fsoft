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
        String yearParam = request.getParameter("year");
        int year = 0;
        try {
            year = Integer.parseInt(yearParam);  
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);  
            return;
        }

        try (Connection conn = DBContext.getConnection()) {

            String query = "SELECT rt.NameRoomType, SUM(bd.NumberOfRoom) AS TotalRooms, YEAR(b.Checkin) AS Year " +
                           "FROM BookingDetail bd " +
                           "JOIN RoomType rt ON bd.IDRoomType = rt.IDRoomType " +
                           "JOIN BookingDetails b ON bd.IDBookingDetail = b.IDBooking " +
                           "WHERE YEAR(b.Checkin) = ? " +  
                           "GROUP BY rt.NameRoomType, YEAR(b.Checkin)";

            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setInt(1, year);  

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        String roomType = rs.getString("NameRoomType");
                        int totalRooms = rs.getInt("TotalRooms");
                        roomTypeCount.put(roomType, totalRooms);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);  // Gửi lỗi server nếu có lỗi xảy ra
        }

        // Chuyển đổi map thành JSON và gửi trả về client
        out.print(new Gson().toJson(roomTypeCount));
        out.flush();
    }
}
