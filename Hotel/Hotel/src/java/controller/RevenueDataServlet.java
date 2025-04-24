/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import java.sql.ResultSet;
import model.BookingDetails;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@WebServlet("/revenueData")
public class RevenueDataServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Initialize revenue data for all months
        double[] monthlyRevenues = new double[12];
        
        try (Connection conn = DBContext.getConnection()) {
            String query = "SELECT MONTH(BookingTime) AS Month, SUM(TotalPrice) AS Revenue FROM BookingDetails WHERE YEAR(BookingTime) = YEAR(GETDATE()) GROUP BY MONTH(BookingTime) ORDER BY Month";
            try (PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int month = rs.getInt("Month") - 1; // JDBC months are 1-based, but array is 0-based
                    double revenue = rs.getDouble("Revenue");
                    monthlyRevenues[month] = revenue;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Convert the data to JSON format
        List<Map<String, Object>> revenueData = new ArrayList<>();
        for (int i = 0; i < 12; i++) {
            Map<String, Object> dataPoint = new HashMap<>();
            dataPoint.put("month", i + 1); // converting back to 1-based month
            dataPoint.put("revenue", monthlyRevenues[i]);
            revenueData.add(dataPoint);
        }

        String json = new Gson().toJson(revenueData);
        out.print(json);
        out.flush();
    }
}

