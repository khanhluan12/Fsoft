/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ManagerDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Booking;
import model.CheckRoomValid;
import model.User;

/**
 *
 * @author admin
 */
public class PaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        //bookingtime
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String formattedTime = currentTime.format(formatter);

        String IDAccount = request.getParameter("IDAccount");
        int idac = Integer.parseInt(IDAccount);

        String IDRoomType = request.getParameter("IDRoomType");
        int idrt = Integer.parseInt(IDRoomType);

        String adult = request.getParameter("Adult");
        int na = Integer.parseInt(IDRoomType);
        String child = request.getParameter("Child");
        int nc = Integer.parseInt(IDRoomType);
        // get total day
        String checkInDateStr = request.getParameter("checkInDate");
        String checkOutDateStr = request.getParameter("checkOutDate");
        LocalDate checkInDate = LocalDate.parse(checkInDateStr);
        LocalDate checkOutDate = LocalDate.parse(checkOutDateStr);
        int numOfDays = (int) ChronoUnit.DAYS.between(checkInDate, checkOutDate);
        // get ngay hien tai de check Day
        LocalDate currentDate = LocalDate.now();

        String tprice = request.getParameter("TotalPrice");
        double tp = Double.parseDouble(tprice);

        String nRooms = request.getParameter("numRooms");
        int numRooms = Integer.parseInt(nRooms);

        // Total Price
        String TotalPrice = String.valueOf(tprice);

        String IDDiscount = "1";
        String Note = "";

        // check Room
        String ttRoom = request.getParameter("ttRoom");
        int ttR = Integer.parseInt(ttRoom);
        int checkRoom = ttR - numRooms;
        String cRoom = String.valueOf(checkRoom);

        UserDao udao = new UserDao();
        ManagerDao mDao = new ManagerDao();

        PrintWriter out = response.getWriter();
        List<CheckRoomValid> l = udao.checkRoomValid(checkInDateStr, checkOutDateStr);
        int cr = checkRoom;
        for (int i = 0; i < l.size(); i++) {
            if (idrt == l.get(i).getIDRoom()) {
                cr = l.get(i).getRoomValid();
            } else {
                cr = ttR;
            }
        }

        if (cr <= 0 || cr < numRooms) {
            request.setAttribute("dayFail", "Over stock! " + cr + " rooms available");
            request.getRequestDispatcher("form_test.jsp").forward(request, response);
        } else if (checkInDate.isBefore(currentDate) || checkOutDate.isBefore(checkInDate)) {
            request.setAttribute("dayFail", "Day Invaild!");
            request.getRequestDispatcher("form_test.jsp").forward(request, response);
        } else {
            User u = udao.getAccountById(IDAccount);
            Booking bk = new Booking(idac, idac, idac, idrt, na, nc, checkInDateStr, checkOutDateStr, tp, formattedTime, Note);
            request.setAttribute("bk", bk);
            request.setAttribute("u", u);
            request.getRequestDispatcher("form_payment.jsp").forward(request, response);

            Booking bk2 = new Booking(idrt, idac, idrt, idrt, idrt, cr, child, IDAccount, tp, Note, Note);
            udao.addBooking(IDAccount, IDDiscount, IDRoomType, adult, child, checkInDateStr, checkOutDateStr, nRooms, TotalPrice, formattedTime, Note);
            request.setAttribute("booksuccess", "Booking Success");
            request.getRequestDispatcher("customer_room.jsp").forward(request, response);
        }
        request.getRequestDispatcher("showBooking").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
