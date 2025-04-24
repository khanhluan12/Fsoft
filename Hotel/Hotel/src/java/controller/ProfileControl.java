/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ServiceItemDAO;
import dao.UserDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        // Get booking details
        List<BookingDetails> list = ud.getBookingDetailsByUserId(accid);
       list.sort((s1, s2) -> {
    LocalDate d1 = LocalDate.parse(s1.getCheckIn(), formatter2);
    LocalDate d2 = LocalDate.parse(s2.getCheckIn(), formatter2);
    return d2.compareTo(d1); // mới nhất lên đầu
});
        request.setAttribute("BookingDetails", list);

        // Get service orders
        List<ServiceOrder> serviceOrders = ServiceItemDAO.getServiceOrdersByUserId(accid);
       serviceOrders.sort((s1, s2) -> {
    LocalDateTime d1 = LocalDateTime.parse(s1.getOrderDate().substring(0, 16), formatter1);
    LocalDateTime d2 = LocalDateTime.parse(s2.getOrderDate().substring(0, 16), formatter1);
    return d2.compareTo(d1);
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
