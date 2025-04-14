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

        // Lấy tham số năm từ request
        String yearParam = request.getParameter("year");
        int year = (yearParam != null) ? Integer.parseInt(yearParam) : LocalDate.now().getYear();
if (yearParam != null && !yearParam.isEmpty()) {
    try {
        year = Integer.parseInt(yearParam);
    } catch (NumberFormatException e) {
        // giữ nguyên year mặc định
    }
        // Khởi tạo dữ liệu doanh thu từng tháng (mặc định 0)
        double[] monthlyRevenues = new double[12];
Map<Integer, Double> revenuePerMonth = new HashMap<>();

try (Connection conn = DBContext.getConnection()) {
    String sql = "SELECT Checkin, Checkout, TotalPrice FROM BookingDetails WHERE YEAR(Checkin) <= ? AND YEAR(Checkout) >= ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, year);
        ps.setInt(2, year);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                LocalDate checkin = rs.getDate("Checkin").toLocalDate();
                LocalDate checkout = rs.getDate("Checkout").toLocalDate();
                double totalPrice = rs.getDouble("TotalPrice");

                long totalNights = ChronoUnit.DAYS.between(checkin, checkout);
                if (totalNights <= 0) continue; // tránh lỗi

                double pricePerNight = totalPrice / totalNights;

                for (LocalDate date = checkin; date.isBefore(checkout); date = date.plusDays(1)) {
                    if (date.getYear() != year) continue; // chỉ lấy trong năm cần thống kê
                    int month = date.getMonthValue();
                    revenuePerMonth.put(month, revenuePerMonth.getOrDefault(month, 0.0) + pricePerNight);
                }
            }
        }
    }
} catch (SQLException e) {
    e.printStackTrace();
}


        // Chuyển dữ liệu sang JSON
       List<Map<String, Object>> revenueData = new ArrayList<>();
for (int i = 1; i <= 12; i++) {
    Map<String, Object> dataPoint = new HashMap<>();
    dataPoint.put("month", i);
    dataPoint.put("revenue", revenuePerMonth.getOrDefault(i, 0.0));
    revenueData.add(dataPoint);
}

        String json = new Gson().toJson(revenueData);
        System.out.println(revenueData);
        out.print(json);
        out.flush();
    }
}
}
