package controller;

import com.google.gson.Gson;
import dbcontext.DBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.*;

@WebServlet("/revenueData")
public class RevenueDataServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String yearParam = request.getParameter("year");
        int year = (yearParam != null && !yearParam.isEmpty()) ? Integer.parseInt(yearParam) : LocalDate.now().getYear();

        Map<Integer, Double> revenuePerMonth = new HashMap<>();

        try (Connection conn = DBContext.getConnection()) {

            // === Doanh thu PHÒNG ===
            String sqlRoom = "SELECT Checkin, Checkout, TotalPrice FROM BookingDetails WHERE YEAR(Checkin) <= ? AND YEAR(Checkout) >= ? AND Note = 'Success'";
            try (PreparedStatement ps = conn.prepareStatement(sqlRoom)) {
                ps.setInt(1, year);
                ps.setInt(2, year);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        LocalDate checkin = rs.getDate("Checkin").toLocalDate();
                        LocalDate checkout = rs.getDate("Checkout").toLocalDate();
                        double totalPrice = rs.getDouble("TotalPrice");

                        long totalNights = ChronoUnit.DAYS.between(checkin, checkout);
                        if (totalNights <= 0) continue;

                        double pricePerNight = totalPrice / totalNights;
                        for (LocalDate date = checkin; date.isBefore(checkout); date = date.plusDays(1)) {
                            if (date.getYear() != year) continue;
                            int month = date.getMonthValue();
                            revenuePerMonth.put(month, revenuePerMonth.getOrDefault(month, 0.0) + pricePerNight);
                        }
                    }
                }
            }

            // === Doanh thu DỊCH VỤ ===
            String sqlService = "SELECT OrderDate, TotalPrice FROM ServiceOrder WHERE YEAR(OrderDate) = ? AND Status ='Completed'";
            try (PreparedStatement ps = conn.prepareStatement(sqlService)) {
                ps.setInt(1, year);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        LocalDate date = rs.getDate("OrderDate").toLocalDate();
                        int month = date.getMonthValue();
                        double price = rs.getDouble("TotalPrice");
                        revenuePerMonth.put(month, revenuePerMonth.getOrDefault(month, 0.0) + price);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Convert về JSON
        List<Map<String, Object>> revenueData = new ArrayList<>();
        for (int i = 1; i <= 12; i++) {
            Map<String, Object> dataPoint = new HashMap<>();
            dataPoint.put("month", i);
            dataPoint.put("revenue", Math.round(revenuePerMonth.getOrDefault(i, 0.0))); // làm tròn nếu cần
            revenueData.add(dataPoint);
        }

        String json = new Gson().toJson(revenueData);
        out.print(json);
        out.flush();
    }
}
