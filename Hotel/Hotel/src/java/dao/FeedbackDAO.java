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
import model.Feedback;
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

    public boolean insertFeedback(Feedback feedback) {
        try {
            conn = DBContext.getConnection();//mo ket noi

            String query = "insert Feedback(IDAccount,Content,TimeFeedBack,Rating)\n"
                    + "values (?,?,?,?)";

            ps = conn.prepareStatement(query);
            ps.setInt(1, feedback.getAccountId());
            ps.setString(2, feedback.getContent());
            ps.setString(3, feedback.getFeedbackDate());
            ps.setString(4, feedback.getRating());

            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;

            }
        } catch (Exception e) {
            e.printStackTrace();
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
