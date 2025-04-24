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
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
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
     public boolean hasActiveBooking(int accountId) {
        String sql = "SELECT COUNT(*) FROM BookingDetails "
                + "WHERE IDAccount = ? "
                + "AND isCancel = 0 "
                + "AND Checkout >= CAST(GETDATE() AS DATE)";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();

            return rs.next() && rs.getInt(1) > 0;

        } catch (SQLException e) {
            System.out.println("Error checking active booking: " + e.getMessage());
            return false;
        }
    }
      public boolean isDateWithinBookingPeriod(int accountId, LocalDate rentalDate) {
        String sql = "SELECT COUNT(*) FROM BookingDetails "
                + "WHERE IDAccount = ? "
                + "AND isCancel = 0 "
                + "AND ? BETWEEN Checkin AND Checkout";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, accountId);
            ps.setDate(2, java.sql.Date.valueOf(rentalDate));
            ResultSet rs = ps.executeQuery();

            return rs.next() && rs.getInt(1) > 0;

        } catch (SQLException e) {
            System.out.println("Error checking rental date validity: " + e.getMessage());
            return false;
        }
    }
 public List<BookingDetails> getActiveBookings(int accountId) {
        List<BookingDetails> bookings = new ArrayList<>();
        String sql = "SELECT * FROM BookingDetails "
                + "WHERE IDAccount = ? "
                + "AND isCancel = 0 "
                + "AND Checkout >= CAST(GETDATE() AS DATE)";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookingDetails booking = new BookingDetails(
                        rs.getInt("IDBooking"),
                        rs.getInt("IDAccount"),
                        rs.getInt("IDDiscount"),
                        rs.getString("FullName"),
                        rs.getString("Gender"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getInt("Adult"),
                        rs.getInt("Child"),
                        rs.getString("CheckIn"),
                        rs.getString("CheckOut"),
                        rs.getDouble("TotalPrice"),
                        rs.getString("BookingTime"),
                        rs.getString("Note")
                );
                booking.setIsCancel(rs.getBoolean("isCancel"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            System.out.println("Error getting active bookings: " + e.getMessage());
        }
        return bookings;
    }

    public int getTotalGuestsForActiveBookings(int accountId) {
        String sql = "SELECT SUM(Adult) as total_guests FROM BookingDetails WHERE IDAccount = ? AND isCancel = 0 AND Checkout >= CAST(GETDATE() AS DATE)";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();

            return rs.next() ? rs.getInt("total_guests") : 0;

        } catch (SQLException e) {
            System.out.println("Error getting total guests: " + e.getMessage());
            return 0;
        }
    }
    public BookingDetails getBookingById(int bookingId) {
        BookingDetails booking = null;
        String query = "SELECT b.*, r.NameRoomType FROM BookingDetails b "
                + "INNER JOIN BookingDetail bd ON b.IDBooking = bd.IDBookingDetail "
                + "INNER JOIN RoomType r ON bd.IDRoomType = r.IDRoomType "
                + "WHERE b.IDBooking = ?";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookingId);
            rs = ps.executeQuery();

            if (rs.next()) {
                booking = new BookingDetails();
                booking.setIDBooking(rs.getInt("IDBooking"));
                booking.setFullName(rs.getString("FullName"));
                booking.setEmail(rs.getString("Email"));
                booking.setPhone(rs.getString("Phone"));
                booking.setAdult(rs.getInt("Adult"));
                booking.setChild(rs.getInt("Child"));
                booking.setCheckIn(rs.getDate("Checkin").toString());  // Changed to match your entity field
                booking.setCheckOut(rs.getDate("Checkout").toString()); // Changed to match your entity field
                booking.setNote(rs.getString("Note"));
                // Set other properties as needed
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
        return booking;
    }
}
