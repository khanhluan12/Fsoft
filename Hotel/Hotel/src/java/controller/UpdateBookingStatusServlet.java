package controller;

import dao.ManagerDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateBookingStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String IDBooking = request.getParameter("IDBooking");
        String Status = request.getParameter("Status");

        ManagerDao dao = new ManagerDao();
        dao.updateBookingStatus(IDBooking, Status);

        request.setAttribute("bookingStatusMess", "Booking status updated successfully!");

        // Redirect back to the booking list
        response.sendRedirect("showBooking");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
