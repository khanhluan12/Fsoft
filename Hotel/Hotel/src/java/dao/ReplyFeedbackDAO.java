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
import model.Feedback;
import model.ReplyFeedback;

/**
 *
 * @author ptd
 */
public class ReplyFeedbackDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean insertReplyFeedback(int fbId, String content) {
        try {
            conn = DBContext.getConnection();//mo ket noi

            String query = "update Feedback set AdminReply = ? where IDFeedback = ?";

            ps = conn.prepareStatement(query);
            ps.setString(1, content);
            ps.setInt(2, fbId);
           return  ps.executeUpdate() >0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public void addReplyFeedback(String IDAccount, String IDFeedback, String ReplyContent) {
        String query = "insert ReplyFeedback(IDAccount,IDFeedback,ReplyContent)\n"
                    + "values (?,?,?)";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDAccount);
            ps.setString(2, IDFeedback);
            ps.setString(3, ReplyContent);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
