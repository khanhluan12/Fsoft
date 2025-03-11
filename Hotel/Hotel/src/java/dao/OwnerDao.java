/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbcontext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.BookingByDate;

/**
 *
 * @author admin
 */
public class OwnerDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int getTotalRevenue() {
        String query = "SELECT SUM(TotalPrice) AS TotalSum\n"
                + "FROM BookingDetails;";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getTodayRevenue() {
        String query = "SELECT SUM(TotalPrice) AS TotalSum\n"
                + "FROM BookingDetails\n"
                + "WHERE CAST(BookingTime AS DATE) = CAST(GETDATE() AS DATE);";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getNumberOfBooking() {
        String query = "SELECT COUNT(*) AS TotalCount\n"
                + "FROM BookingDetails;";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getNumberOfUser() {
        String query = "SELECT COUNT(*) AS TotalCount\n"
                + "FROM Account\n"
                + "WHERE IDRole = 1;";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public String getTopNameRoomType() {
        String query = "SELECT RoomType.NameRoomType\n"
                + "FROM RoomType\n"
                + "JOIN (\n"
                + "    SELECT TOP 1 IDRoomType, COUNT(*) AS BookingCount\n"
                + "    FROM BookingDetails\n"
                + "    GROUP BY IDRoomType\n"
                + "    ORDER BY COUNT(*) DESC\n"
                + ") AS MaxBooking ON RoomType.IDRoomType = MaxBooking.IDRoomType;";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int getNumberOfEmployee() {
        String query = "SELECT COUNT(*) AS TotalAccounts\n"
                + "FROM Account\n"
                + "WHERE IDRole IN (2, 3);";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<BookingByDate> getTopBookingByDay() {
        List<BookingByDate> listBookingByDate = new ArrayList<>();
        String query = "SELECT CAST(BookingTime AS DATE) AS Date,\n"
                + "       COUNT(*) AS [Number of BookingDetails],\n"
                + "       SUM(NumberOfRooms) AS [Total NumberOfRoom],\n"
                + "       SUM(TotalPrice) AS [TotalPrice]\n"
                + "FROM BookingDetails\n"
                + "WHERE CAST(BookingTime AS DATE) >= DATEADD(DAY, -5, CAST(GETDATE() AS DATE))\n"
                + "GROUP BY CAST(BookingTime AS DATE)\n"
                + "ORDER BY CAST(BookingTime AS DATE) DESC;";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listBookingByDate.add(new BookingByDate(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return listBookingByDate;
    }
}
