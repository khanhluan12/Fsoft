/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbcontext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.BookingDetails;
import java.sql.Statement;

/**
 *
 * @author admin
 */
public class BookingDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void cancelBooking(int bookingId) {
        String query = "UPDATE BookingDetails SET isCancel = ?, note = ? WHERE IDBooking = ?";
        try {
            conn = DBContext.getConnection(); // mở kết nối
            ps = conn.prepareStatement(query);
            ps.setBoolean(1, true);
            ps.setString(2, "Cancelled");
            ps.setInt(3, bookingId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // log lỗi ra, đừng để trống
        } finally {
            try {
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
    }

    public boolean isBooked(int accountID) {
        String query = "Select * from BookingDetails where IDAccount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {

        }
        return false;
    }

    public int inserBookings(BookingDetails bookingDetails) {
        String query = "INSERT INTO BookingDetails (IDAccount, IDDiscount, FullName, Gender, Email, Phone, Adult, Child, Checkin, Checkout, TotalPrice, BookingTime, Note, isCancel) \n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, bookingDetails.getIDAccount());
            ps.setInt(2, bookingDetails.getIDDiscount());
            ps.setString(3, bookingDetails.getFullName());
            ps.setString(4, bookingDetails.getGender());
            ps.setString(5, bookingDetails.getEmail());
            ps.setString(6, bookingDetails.getPhone());
            ps.setInt(7, bookingDetails.getAdult());
            ps.setInt(8, bookingDetails.getChild());
            ps.setString(9, bookingDetails.getCheckIn());
            ps.setString(10, bookingDetails.getCheckOut());
            ps.setFloat(11, (float) bookingDetails.getTotalPrice());
            ps.setString(12, bookingDetails.getBookingTime());
            ps.setString(13, bookingDetails.getNote());
            ps.setBoolean(14, false);
            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                // Retrieve the auto-generated key
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean inserBookingRoom(int bdID, int roomId, int numberOfRoom) {
        String query = "INSERT INTO BookingDetail (IDBookingDetail, IDRoomType, NumberOfRoom)\n"
                + "VALUES (?, ?, ?);";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setInt(1, bdID);
            ps.setInt(2, roomId);
            ps.setInt(3, numberOfRoom);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
