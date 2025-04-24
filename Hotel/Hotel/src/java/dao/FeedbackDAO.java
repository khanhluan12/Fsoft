/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbcontext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.BookingDetail;
import model.Feedback;
import model.RoomToReview;
import model.User;

/**
 *
 * @author ptd
 */
public class FeedbackDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Feedback> getLastFiveFeedback() {

        List<Feedback> list = new ArrayList<>();
        try {
            conn = DBContext.getConnection();//mo ket noi

            String query = "select top 5 f.IDFeedback, f.IDAccount, IDBooking, TimeFeedBack, AdminReply, Rating, FullName, f.Content, a.UserName\n"
                    + "from Feedback f join Account a on f.IDAccount = a.IDAccount\n"
                    + "left join ReplyFeedback rl on f.IDFeedback = rl.IDFeedback\n"
                    + "order by f.IDFeedback desc";

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int feedbackId = rs.getInt("IDFeedback");
                int accountId = rs.getInt("IDAccount");
                int bookingId = rs.getInt("IDBooking");
                String feedbackDate = rs.getString("TimeFeedBack");
                String content = rs.getString("Content");
                String rating = rs.getString("Rating");
                String accountName = rs.getString("FullName");
                String replyContent = rs.getString("AdminReply");
                String authorReply = rs.getString("UserName");

                list.add(new Feedback(feedbackId, bookingId, accountId, accountName, feedbackDate, content, rating, replyContent, authorReply));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Feedback> getAllFeedback() {

        List<Feedback> list = new ArrayList<>();
        try {
            conn = DBContext.getConnection();//mo ket noi

            String query = "select IDFeedback, f.IDAccount, IDBooking, TimeFeedBack, Content, Rating, AdminReply, FullName\n"
                    + "from Feedback f join Account a on f.IDAccount = a.IDAccount\n";

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int feedbackId = rs.getInt("IDFeedback");
                int accountId = rs.getInt("IDAccount");
                int bookingId = rs.getInt("IDBooking");
                String feedbackDate = rs.getString("TimeFeedBack");
                String content = rs.getString("Content");
                String rating = rs.getString("Rating");
                String accountName = rs.getString("FullName");
                String comment = rs.getString("AdminReply");
                Feedback f = new Feedback(feedbackId, bookingId, accountId, accountName, feedbackDate, content, rating);
                f.setReplyComment(comment);
                list.add(f);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

   public int countFeedbackByRoomType(String idRoomType) {
        int count = 0;
        try {
            conn = DBContext.getConnection();
            // Updated SQL query to correctly count feedback for a specific room type
            String sql = "SELECT COUNT(*) FROM Feedback fb "
                    + "JOIN BookingDetails bds ON fb.IDBooking = bds.IDBooking "
                    + "JOIN BookingDetail bd ON bds.IDBooking = bd.IDBookingDetail "
                    + "JOIN RoomType rt ON bd.IDRoomType = rt.IDRoomType "
                    + "WHERE rt.IDRoomType = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, idRoomType);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return count;
    }

    public List<Feedback> getAllFeedbackByRoomType(String idRoomType) {
        List<Feedback> list = new ArrayList<>();
        try {
            conn = DBContext.getConnection();

            // Cập nhật câu lệnh SQL để lấy tất cả feedback mà không phân trang
            String sql = "SELECT fb.IDFeedback, fb.IDAccount, fb.IDBooking, fb.TimeFeedBack, fb.Content, fb.Rating, "
                    + "fb.AdminReply, acc.FullName, rt.NameRoomType "
                    + "FROM Feedback fb "
                    + "JOIN Account acc ON fb.IDAccount = acc.IDAccount "
                    + "JOIN BookingDetails bds ON fb.IDBooking = bds.IDBooking "
                    + "JOIN BookingDetail bd ON bds.IDBooking = bd.IDBookingDetail "
                    + "JOIN RoomType rt ON bd.IDRoomType = rt.IDRoomType "
                    + "WHERE rt.IDRoomType = ? "
                    + "ORDER BY fb.TimeFeedBack DESC";

            ps = conn.prepareStatement(sql);
            ps.setString(1, idRoomType);  // idRoomType (thực thể phòng)
            rs = ps.executeQuery();

            while (rs.next()) {
                int feedbackId = rs.getInt("IDFeedback");
                int accountId = rs.getInt("IDAccount");
                int bookingId = rs.getInt("IDBooking");
                String feedbackDate = rs.getString("TimeFeedBack");
                String content = rs.getString("Content");
                String rating = rs.getString("Rating");
                String accountName = rs.getString("FullName");
                String comment = rs.getString("AdminReply");
                String roomName = rs.getString("NameRoomType");

                // Tạo đối tượng Feedback và thêm vào list
                Feedback f = new Feedback(feedbackId, bookingId, accountId, accountName, feedbackDate, content, rating);
                f.setReplyComment(comment);
                f.setRoomName(roomName); // Cần có setter trong class Feedback
                list.add(f);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đảm bảo đóng các tài nguyên sau khi sử dụng
        }
        return list;
    }

    public List<Feedback> getAllFeedbackWithRoomName() {
        List<Feedback> list = new ArrayList<>();
        String query = "SELECT f.IDFeedback, f.IDBooking, f.IDAccount, a.FullName, f.TimeFeedBack, f.Content, f.Rating, f.AdminReply, f.ReplyStatus, "
                + "rt.NameRoomType "
                + "FROM Feedback f "
                + "JOIN Account a ON f.IDAccount = a.IDAccount "
                + "JOIN BookingDetails bd ON f.IDBooking = bd.IDBooking "
                + "JOIN BookingDetail bdt ON bd.IDBooking = bdt.IDBookingDetail "
                + "JOIN RoomType rt ON bdt.IDRoomType = rt.IDRoomType "
                + "ORDER BY f.TimeFeedBack DESC";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean insertFeedback(Feedback feedback) {
        try {
            conn = DBContext.getConnection();

            String query = "INSERT INTO Feedback (IDAccount, IDBooking, Content, TimeFeedBack, Rating) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setInt(1, feedback.getAccountId());
            ps.setInt(2, feedback.getBookingId()); // Dù tên cột là IDBooking, giá trị là IDBookingDetail
            ps.setString(3, feedback.getContent());
            ps.setString(4, feedback.getFeedbackDate());
            ps.setString(5, feedback.getRating());

            int rs = ps.executeUpdate();
            return rs > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public boolean deleteFeedback(int id) {
        try {
            conn = DBContext.getConnection();//mo ket noi

            String query = "delete Feedback where IDFeedback = ?";

            ps = conn.prepareStatement(query);
            ps.setInt(1, id);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Feedback> searchFeedbackByUser(String txtSearch) {

        List<Feedback> list = new ArrayList<>();
        try {
            conn = DBContext.getConnection();//mo ket noi

            String query = "select IDFeedback, f.IDAccount, IDBooking, TimeFeedBack, Content, Rating, FullName\n"
                    + "from Feedback f join Account a on f.IDAccount = a.IDAccount\n"
                    + "where FullName like ?";

            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int feedbackId = rs.getInt("IDFeedback");
                int accountId = rs.getInt("IDAccount");
                int bookingId = rs.getInt("IDBooking");
                String feedbackDate = rs.getString("TimeFeedBack");
                String content = rs.getString("Content");
                String rating = rs.getString("Rating");
                String accountName = rs.getString("FullName");

                list.add(new Feedback(feedbackId, bookingId, accountId, accountName, feedbackDate, content, rating));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Feedback> filterFeedbackByRating(String rating) {

        List<Feedback> list = new ArrayList<>();
        try {
            conn = DBContext.getConnection();//mo ket noi

            String query = "select IDFeedback, f.IDAccount, IDBooking, TimeFeedBack, Content, Rating, FullName\n"
                    + "from Feedback f join Account a on f.IDAccount = a.IDAccount\n"
                    + "where Rating = ?";

            ps = conn.prepareStatement(query);
            ps.setString(1, rating);
            rs = ps.executeQuery();
            while (rs.next()) {
                int feedbackId = rs.getInt("IDFeedback");
                int accountId = rs.getInt("IDAccount");
                int bookingId = rs.getInt("IDBooking");
                String feedbackDate = rs.getString("TimeFeedBack");
                String content = rs.getString("Content");
                String accountName = rs.getString("FullName");

                list.add(new Feedback(feedbackId, bookingId, accountId, accountName, feedbackDate, content, rating));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<RoomToReview> getRoomsToReviewByUserId(int userId) {
        List<RoomToReview> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBContext.getConnection();
            String sql = """
            SELECT bd.IDBookingDetail, bd.IDRoomType, bd.NumberOfRoom,
                   b.IDBooking, rt.NameRoomType
            FROM BookingDetail bd
            JOIN BookingDetails b ON bd.IDBookingDetail = b.IDBooking
            JOIN RoomType rt ON bd.IDRoomType = rt.IDRoomType
            WHERE b.IDAccount = ?
              AND b.Note = 'Success'
              AND b.isCancel = 0  -- Chỉ lấy booking chưa hủy
            """;

            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
                int bookingId = rs.getInt("IDBooking");  // Sửa lại: dùng IDBooking thay vì IDBookingDetail
                if (!isRoomReviewed(userId, bookingId)) {
                    RoomToReview room = new RoomToReview();
                    room.setIdBooking(bookingId);
                    room.setIdRoomType(rs.getInt("IDRoomType"));
                    room.setRoomTypeName(rs.getString("NameRoomType"));
                    room.setNumberOfRoom(rs.getInt("NumberOfRoom"));
                    list.add(room);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, ps, conn);  // Tách thành hàm riêng để tái sử dụng
        }
        return list;
    }

    public boolean isRoomReviewed(int accountId, int bookingId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBContext.getConnection();
            String query = "SELECT 1 FROM Feedback WHERE IDAccount = ? AND IDBooking = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountId);
            ps.setInt(2, bookingId);  // Sửa lại: so sánh với IDBooking
            rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            closeResources(rs, ps, conn);
        }
    }
    

// Hàm đóng tài nguyên tái sử dụng
    private void closeResources(ResultSet rs, PreparedStatement ps, Connection conn) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//    public boolean deleteFeedback(int feedbackId) {
//        try {
//            conn = DBContext.getConnection();//mo ket noi
//
//            String query = "update Feedback\n"
//                    + "set Active = 0\n"
//                    + "where IDFeedback = ?";
//
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, feedbackId);
//           
//
//            int rs = ps.executeUpdate();
//            if (rs > 0) {
//                return true;
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
}
