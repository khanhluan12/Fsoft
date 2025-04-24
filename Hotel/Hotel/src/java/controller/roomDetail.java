package controller;

import dao.FeedbackDAO;
import dao.ManagerDao;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feedback;

/**
 *
 * @author admin
 */
@WebServlet(name = "roomDetail", urlPatterns = {"/roomDetail"})
public class roomDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ManagerDao managerDao = new ManagerDao();
        FeedbackDAO feedbackDAO = new FeedbackDAO();

        int id = Integer.parseInt(request.getParameter("id"));

        // Get room details
        request.setAttribute("room", managerDao.getRoomTypeById(id));

        // Get feedback for this room type
        List<Feedback> feedbackList = feedbackDAO.getAllFeedbackByRoomType(String.valueOf(id));
        request.setAttribute("feedbackList", feedbackList);

        // Get total feedback count for this room type
        int feedbackCount = feedbackDAO.countFeedbackByRoomType(String.valueOf(id));
        request.setAttribute("feedbackCount", feedbackCount);

        request.getRequestDispatcher("roomDetail.jsp").forward(request, response);
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
    }
}
