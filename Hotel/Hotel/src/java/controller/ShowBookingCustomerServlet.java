package controller;

import dao.ManagerDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BookingDetail;
import model.BookingDetails;

public class ShowBookingCustomerServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShowBookingCustomerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowBookingCustomerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ManagerDao managerDao = new ManagerDao();
        List<BookingDetails> customerBookingList = managerDao.getBookingDetailsByCustomer();
        
        // Create a map to store room details for each booking
        Map<Integer, List<BookingDetail>> roomMap = new HashMap<>();
        
        // Get room details for each booking
        for (BookingDetails booking : customerBookingList) {
            int bookingId = booking.getIDBooking();
            List<BookingDetail> roomDetails = managerDao.getBookingDetailsByBookingId(bookingId);
            roomMap.put(bookingId, roomDetails);
        }
        
        request.setAttribute("listB", customerBookingList);
        request.setAttribute("roomMap", roomMap);
        request.getRequestDispatcher("manager_booking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}