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

public class SearchBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String phone = request.getParameter("Phone");

        ManagerDao dao = new ManagerDao();
        List<BookingDetails> bookingList = dao.searchBookingDetails(phone);

        if (bookingList.isEmpty()) {
            request.setAttribute("searchMess", "No bookings found for this phone number!");
            request.getRequestDispatcher("showBooking").forward(request, response);
            return;
        }

        // Create a map to store room details for each booking
        Map<Integer, List<BookingDetail>> roomMap = new HashMap<>();

        // Get room details for each booking
        for (BookingDetails booking : bookingList) {
            int bookingId = booking.getIDBooking();
            List<BookingDetail> roomDetails = dao.getBookingDetailsByBookingId(bookingId);
            roomMap.put(bookingId, roomDetails);
        }

        request.setAttribute("listB", bookingList);
        request.setAttribute("roomMap", roomMap);
        request.getRequestDispatcher("manager_booking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
