/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dao.ManagerDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.sql.*;
import java.time.LocalDate;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "extensionRoomServlet", urlPatterns = {"/extensionRoomServlet"})
public class GetUnavailableDates extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet extensionRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet extensionRoomServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    UserDao dao = new UserDao();
    String idBookingParam = request.getParameter("IDBooking");
    String idRoomTypeParam = request.getParameter("IDRoomType");

    if (idBookingParam == null || idBookingParam.isEmpty() ||
        idRoomTypeParam == null || idRoomTypeParam.isEmpty()) {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("IDBooking and IDRoomType are required");
        return;
    }

    try {
        int idBooking = Integer.parseInt(idBookingParam);
        int idRoomType = Integer.parseInt(idRoomTypeParam);

        // Gọi DAO với cả BookingID và RoomTypeID
        List<String> unavailableDates = dao.getUnavailableDates(idBooking, idRoomType);

        response.setContentType("application/json");
        new Gson().toJson(unavailableDates, response.getWriter());
    } catch (NumberFormatException e) {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("Invalid parameter format");
    } catch (SQLException e) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write("Error fetching unavailable dates");
    }
}



    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String idBookingParam = request.getParameter("IDBooking");
    String newCheckoutParam = request.getParameter("newCheckout");
     System.out.println(idBookingParam + newCheckoutParam);
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

        if (isUpdated) {
            // Nếu gia hạn thành công, chuyển hướng lại trang với thông báo thành công
            response.sendRedirect("manager_booking.jsp?message=Gia hạn thành công");
        } else {
            // Nếu không thể gia hạn (ví dụ: dữ liệu không tồn tại hoặc gặp lỗi), thông báo lỗi
            response.sendRedirect("manager_booking.jsp?message=Không thể gia hạn đặt phòng");
        }

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

   



    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
