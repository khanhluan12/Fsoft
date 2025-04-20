package controller;

import dao.ManagerDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.RoomType;

/**
 *
 * @author admin
 */
public class ShowRoomTypeServlet extends HttpServlet {

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
            out.println("<title>Servlet ShowRoomTypeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowRoomTypeServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");

        ManagerDao managerDao = new ManagerDao();
        UserDao userDao = new UserDao();

        // Get all room types
        List<RoomType> roomTypeList = managerDao.getRoomType();

        // Get average ratings for all room types
        Map<Integer, Double> averageRatings = userDao.getAverageRatingsByRoomType();

        // Assign average ratings to each RoomType
        for (RoomType roomType : roomTypeList) {
            if (averageRatings.containsKey(roomType.getIDRoomType())) {
                roomType.setAverageRating(averageRatings.get(roomType.getIDRoomType()));
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("listR", roomTypeList);
        request.getRequestDispatcher("manager_room.jsp").forward(request, response);
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
        ManagerDao managerDao = new ManagerDao();
        UserDao userDao = new UserDao();

        // Get all room types
        List<RoomType> roomTypeList = managerDao.getRoomType();

        // Get average ratings for all room types
        Map<Integer, Double> averageRatings = userDao.getAverageRatingsByRoomType();

        // Assign average ratings to each RoomType
        for (RoomType roomType : roomTypeList) {
            if (averageRatings.containsKey(roomType.getIDRoomType())) {
                roomType.setAverageRating(averageRatings.get(roomType.getIDRoomType()));
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("listR", roomTypeList);
        request.getRequestDispatcher("manager_room.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet hiển thị danh sách phòng cho quản lý với đánh giá trung bình";
    }// </editor-fold>
}
