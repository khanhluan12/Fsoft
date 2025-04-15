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
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Booking;
import model.BookingDetail;
import model.BookingDetails;
import model.Contact;
import model.Discount;
import model.RoomType;
import model.User;

/**
 *
 * @author admin
 */
public class ManagerDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //ACCOUNT
    // day thong tin all account ra bang quan ly account (View)
    public List<User> getAccounts() {
        List<User> list = new ArrayList<>();
        String query = "select * from Account";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
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
                        rs.getInt(9));
                u.setIsBan(rs.getBoolean(11));
                list.add(u);
            }
        } catch (Exception e) {
        }
        return list;
    }

    // xoa account theo ID (Delete)
    public void deleteAccount(String IDAccount) {
        String query = "delete from Account where IDAccount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDAccount);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //MANAGER BOOKING
    // day thong tin all Booking ra bang quan ly booking (View)
    public List<Booking> getBooking() {
        List<Booking> list = new ArrayList<>();
        String query = "select * from Booking";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Booking(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDouble(10),
                        rs.getString(11),
                        rs.getString(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    // get list booking
    public List<BookingDetails> getBookingDetails() {
        List<BookingDetails> list = new ArrayList<>();
        String query = "select * from BookingDetails";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookingDetails bd = new BookingDetails(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14));
                bd.setIsCancel(rs.getBoolean(15));
                bd.setOver(isDateBeforeToday(rs.getString(10)));
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

        // So sánh ngày cần kiểm tra với ngày hiện tại
        return dateToCheck.isBefore(today);
    }

    public List<BookingDetails> getBookingDetailsByReceptionist() {
        List<BookingDetails> list = new ArrayList<>();
        String query = "SELECT bd.*\n"
                + "FROM BookingDetails bd\n"
                + "JOIN Account a ON bd.IDAccount = a.IDAccount\n"
                + "WHERE a.IDRole = 2 or a.IDRole =3;";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BookingDetails(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getDouble(12),
                        rs.getString(13),
                        rs.getString(14)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<BookingDetails> getBookingDetailsByCustomer() {
        List<BookingDetails> list = new ArrayList<>();
        String query = "SELECT bd.*\n"
                + "FROM BookingDetails bd\n"
                + "JOIN Account a ON bd.IDAccount = a.IDAccount\n"
                + "WHERE a.IDRole = 1;";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BookingDetails(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getDouble(12),
                        rs.getString(13),
                        rs.getString(14)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<BookingDetails> searchBookingDetails(String Phone) {
        List<BookingDetails> list = new ArrayList<>();
        String query = "select * from BookingDetails where Phone = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, Phone);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BookingDetails(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getDouble(12),
                        rs.getString(13),
                        rs.getString(14)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updateBookingStatus(String IDBooking, String BookingStatus) {
        String query = "update BookingDetails set Note = ? where IDBooking = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);

            ps.setString(1, BookingStatus);
            ps.setString(2, IDBooking);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // xoa account theo ID (Delete)
    public void deleteBooking(String IDBooking) {
        String query = "delete from Booking where IDBooking = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDBooking);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //MANAGER ROOMTYPE
    public List<RoomType> getRoomType() {
        List<RoomType> list = new ArrayList<>();
        String query = "select * from RoomType";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                RoomType room = new RoomType(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9));
                room.setImage(rs.getString(10));
                list.add(room);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public RoomType getRoomTypeById(int id) {
        String query = "select * from RoomType where IDRoomType = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                RoomType room = new RoomType(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9));
                room.setImage(rs.getString(10));
                return room;
            }
            return null;
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        ManagerDao dao = new ManagerDao();
        for (var bookingDetails : dao.getBookingDetails()) {
            System.out.println(bookingDetails.getEmail());
        }
    }

    public void addRoomType(String NameRoomType, String MaxPerson, String NumberOfBed, String NumberOfBath, String Price, String TotalRoom, String RoomStatus, String Content, String image) {
        String query = "insert into RoomType(NameRoomType,MaxPerson,NumberOfBed,NumberOfBath,Price, TotalRoom,RoomStatus,Content,Image) values (?,?,?,?,?,?,?,?,?)";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, NameRoomType);
            ps.setString(2, MaxPerson);
            ps.setString(3, NumberOfBed);
            ps.setString(4, NumberOfBath);
            ps.setString(5, Price);
            ps.setString(6, TotalRoom);
            ps.setString(7, RoomStatus);
            ps.setString(8, Content);
            ps.setString(9, image);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public RoomType getRoomTypeById(String IDRoomType) {
        String query = "select * from RoomType where IDRoomType=?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDRoomType);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new RoomType(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return null;
    }

    // xoa RoomType theo ID (Delete)
    public void deleteRoomType(String IDRoomType) {
        String query = "delete from RoomType where IDRoomType = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDRoomType);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

// chinh sua thong tin RoomType (Update)
    public void updateRoomType(String IDRoomType, String NameRoomType, String MaxPerson, String NumberOfBed, String NumberOfBath, String Price, String totalRoom, String RoomStatus, String Content) {
        String query = "update RoomType set NameRoomType=?, MaxPerson=?, NumberOfBed=?, NumberOfBath=?,Price=?, TotalRoom=? ,RoomStatus=?, Content=? where IDRoomType = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, NameRoomType);
            ps.setString(2, MaxPerson);
            ps.setString(3, NumberOfBed);
            ps.setString(4, NumberOfBath);
            ps.setString(5, Price);
            ps.setString(6, totalRoom);
            ps.setString(7, RoomStatus);
            ps.setString(8, Content);
            ps.setString(9, IDRoomType);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateRoomTypeImage(String IDRoomType, String Image) {
        String query = "update RoomType set Image = ? where IDRoomType = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, Image);
            ps.setString(2, IDRoomType);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateTotalRoomType(String IDRoomType, String totalRoom, String RoomStatus) {
        String query = "update RoomType set TotalRoom=? ,RoomStatus=? where IDRoomType = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, totalRoom);
            ps.setString(2, RoomStatus);
            ps.setString(3, IDRoomType);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //MANAGER DISCOUNT
    public List<Discount> getDiscount() {
        List<Discount> list = new ArrayList<>();
        String query = "select * from Discount";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Discount(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addDiscount(String DiscountName, String DiscountValue, String StartDay, String EndDay, String Note) {
        String query = "insert into Discount(DiscountName,DiscountValue,StartDay,EndDay,Note) values (?,?,?,?,?)";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, DiscountName);
            ps.setString(2, DiscountValue);
            ps.setString(3, StartDay);
            ps.setString(4, EndDay);
            ps.setString(5, Note);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // xoa Discount theo ID (Delete)
    public void deleteDiscount(String IDDiscount) {
        String query = "delete from Discount where IDDiscount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDDiscount);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

// chinh sua thong tin Discount (Update)
    public void updateDiscount(String IDDiscount, String DiscountName, String DiscountValue, String StartDay, String EndDay, String Note) {
        String query = "update Discount set DiscountName=?, DiscountValue=?, StartDay=?, EndDay=?, Note=? where IDDiscount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, DiscountName);
            ps.setString(2, DiscountValue);
            ps.setString(3, StartDay);
            ps.setString(4, EndDay);
            ps.setString(5, Note);
            ps.setString(6, IDDiscount);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Booking getBookingById(String IDBooking) {
        String query = "select * from Booking where IDBooking=?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDBooking);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Booking(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        rs.getString(10),
                        rs.getString(11)));
            }
        } catch (Exception e) {
        }
        return null;
    }

    // CONTACT
    public List<Contact> getContact() {
        List<Contact> list = new ArrayList<>();
        String query = "select * from Contact";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Contact(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updateContact(String IDContact, String ContactStatus) {
        String query = "update Contact set ContactStatus = ? where IDContact = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);

            ps.setString(1, ContactStatus);
            ps.setString(2, IDContact);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateDiscount(int id, String name, String valueStr, String start, String end, String note) {
        String sql = "UPDATE Discount SET discountName = ?, discountValue = ?, startDay = ?, endDay = ?, note = ? WHERE IDDiscount = ?";
        try (Connection con = DBContext.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            double value = Double.parseDouble(valueStr);

            // Đổi sang định dạng ngày đúng của input type="date"
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date utilStart = sdf.parse(start);
            Date utilEnd = sdf.parse(end);

            java.sql.Date sqlStart = new java.sql.Date(utilStart.getTime());
            java.sql.Date sqlEnd = new java.sql.Date(utilEnd.getTime());

            ps.setString(1, name);
            ps.setDouble(2, value);
            ps.setDate(3, sqlStart);
            ps.setDate(4, sqlEnd);
            ps.setString(5, note);
            ps.setInt(6, id);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<RoomType> getAvailableRoomTypes(Date checkin, Date checkout, String roomTypeFilter) {
        List<RoomType> list = new ArrayList<>();
        String sql = "SELECT rt.*, "
                + "ISNULL(rt.TotalRoom - SUM(bd.NumberOfRoom), rt.TotalRoom) AS roomFree "
                + "FROM RoomType rt "
                + "LEFT JOIN BookingDetail bd ON rt.IDRoomType = bd.IDRoomType "
                + "LEFT JOIN BookingDetails b ON b.IDBooking = bd.IDBookingDetail "
                + "AND b.isCancel = 0 "
                + "AND NOT (b.Checkout <= ? OR b.Checkin >= ?) "
                + "WHERE rt.RoomStatus = 'Valid' ";

        if (roomTypeFilter != null && !roomTypeFilter.isEmpty()) {
            sql += "AND LOWER(rt.NameRoomType) LIKE ? ";
        }

        sql += "GROUP BY rt.IDRoomType, rt.NameRoomType, rt.MaxPerson, rt.NumberOfBed, "
                + "rt.NumberOfBath, rt.Price, rt.TotalRoom, rt.RoomStatus, rt.Content, rt.Image";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDate(1, new java.sql.Date(checkin.getTime()));
            ps.setDate(2, new java.sql.Date(checkout.getTime()));

            if (roomTypeFilter != null && !roomTypeFilter.isEmpty()) {
                ps.setString(3, "%" + roomTypeFilter.toLowerCase() + "%");
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RoomType r = new RoomType(
                        rs.getInt("IDRoomType"),
                        rs.getString("NameRoomType"),
                        rs.getInt("MaxPerson"),
                        rs.getInt("NumberOfBed"),
                        rs.getInt("NumberOfBath"),
                        rs.getInt("Price"),
                        rs.getInt("TotalRoom"),
                        rs.getString("RoomStatus"),
                        rs.getString("Content")
                );
                r.setImage(rs.getString("Image"));
                r.setRoomFree(rs.getInt("roomFree"));
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<BookingDetail> getBookingDetailsByBookingId(int bookingId) {
        List<BookingDetail> list = new ArrayList<>();
        String query = "SELECT bd.IDBookingDetail, bd.IDRoomType, bd.NumberOfRoom, rt.NameRoomType "
                + "FROM BookingDetail bd "
                + "JOIN RoomType rt ON bd.IDRoomType = rt.IDRoomType "
                + "WHERE bd.IDBookingDetail = ?";
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookingId);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookingDetail detail = new BookingDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4)
                );
                list.add(detail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
