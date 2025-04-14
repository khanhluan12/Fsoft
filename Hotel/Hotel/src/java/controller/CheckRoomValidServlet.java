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

    String checkInDateStr = request.getParameter("check_in");
    String checkOutDateStr = request.getParameter("check_out");
    String roomTypeFilter = request.getParameter("roomType");

    // Nếu không nhập ngày, lấy từ session
    if ((checkInDateStr == null || checkInDateStr.isEmpty()) || 
        (checkOutDateStr == null || checkOutDateStr.isEmpty())) {
        checkInDateStr = (String) request.getSession().getAttribute("check_in");
        checkOutDateStr = (String) request.getSession().getAttribute("check_out");
    }

    request.getSession().setAttribute("check_in", checkInDateStr);
    request.getSession().setAttribute("check_out", checkOutDateStr);
    request.setAttribute("roomType", roomTypeFilter);

    UserDao udao = new UserDao();
    ManagerDao mDao = new ManagerDao();
    List<RoomType> listSearchRoomType = mDao.getRoomTypesByName(roomTypeFilter);
    System.out.println(listSearchRoomType);
    int numOfDays = 0;
    List<CheckRoomValid> l = null;

    // Nếu có ngày thì mới tính toán số ngày và kiểm tra phòng trống
    if (checkInDateStr != null && checkOutDateStr != null &&
        !checkInDateStr.isEmpty() && !checkOutDateStr.isEmpty()) {
        
        LocalDate checkInDate = LocalDate.parse(checkInDateStr);
        LocalDate checkOutDate = LocalDate.parse(checkOutDateStr);
        numOfDays = (int) ChronoUnit.DAYS.between(checkInDate, checkOutDate);
        l = udao.checkRoomValid(checkInDateStr, checkOutDateStr);

        for (CheckRoomValid check : l) {
            for (int i = 0; i < listSearchRoomType.size(); i++) {
                RoomType roomType = listSearchRoomType.get(i);
                if (roomType.getIDRoomType() == check.getIDRoom()) {
                    if (check.getRoomValid() <= 0) {
//                        listSearchRoomType.remove(i);
                        roomType.setRoomFree(0);
                    } else {
                        roomType.setRoomFree(check.getRoomValid());
                    }
                    break;
                }
            }
        }
        
    }
else {
    // Nếu không có ngày, hiển thị toàn bộ loại phòng có sẵn, không cần kiểm tra phòng trống
    for (RoomType roomType : listSearchRoomType) {
        roomType.setRoomFree(roomType.getTotalRoom()); // hoặc một giá trị như -1 để ẩn phần "Rooms Free"
    }
    }




    request.setAttribute("numOfDays", numOfDays);
    request.setAttribute("listRoom", listSearchRoomType);
    request.setAttribute("roomTypeFilter", roomTypeFilter);
    request.setAttribute("source", "search");
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
