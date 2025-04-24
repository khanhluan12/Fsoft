/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ServiceItemDAO;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
        list.sort((s1, s2) -> s1.getCheckIn().compareTo(s2.getCheckIn()));
        request.setAttribute("BookingDetails", list);

        // Get service orders
        List<ServiceOrder> serviceOrders = ServiceItemDAO.getServiceOrdersByUserId(accid);
        serviceOrders.sort((s1, s2) -> s1.getOrderDate().compareTo(s2.getOrderDate()));
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
