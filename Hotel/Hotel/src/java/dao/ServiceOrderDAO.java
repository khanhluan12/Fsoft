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
import model.ServiceOrder;

/**
 *
 * @author plmin
 */
public class ServiceOrderDAO {

    public boolean createServiceOrder(int itemId, int userId, int quantity, double totalPrice, String status) {
        String sql = "INSERT INTO ServiceOrder (ItemID, UserID, Quantity, TotalPrice, Status) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBContext.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, itemId);
            ps.setInt(2, userId);
            ps.setInt(3, quantity);
            ps.setDouble(4, totalPrice);
            ps.setString(5, status);

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get service orders by user ID
    public List<ServiceOrder> getServiceOrdersByUserId(int userId) {
        List<ServiceOrder> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, si.ItemName as ServiceName, o.Quantity, o.TotalPrice, o.OrderDate, o.Status "
                + "FROM ServiceOrder o "
                + "JOIN ServiceItem si ON o.ItemID = si.ItemID "
                + "WHERE o.UserID = ? "
                + "ORDER BY o.OrderDate DESC";

        try (Connection con = DBContext.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ServiceOrder order = new ServiceOrder();
                order.setOrderId(rs.getInt("OrderID"));
                order.setServiceName(rs.getString("ServiceName"));
                order.setQuantity(rs.getInt("Quantity"));
                order.setTotalPrice(rs.getDouble("TotalPrice"));
                order.setOrderDate(rs.getTimestamp("OrderDate").toString());
                order.setStatus(rs.getString("Status"));
                list.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
