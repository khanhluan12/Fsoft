/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ManagerDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.RoomType;

/**
 *
 * @author admin
 */
public class ShowRoomCustomerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShowRoomCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowRoomCustomerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
String checkin = request.getParameter("checkin");
String checkout = request.getParameter("checkout");
String roomTypeFilter = request.getParameter("roomTypeFilter");

ManagerDao managerDao = new ManagerDao();
List<RoomType> roomTypeList;

if (checkin != null && checkout != null && !checkin.isEmpty() && !checkout.isEmpty()) {
    try {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date checkinDate = sdf.parse(checkin);
        Date checkoutDate = sdf.parse(checkout);
        roomTypeList = managerDao.getAvailableRoomTypes(checkinDate, checkoutDate, roomTypeFilter);
        request.setAttribute("source", "check");
    } catch (ParseException e) {
        roomTypeList = managerDao.getRoomType();
        request.setAttribute("source", "default");
    }
} else {
    roomTypeList = managerDao.getRoomType();
     for (RoomType rt : roomTypeList) {
        rt.setRoomFree(5); 
    }
    request.setAttribute("source", "default");
    if (roomTypeFilter != null && !roomTypeFilter.isEmpty()) {
        roomTypeList.removeIf(rt -> {
            String name = rt.getNameRoomType().toLowerCase();
            return !name.contains(roomTypeFilter.toLowerCase());
        });
    }
}


request.setAttribute("listRoom", roomTypeList);
request.setAttribute("pagegRoom", true);
request.setAttribute("source", "default");

request.getRequestDispatcher("customer_room.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
