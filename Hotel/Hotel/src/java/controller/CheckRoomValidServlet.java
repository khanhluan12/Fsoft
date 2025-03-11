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
import model.RoomType;

/**
 *
 * @author admin
 */
public class CheckRoomValidServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        String checkInDateStr = request.getParameter("check_in");
        String checkOutDateStr = request.getParameter("check_out");
        if(checkInDateStr == null){
            checkInDateStr = (String)request.getSession().getAttribute("check_in");
            checkOutDateStr =  (String)request.getSession().getAttribute("check_out");
        }

        request.getSession().setAttribute("check_in", checkInDateStr);
        request.getSession().setAttribute("check_out", checkOutDateStr);
        UserDao udao = new UserDao();
        ManagerDao mDao = new ManagerDao();

        List<CheckRoomValid> l = udao.checkRoomValid(checkInDateStr, checkOutDateStr);
        List<RoomType> listSearchRoomType = mDao.getRoomType();

        LocalDate checkInDate = LocalDate.parse(checkInDateStr);
        LocalDate checkOutDate = LocalDate.parse(checkOutDateStr);
        int numOfDays = (int) ChronoUnit.DAYS.between(checkInDate, checkOutDate);
        
        for (CheckRoomValid check : l) {
            for (RoomType roomType : listSearchRoomType) {
                if (roomType.getIDRoomType() == check.getIDRoom()) {
                    if (check.getRoomValid() <= 0) {
                        listSearchRoomType.remove(roomType);
                        break;
                    } else {
                        roomType.setRoomFree(check.getRoomValid());
                        break;
                    }
                }
            }
        }
        
        request.setAttribute("numOfDays", numOfDays);
        request.setAttribute("listRoom", listSearchRoomType);
        request.getRequestDispatcher("customer_room.jsp").forward(request, response);

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
