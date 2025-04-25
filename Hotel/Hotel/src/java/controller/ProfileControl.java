package controller;

import dao.ServiceItemDAO;
import dao.UserDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import model.BookingDetails;
import model.ServiceOrder;
import model.User;

/**
 *
 * @author admin
 */
public class ProfileControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDao ud = new UserDao();
        if (request.getSession().getAttribute("userA") == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        User user = (User) request.getSession().getAttribute("userA");
        int accid = ((User) request.getSession().getAttribute("userA")).getIDAccount();

        // Get booking details
        List<BookingDetails> list = ud.getBookingDetailsByUserId(accid);
        list.sort((s1, s2) -> {
            try {
                // Try to parse with the expected format first
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                LocalDate d1 = LocalDate.parse(s1.getCheckIn().substring(0, 10));
                LocalDate d2 = LocalDate.parse(s2.getCheckIn().substring(0, 10));
                return d2.compareTo(d1); // newest first
            } catch (Exception e) {
                // Fallback if parsing fails
                return 0;
            }
        });
        request.setAttribute("BookingDetails", list);

        // Get service orders
        List<ServiceOrder> serviceOrders = ServiceItemDAO.getServiceOrdersByUserId(accid);

        // Sort service orders by date - handle various date formats safely
        serviceOrders.sort((s1, s2) -> {
            try {
                String date1Str = s1.getOrderDate();
                String date2Str = s2.getOrderDate();

                if (date1Str == null && date2Str == null) {
                    return 0;
                }
                if (date1Str == null) {
                    return 1;
                }
                if (date2Str == null) {
                    return -1;
                }

                // Try to parse with the expected format
                // First try yyyy-MM-dd format
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate d1, d2;

                try {
                    d1 = LocalDate.parse(date1Str, formatter);
                } catch (DateTimeParseException e) {
                    // If parsing fails with the first format, set to a default date
                    d1 = LocalDate.of(1900, 1, 1);
                }

                try {
                    d2 = LocalDate.parse(date2Str, formatter);
                } catch (DateTimeParseException e) {
                    // If parsing fails with the first format, set to a default date
                    d2 = LocalDate.of(1900, 1, 1);
                }

                return d2.compareTo(d1); // newest first
            } catch (Exception e) {
                // Fallback if all parsing fails
                return 0;
            }
        });

        request.setAttribute("serviceOrders", serviceOrders);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
