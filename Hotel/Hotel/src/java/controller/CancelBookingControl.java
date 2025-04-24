package controller;

import dao.BookingDAO;
import dao.UserDao;
import model.User;
import Service.Email;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BookingDetails;
import javax.mail.MessagingException;

public class CancelBookingControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get parameters
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String contactInfo = request.getParameter("contactInfo");

            // Get user information from session
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("userA");

            // Cancel the booking
            BookingDAO bookingDAO = new BookingDAO();
            bookingDAO.cancelBooking(bookingId);

            // Get booking details for the email
            BookingDetails booking = bookingDAO.getBookingById(bookingId);

            // Find all receptionists
            UserDao accountDAO = new UserDao();
            List<User> receptionists = accountDAO.getAllReceptionists();

            // Send email to all receptionists
            String subject = "Booking Cancellation Notification";
            for (User receptionist : receptionists) {
                if (receptionist.getEmail() != null && !receptionist.getEmail().isEmpty()) {
                    String message = "Dear Receptionist,\n\n"
                            + "A booking has been cancelled.\n\n"
                            + "Booking ID: " + bookingId + "\n"
                            + "Customer Name: " + (currentUser != null ? currentUser.getFullName() : booking.getFullName()) + "\n"
                            + "Contact Phone: " + contactInfo + "\n\n"
                            + "Please contact the customer if needed.\n\n"
                            + "Regards,\nTROPICAL Hotel System";

                    try {
                        Email.sendEmail(receptionist.getEmail(), subject, message);
                    } catch (MessagingException e) {
                        System.out.println("Failed to send email to " + receptionist.getEmail());
                        e.printStackTrace();
                    }
                }
            }

            // Set success message and redirect back to profile page
            request.setAttribute("cancelMessage", "Your booking has been successfully cancelled.");
            request.getRequestDispatcher("Profile").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while cancelling your booking.");
            request.getRequestDispatcher("Profile").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for handling booking cancellations";
    }
}
