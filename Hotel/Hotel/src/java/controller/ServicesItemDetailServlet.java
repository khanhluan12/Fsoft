/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookingDAO;
import dao.ServiceItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.BookingDetails;
import model.ServiceItem;
import model.User;

/**
 *
 * @author plmin
 */
public class ServicesItemDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet ServicesItemDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServicesItemDetailServlet at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int itemID = Integer.parseInt(request.getParameter("itemID"));
        ServiceItem item = ServiceItemDAO.getItemByID(itemID);


        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userA") != null) {
            User user = (User) session.getAttribute("userA");
            BookingDAO bookingDAO = new BookingDAO();

            // Check for active bookings in database
            boolean hasActiveBooking = bookingDAO.hasActiveBooking(user.getIDAccount());
            request.setAttribute("hasActiveBooking", hasActiveBooking);

            // If it's a bike rental and has active booking, get the booking details
            if (item.getServiceID() == 3 && hasActiveBooking) {
                List<BookingDetails> activeBookings = bookingDAO.getActiveBookings(user.getIDAccount());
                request.setAttribute("activeBookings", activeBookings);

                // Calculate total adults across all active bookings
                int totalAdults = activeBookings.stream().mapToInt(BookingDetails::getAdult).sum();
                request.setAttribute("totalAdults", totalAdults);
            }
        }

        request.setAttribute("item", item);
        request.getRequestDispatcher("services_itemDetails.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
