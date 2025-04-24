/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ManagerDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.RoomType;

public class LoadRoomToBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ManagerDao rdao = new ManagerDao();
        List<RoomType> rooms = new ArrayList<>();
        String[] idRooms = request.getParameterValues("IDRoomType");
        String[] numberRooms = request.getParameterValues("roomBook");
        int numOfDays = Integer.parseInt(request.getParameter("numOfDays"));
        int maxPerson = 0;
        float price = 0;
        List<String> validIdRooms = new ArrayList<>();
        List<Integer> validNumberRooms = new ArrayList<>();

        for (int i = 0; i < idRooms.length; i++) {
            int numberOfRooms = Integer.parseInt(numberRooms[i]);

            // Chỉ thêm vào danh sách nếu số lượng phòng > 0
            if (numberOfRooms > 0) {
                validIdRooms.add(idRooms[i]);
                validNumberRooms.add(numberOfRooms);
            }
        }
        
        if(validIdRooms.isEmpty()){
            request.setAttribute("mess", "Plese change quanlity to booking");
            request.getRequestDispatcher("checkRoomValid").forward(request, response);
            return;
        }

        for (int i = 0; i < validIdRooms.size(); i++) {
            RoomType r = rdao.getRoomTypeById(validIdRooms.get(i));
            r.setNumberRoomBook(validNumberRooms.get(i));
            maxPerson += r.getMaxPerson();
            price += r.getPrice() * r.getNumberRoomBook() * numOfDays;
            rooms.add(r);
        }

        HttpSession session = request.getSession();
        session.setAttribute("rooms", rooms);
        request.setAttribute("price", price);
        request.setAttribute("maxPerson", maxPerson);
        request.getRequestDispatcher("form_test.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
