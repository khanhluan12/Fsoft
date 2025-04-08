package dao;

import dbcontext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ServiceItem;

public class ServiceItemDAO {

    public List<ServiceItem> getItemsByServiceId(int serviceId) {
        List<ServiceItem> items = new ArrayList<>();
        String sql = "SELECT * FROM ServiceItem WHERE ServiceID = ?";

        try (Connection conn = DBContext.getConnection(); 
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
}
