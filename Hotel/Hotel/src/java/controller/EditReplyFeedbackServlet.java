package controller;

import dao.FeedbackDAO;
import dao.ReplyFeedbackDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Feedback;

public class EditReplyFeedbackServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String content = request.getParameter("content");
        String feedbackId = request.getParameter("txtId");
        ReplyFeedbackDAO dao = new ReplyFeedbackDAO();
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        String url = "error.jsp";

        try {
            HttpSession session = request.getSession();
            boolean result = dao.updateReplyFeedback(Integer.parseInt(feedbackId), content);

            if (result) {
                List<Feedback> listFeedback = feedbackDAO.getAllFeedback();
                request.setAttribute("LIST_ADMIN_FFEDBACK", listFeedback);
                request.setAttribute("EDIT_SUCCESS", "success");
                url = "feedbackAdmin";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
