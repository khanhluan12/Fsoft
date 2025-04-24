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

        Map<String, Integer> typeCount = new HashMap<>();
        String yearParam = request.getParameter("year");
        int year = 0;
        try {
            year = Integer.parseInt(yearParam);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        try (Connection conn = DBContext.getConnection()) {
            // ===== ROOM TYPE =====
            String queryRoom = """
                SELECT rt.NameRoomType, SUM(bd.NumberOfRoom) AS TotalRooms
                FROM BookingDetail bd
                JOIN RoomType rt ON bd.IDRoomType = rt.IDRoomType
                JOIN BookingDetails b ON bd.IDBookingDetail = b.IDBooking
                WHERE YEAR(b.Checkin) = ? AND b.Note = 'Success'
                GROUP BY rt.NameRoomType
                """;

            try (PreparedStatement ps = conn.prepareStatement(queryRoom)) {
                ps.setInt(1, year);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        String roomType = rs.getString("NameRoomType");
                        int totalRooms = rs.getInt("TotalRooms");
                        typeCount.put(roomType, totalRooms);
                    }
                }
            }

            // ===== SERVICE ORDER =====
           String queryService = """
    SELECT si.ItemName, SUM(so.Quantity) AS ServiceCount
    FROM ServiceOrder so
    JOIN ServiceItem si ON so.ItemID = si.ItemID
    WHERE YEAR(so.OrderDate) = ? AND so.Status = 'Completed'
    GROUP BY si.ItemName
""";

            try (PreparedStatement ps = conn.prepareStatement(queryService)) {
                ps.setInt(1, year);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        String serviceName = rs.getString("ItemName");
                        int count = rs.getInt("ServiceCount");
                        typeCount.put(serviceName + " (Service)", count); // Để dễ phân biệt
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

        out.print(new Gson().toJson(typeCount));
        out.flush();
    }
}
