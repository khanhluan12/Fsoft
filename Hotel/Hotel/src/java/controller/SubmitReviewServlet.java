package controller;

import dao.FeedbackDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Feedback;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.RoomToReview;
import model.User;

@WebServlet("/submit-review")
public class SubmitReviewServlet extends HttpServlet {

    private final FeedbackDAO feedbackDAO = new FeedbackDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userA");
        // Kiểm tra đăng nhập
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        try {
            // Lấy thông tin từ form
            int accountId = user.getIDAccount();
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String content = request.getParameter("content");
            String rating = request.getParameter("rating");
            // Tạo định dạng ngày giờ hiện tại
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateTime = now.format(formatter);
            // Tạo đối tượng Feedback mới
            Feedback feedback = new Feedback();
            feedback.setAccountId(accountId);
            feedback.setBookingId(bookingId);
            feedback.setContent(content);
            feedback.setFeedbackDate(formattedDateTime);
            feedback.setRating(rating);
            // Thêm feedback vào database
            boolean success = feedbackDAO.insertFeedback(feedback);
            // Lấy danh sách phòng có thể review sau khi đã gửi đánh giá
            List<RoomToReview> roomsToReview = feedbackDAO.getRoomsToReviewByUserId(accountId);
            if (success) {
                session.setAttribute("message", "Thank You For Reviewing!");
                response.sendRedirect("review-room");
            } else {
                session.setAttribute("errorMessage", "Có lỗi xảy ra khi gửi đánh giá. Vui lòng thử lại sau.");
                response.sendRedirect("review-room");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ.");
            request.getRequestDispatcher("review_room.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("review_room.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng người dùng đến servlet review-room nếu họ truy cập trực tiếp
        response.sendRedirect("review-room");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet để xử lý việc gửi đánh giá (review) từ khách hàng";
    }
}
