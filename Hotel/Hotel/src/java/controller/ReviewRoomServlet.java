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
import model.RoomToReview;
import model.User;

@WebServlet("/review-room")
public class ReviewRoomServlet extends HttpServlet {

    private final FeedbackDAO feedbackDAO = new FeedbackDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = null;
        int accountId = -1;

        // Kiểm tra đăng nhập để hiển thị danh sách phòng cần đánh giá
        if (session != null) {
            user = (User) session.getAttribute("userA");
            if (user != null) {
                accountId = user.getIDAccount();
                List<RoomToReview> roomsToReview = feedbackDAO.getRoomsToReviewByUserId(accountId);
                if (roomsToReview != null && !roomsToReview.isEmpty()) {
                    request.setAttribute("roomsToReview", roomsToReview);
                }
            }
        }

        // Lấy toàn bộ feedback (không theo roomType)
        List<Feedback> feedbackList = feedbackDAO.getAllFeedback();

        // In ra console cho M test
        System.out.println("📋 Danh sách feedback:");
        if (feedbackList == null || feedbackList.isEmpty()) {
            System.out.println("🚫 Không có feedback nào trong hệ thống.");
        } else {
            for (Feedback f : feedbackList) {
                System.out.println("🗣️ Feedback ID: " + f.getFeedbackId()
                        + " | Booking ID: " + f.getBookingId()
                        + " | Account ID: " + f.getAccountId()
                        + " | Account Name: " + f.getAccountName()
                        + " | Room: " + f.getRoomName()
                        + " | Date: " + f.getFeedbackDate()
                        + " | Rating: " + f.getRating()
                        + " | Content: " + f.getContent()
                        + " | Admin Reply: " + f.getReplyComment()
                        + " | Author Reply: " + f.getAuthorReply());
            }
        }

        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("/review_room.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Sau này xử lý thêm feedback
    }
}
