package controller;

import dao.ManagerDao;
import dao.ServiceOrderDAO;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Booking;
import model.BookingDetail;
import model.BookingDetails;
import model.ServiceOrder;

public class ShowBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ManagerDao managerDao = new ManagerDao();
        List<BookingDetails> bookingList = managerDao.getBookingDetails();

        // Create a map to store room details for each booking
        Map<Integer, List<BookingDetail>> roomMap = new HashMap<>();

        // Get room details for each booking
        for (BookingDetails booking : bookingList) {
            int bookingId = booking.getIDBooking();
            List<BookingDetail> roomDetails = managerDao.getBookingDetailsByBookingId(bookingId);
            roomMap.put(bookingId, roomDetails);
        }

        ServiceOrderDAO serviceDao = new ServiceOrderDAO();
List<ServiceOrder> serviceList = serviceDao.getServiceOrderDetails(); // Lấy toàn bộ dịch vụ
request.setAttribute("serviceList", serviceList);

        request.setAttribute("listB", bookingList);
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
