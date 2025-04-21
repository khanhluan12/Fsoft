package controller;

import dao.ShiftDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ShiftSchedule;
import model.User;

public class Shifts extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userA");

     if (user != null) {
            int userID = user.getIDAccount();
            ShiftDAO shiftDAO = new ShiftDAO();
            List<ShiftSchedule> shiftList = shiftDAO.getShiftsByUserID(userID);
            request.setAttribute("shiftList", shiftList);
            shiftList.sort((s1, s2) -> s1.getStartDateTime().compareTo(s2.getStartDateTime()));
            request.getRequestDispatcher("view_Shift.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp"); 
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
