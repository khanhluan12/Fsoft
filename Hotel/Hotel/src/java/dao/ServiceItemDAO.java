package dao;

import dbcontext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ServiceItem;

public class ServiceItemDAO extends DBContext {

    public List<ServiceItem> getItemsByServiceId(int serviceId) {
        List<ServiceItem> items = new ArrayList<>();
        String sql = "SELECT * FROM ServiceItem WHERE ServiceID = ?";

        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, serviceId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ServiceItem item = new ServiceItem(
                        rs.getInt("ItemID"),
                        rs.getString("ItemName"),
                        rs.getDouble("Price"),
                        rs.getString("ImageURL"),
                        rs.getInt("ServiceID")
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
        String sql = "SELECT * FROM ServiceItem WHERE ItemID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ServiceItem(
                        rs.getInt("ItemID"),
                        rs.getString("ItemName"),
                        rs.getDouble("Price"),
                        rs.getString("ImageURL"),
                        rs.getInt("ServiceID")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insert(ServiceItem item) {
        String sql = "INSERT INTO ServiceItem (ItemName, Price, ImageURL, ServiceID) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, item.getItemName());
            ps.setDouble(2, item.getPrice());
            ps.setString(3, item.getImageURL());
            ps.setInt(4, item.getServiceID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(ServiceItem item) {
        String sql = "UPDATE ServiceItem SET ItemName=?, Price=?, ImageURL=?, ServiceID=? WHERE ItemID=?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, item.getItemName());
            ps.setDouble(2, item.getPrice());
            ps.setString(3, item.getImageURL());
            ps.setInt(4, item.getServiceID());
            ps.setInt(5, item.getItemID());
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
                rs.getInt("serviceID")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return item;
}


}
