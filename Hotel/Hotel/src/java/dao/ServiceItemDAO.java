package dao;

import dbcontext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ServiceItem;
import model.ServiceOrder;

public class ServiceItemDAO extends DBContext {

    public List<ServiceItem> getItemsByServiceId(int serviceId) {
        List<ServiceItem> items = new ArrayList<>();
        String sql = "SELECT * FROM ServiceItem WHERE ServiceID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, serviceId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ServiceItem item = new ServiceItem(
                        rs.getInt("ItemID"),
                        rs.getString("ItemName"),
                        rs.getDouble("Price"),
                        rs.getString("ImageURL"),
                        rs.getInt("ServiceID"),
                        rs.getString("description")
                );
                items.add(item);
            }
            System.out.println("[DEBUG] Found " + items.size() + " items for serviceId = " + serviceId);

        } catch (Exception e) {
            System.out.println("[ERROR] Failed to fetch service items: " + e.getMessage());
            e.printStackTrace();
        }
        return items;
    }

    public static ServiceItem getItemByID(int id) {
        ServiceItem item = null;
        Connection con = null;
        try {
            con = DBContext.getConnection();
            String sql = "SELECT * FROM ServiceItem WHERE itemID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                item = new ServiceItem(
                        rs.getInt("itemID"),
                        rs.getString("itemName"),
                        rs.getDouble("price"),
                        rs.getString("imageURL"),
                        rs.getInt("serviceID"),
                        rs.getString("description")
                );
            }

        } catch (SQLException e) {
        } finally {
            try {
                if (con != null) {
                    DBContext.disconnect(con);
                }
            } catch (SQLException e) {
            }
        }
        return item;
    }

    public static List<ServiceOrder> getServiceOrdersByUserId(int userId) {
        List<ServiceOrder> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, si.ItemName, o.Quantity, o.TotalPrice, o.OrderDate, o.Status "
                + "FROM ServiceOrder o "
                + "JOIN ServiceItem si ON o.ItemID = si.ItemID "
                + "WHERE o.UserID = ?";

        try (Connection con = DBContext.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ServiceOrder so = new ServiceOrder();
                so.setOrderId(rs.getInt("OrderID"));
                so.setServiceName(rs.getString("ItemName"));
                so.setQuantity(rs.getInt("Quantity"));
                so.setTotalPrice(rs.getDouble("TotalPrice"));
                so.setOrderDate(rs.getString("OrderDate"));
                so.setStatus(rs.getString("Status"));
                list.add(so);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
      public List<ServiceItem> getAll() {
        List<ServiceItem> list = new ArrayList<>();
        String sql = "SELECT * FROM ServiceItem";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql); 
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                ServiceItem item = new ServiceItem();
                item.setItemID(rs.getInt("ItemID"));
                item.setItemName(rs.getString("ItemName"));
                item.setPrice(rs.getDouble("Price"));
                item.setImageURL(rs.getString("ImageURL"));
                item.setServiceID(rs.getInt("ServiceID"));
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

   public ServiceItem getById(int id) {
    String sql = "SELECT * FROM ServiceItem WHERE itemID = ?";
    try (Connection conn = getConnection(); 
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, id);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return new ServiceItem(
                    rs.getInt("itemID"),
                    rs.getString("itemName"),
                    rs.getDouble("price"),
                    rs.getString("imageURL"),
                    rs.getInt("serviceID"),
                    rs.getString("description") 
                );
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}


    public void insert(ServiceItem item) {
        String sql = "INSERT INTO ServiceItem (ItemName, Price, ImageURL, ServiceID,Description) VALUES (?, ?, ?, ?,?)";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, item.getItemName());
            ps.setDouble(2, item.getPrice());
            ps.setString(3, item.getImageURL());
            ps.setInt(4, item.getServiceID());
            ps.setString(5, item.getDescription());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(ServiceItem item) {
        String sql = "UPDATE ServiceItem SET ItemName=?, Price=?, ImageURL=?, ServiceID=?,Description = ? WHERE ItemID=?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, item.getItemName());
            ps.setDouble(2, item.getPrice());
            ps.setString(3, item.getImageURL());
            ps.setInt(4, item.getServiceID());
            ps.setInt(5, item.getItemID());
            ps.setString(6, item.getDescription());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM ServiceItem WHERE ItemID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
public ServiceItem getItemById(int id) {
    ServiceItem item = null;
    try {
        String sql = "SELECT * FROM ServiceItem WHERE itemID = ?";
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            item = new ServiceItem(
                rs.getInt("itemID"),
                rs.getString("itemName"),
                rs.getDouble("price"),
                rs.getString("imageURL"),
                rs.getInt("serviceID"),
                rs.getString("description") // Bổ sung description
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return item;
}

}
