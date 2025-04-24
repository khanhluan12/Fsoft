package controller;

import dao.ManagerDao;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BookingDetail;
import model.BookingDetails;

public class ShowBookingRepceptionistServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ManagerDao managerDao = new ManagerDao();
        List<BookingDetails> receptionistBookingList = managerDao.getBookingDetailsByReceptionist();
        
        // Create a map to store room details for each booking
        Map<Integer, List<BookingDetail>> roomMap = new HashMap<>();
        
        // Get room details for each booking
        for (BookingDetails booking : receptionistBookingList) {
            int bookingId = booking.getIDBooking();
            List<BookingDetail> roomDetails = managerDao.getBookingDetailsByBookingId(bookingId);
            roomMap.put(bookingId, roomDetails);
        }
        
        request.setAttribute("listB", receptionistBookingList);
        request.setAttribute("roomMap", roomMap);
        request.getRequestDispatcher("manager_booking.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}