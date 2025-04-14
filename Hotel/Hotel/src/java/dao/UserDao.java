/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbcontext.DBContext;
//import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.sql.Date;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Booking;
import model.BookingDetails;
import model.CheckRoomValid;
import model.Contact;
import model.User;

/**
 *
 * @author admin
 */
public class UserDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public User ActiveAccount(int accountId) {
        String query = "update Account set isActive = ? where IDAccount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setBoolean(1, true);
            ps.setInt(2, accountId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return null;
    }
    
    public User BanAndUnbanAccount(int accountId, boolean isban) {
        String query = "update Account set IsBan = ? where IDAccount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setBoolean(1, isban);
            ps.setInt(2, accountId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return null;
    }


    public User ResetPass(int userId, String newPass) {
        String query = "update Account set Pass = ? where IDAccount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, newPass);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return null;
    }

    // login
    public User checkAccountValid(String user, String pass) {
        String query = "select * from Account where UserName = ? and Pass = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getBoolean(10));
                u.setIsBan(rs.getBoolean(11));
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User checkAccountExist(String user) {
        String query = "select * from Account where UserName = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    // them account moi (register)
    public int addAccount(String UserName, String Pass, String FullName, String Gender, String City, String Email, String Phone, String IDRole) {
        String query = "insert into Account(UserName,Pass,FullName,Gender,City,Email,Phone,IDRole,isActive) values(?,?,?,?,?,?,?,?,?)";
        int generatedId = -1;

        try {
            conn = DBContext.getConnection(); // Open connection
            ps = conn.prepareStatement(query, ps.RETURN_GENERATED_KEYS);
            ps.setString(1, UserName);
            ps.setString(2, Pass);
            ps.setString(3, FullName);
            ps.setString(4, Gender);
            ps.setString(5, City);
            ps.setString(6, Email);
            ps.setString(7, Phone);
            ps.setString(8, IDRole);
            ps.setBoolean(9, false);

            ps.executeUpdate();

            // Retrieve the generated key
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return generatedId;
    }

    // chinh sua thong tin account (Update)
    public void updateAccount(String IDAccount, String UserName, String Pass, String FullName, String Gender, String City, String Email, String Phone) {
        String query = "update Account set UserName=?, Pass=?, FullName=?, Gender=?, City=? , Email=?, Phone=?  where IDAccount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, UserName);
            ps.setString(2, Pass);
            ps.setString(3, FullName);
            ps.setString(4, Gender);
            ps.setString(5, City);
            ps.setString(6, Email);
            ps.setString(7, Phone);
            ps.setString(8, IDAccount);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // them booking moi (booking)
    public Booking addBooking(String IDAccount, String IDDiscount, String IDRoomType, String Adult, String Child, String CheckIn, String CheckOut, String NumberOfRoom, String TotalPrice, String BookingTime, String Note) {
        String query = "insert into BookingDetails(IDAccount,IDDiscount,IDRoomType,Adult,Child,Checkin,Checkout,NumberOfRooms,TotalPrice,BookingTime,Note) values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDAccount);
            ps.setString(2, IDDiscount);
            ps.setString(3, IDRoomType);
            ps.setString(4, Adult);
            ps.setString(5, Child);
            ps.setString(6, CheckIn);
            ps.setString(7, CheckOut);
            ps.setString(8, NumberOfRoom);
            ps.setString(9, TotalPrice);
            ps.setString(10, BookingTime);
            ps.setString(11, Note);

            ps.executeUpdate();
        } catch (Exception e) {
        }
        return null;
    }

    public BookingDetails addBookingDetails(String IDAccount, String IDDiscount, String IDRoomType, String FullName,
            String Gender, String Email, String Phone, String Adult, String Child,
            Date CheckIn, Date CheckOut, String NumberOfRoom, String TotalPrice,
            Date BookingTime, String Note) {
        String query = "INSERT INTO BookingDetails (IDAccount, IDDiscount, IDRoomType, FullName, Gender, Email, Phone, Adult, Child, Checkin, Checkout, NumberOfRooms, TotalPrice, BookingTime, Note, isCancel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = DBContext.getConnection(); // Open connection
            ps = conn.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(IDAccount));
            ps.setInt(2, Integer.parseInt(IDDiscount));
            ps.setInt(3, Integer.parseInt(IDRoomType));
            ps.setString(4, FullName);
            ps.setString(5, Gender);
            ps.setString(6, Email);
            ps.setString(7, Phone);
            ps.setInt(8, Integer.parseInt(Adult));
            ps.setInt(9, Integer.parseInt(Child));
            ps.setDate(10, CheckIn);
            ps.setDate(11, CheckOut);
            ps.setInt(12, Integer.parseInt(NumberOfRoom));
            ps.setDouble(13, Double.parseDouble(TotalPrice));
            ps.setDate(14, BookingTime);
            ps.setString(15, Note);
            ps.setBoolean(16, false);

            int result = ps.executeUpdate();
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

// chinh sua thong tin account (Update)
    public void updateBooking(String IDBooking, String Adult, String Child, String CheckIn, String CheckOut, String NumberOfRoom, String Note) {
        String query = "update Booking set Adult=?, Child=?, CheckIn=?, CheckOut=?, NumberOfRoom=? , Note=? where IDBooking = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, Adult);
            ps.setString(2, Child);
            ps.setString(3, CheckIn);
            ps.setString(4, CheckOut);
            ps.setString(5, NumberOfRoom);
            ps.setString(6, Note);
            ps.setString(7, IDBooking);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean isRoomAvailable(int IDRoomType, Date CheckIn, Date CheckOut) {
        try (Connection conn = DBContext.getConnection()) {
            // Get the total number of rooms available for the specified room type
            String sql = "SELECT TotalRoom FROM NameRoomType WHERE IDRoomType = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, IDRoomType);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        int totalRooms = rs.getInt("TotalRoom");

                        // Check if there are any overlapping reservations for the specified room type and date range
                        sql = "SELECT COUNT(*) FROM reservations WHERE IDRoomType = ? "
                                + "AND CheckIn < ? AND CheckOut > ?";
                        try (PreparedStatement stmt2 = conn.prepareStatement(sql)) {
                            stmt2.setInt(1, IDRoomType);
                            stmt2.setDate(2, new java.sql.Date(CheckOut.getTime()));
                            stmt2.setDate(3, new java.sql.Date(CheckIn.getTime()));
                            try (ResultSet rs2 = stmt2.executeQuery()) {
                                if (rs2.next()) {
                                    int reservedRooms = rs2.getInt(1);
                                    int availableRooms = totalRooms - reservedRooms;
                                    return availableRooms > 0; // Room is available if there are available rooms left
                                }
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<CheckRoomValid> checkRoomValid(String checkIn, String checkOut) {
        List<CheckRoomValid> lcr = new ArrayList<>();
        String query = "EXEC GetAvailableRoomTypes @checkin=?, @checkout=?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, checkIn);
            ps.setString(2, checkOut);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int roomId=rs.getInt(1);
                    int roomValid=0;
                    try {
                        roomValid=rs.getInt(8);
                    } catch (Exception e) {
                    }
                    if(roomValid==0)roomValid=rs.getInt(7);
                    lcr.add(new CheckRoomValid(roomId, roomValid));
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Nên sử dụng logging framework để ghi lại lỗi
        }
        return lcr;
    }

    public User getAccountByEmail(String email) {
        String query = "select * from Account where Email=?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User getAccountById(String IDAccount) {
        String query = "select * from Account where IDAccount=?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDAccount);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Contact addContact(String IDAccount, String Name, String Email, String Phone, String Message, String Status) {
        String query = "insert into Contact(IDAccount, ContactName,ContactEmail, ContactPhone, ContactMessage, ContactStatus) values(?,?,?,?,?,?)";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDAccount);
            ps.setString(2, Name);
            ps.setString(3, Email);
            ps.setString(4, Phone);
            ps.setString(5, Message);
            ps.setString(6, Status);

            ps.executeUpdate();
        } catch (Exception e) {
        }
        return null;
    }

    // get list booking by User id
public List<BookingDetails> getBookingDetailsByUserId(int accountId) {
    List<BookingDetails> list = new ArrayList<>();
    String query = "SELECT bd.*, rt.NameRoomType " +
                   "FROM BookingDetails bd " +
                   "JOIN BookingDetail bkd ON bd.IDBooking = bkd.IDBookingDetail " +  // Liên kết BookingDetails và BookingDetail
                   "JOIN RoomType rt ON bkd.IDRoomType = rt.IDRoomType " +  // Liên kết BookingDetail và RoomType
                   "WHERE bd.IDAccount = ?";

    try {
        conn = DBContext.getConnection();  // Mở kết nối
        ps = conn.prepareStatement(query);
        ps.setInt(1, accountId);
        rs = ps.executeQuery();
        
        while (rs.next()) {
            // Khởi tạo đối tượng BookingDetails từ kết quả truy vấn
            BookingDetails bd = new BookingDetails(
                rs.getInt("IDBooking"),   // IDBooking
                rs.getInt("IDAccount"),   // IDAccount
                rs.getInt("IDDiscount"),  // IDDiscount
                rs.getString("FullName"), // FullName
                rs.getString("Gender"),   // Gender
                rs.getString("Email"),    // Email
                rs.getString("Phone"),    // Phone
                rs.getInt("Adult"),       // Adult
                rs.getInt("Child"),       // Child
                rs.getString("Checkin"),  // Checkin
                rs.getString("Checkout"), // Checkout
                rs.getDouble("TotalPrice"), // TotalPrice
                rs.getString("BookingTime"), // BookingTime
                rs.getString("Note"),     // Note
                rs.getBoolean("isCancel"), // isCancel
                rs.getString("NameRoomType") // NameRoomType từ bảng RoomType
            );

            // Kiểm tra nếu booking đã bị hủy hoặc quá hạn
            bd.setOver(isDateBeforeToday(rs.getString("Checkin")));
            list.add(bd);
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
    return list;
}



    private static boolean isDateBeforeToday(String dateString) {
        // Định dạng ngày tháng
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        // Chuyển đổi chuỗi ngày tháng thành đối tượng LocalDate
        LocalDate dateToCheck = LocalDate.parse(dateString, formatter);
        // Lấy ngày hiện tại
        LocalDate today = LocalDate.now();
        // Lấy ngày mai
        LocalDate tomorrow = today.plusDays(1);
        // So sánh ngày cần kiểm tra với ngày mai
        return dateToCheck.isEqual(tomorrow);
    }

    public static boolean areDateRangesOverlapping(String startA, String endA, String startC, String endC) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate startDateA = LocalDate.parse(startA, formatter);
        LocalDate endDateA = LocalDate.parse(endA, formatter);
        LocalDate startDateC = LocalDate.parse(startC, formatter);
        LocalDate endDateC = LocalDate.parse(endC, formatter);

        return !(endDateA.isBefore(startDateC) || endDateC.isBefore(startDateA));
    }

    public static void main(String[] args) {
        UserDao dao = new UserDao();
        dao.checkRoomValid("20240802", "20240806");
    }
}
