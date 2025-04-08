package dao;

import dbcontext.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ServiceItem;

public class ServiceItemDAO {
    public static List<ServiceItem> getItemsByServiceId(int serviceId) {
        List<ServiceItem> items = new ArrayList<>();
        String sql = "SELECT * FROM ServiceItem WHERE ServiceID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, serviceId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ServiceItem item = new ServiceItem(
                        rs.getInt("ItemID"),
                        rs.getInt("ServiceID"),
                        rs.getString("ItemName"),
                        rs.getBigDecimal("Price"),
                        rs.getString("ImageURL")
                );
                items.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }
}
