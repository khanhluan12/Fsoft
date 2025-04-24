/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ManagerDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Booking;
import model.BookingDetail;
import model.BookingDetails;
@WebServlet(name = "ExtendBookingServlet", urlPatterns = {"/extendBooking"})
public class ExtendBookingServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idBookingParam = request.getParameter("IDBooking");
        String newCheckoutParam = request.getParameter("newCheckout");
       int roomTypeId = Integer.parseInt(request.getParameter("RoomTypeId"));
        // Kiểm tra các tham số cần thiết
        if (idBookingParam == null || idBookingParam.isEmpty() || newCheckoutParam == null || newCheckoutParam.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("IDBooking and newCheckout are required");
            return;
        }

        try {
            // Chuyển đổi các tham số nhận được
            int idBooking = Integer.parseInt(idBookingParam);
            LocalDate newCheckout = LocalDate.parse(newCheckoutParam);

            // Gọi dao để cập nhật thông tin gia hạn trong cơ sở dữ liệu
            ManagerDao bookingDao = new ManagerDao();
            
            // Cập nhật thông tin gia hạn
            boolean isUpdated = bookingDao.updateCheckoutAndPrice(idBooking, newCheckout);

            // Thiết lập thông báo cho trang JSP
            String message = "";
            if (isUpdated) {
                message = "Gia hạn thành công";
            } else {
                message = "Không thể gia hạn đặt phòng";
            }

            // Lưu thông báo vào request để chuyển tiếp
            request.setAttribute("message", message);

            // Cập nhật lại danh sách booking và gửi vào request
            List<BookingDetails> updatedBookings = bookingDao.getBookingDetailsByCustomer(); 
              Map<Integer, List<BookingDetail>> roomMap = new HashMap<>();
        
        // Get room details for each booking
        for (BookingDetails booking : updatedBookings) {
            int bookingId = booking.getIDBooking();
            List<BookingDetail> roomDetails = bookingDao.getBookingDetailsByBookingId(bookingId);
            roomMap.put(bookingId, roomDetails);
        }
            request.setAttribute("roomMap", roomMap);
            request.setAttribute("listB", updatedBookings);

            // Forward yêu cầu đến trang manager_booking.jsp
            request.getRequestDispatcher("manager_booking.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // Nếu gặp lỗi khi chuyển đổi kiểu dữ liệu (IDBooking không hợp lệ)
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid IDBooking format");
        } catch (SQLException e) {
            // Nếu có lỗi trong quá trình truy vấn cơ sở dữ liệu
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Database error: " + e.getMessage());
        } catch (Exception e) {
            // Xử lý lỗi tổng quát
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
