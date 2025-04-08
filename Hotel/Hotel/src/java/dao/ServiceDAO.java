
package dao;

import dbcontext.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Service;


public class ServiceDAO {
        public List<Service> getAllServices() {
        List<Service> services = new ArrayList<>();
        String sql = "SELECT * FROM Service";

        try (Connection conn = DBUtil.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Service service = new Service(
                        rs.getInt("ServiceID"),
                        rs.getString("ServiceName"),
                        rs.getInt("CategoryID") 
                );
                services.add(service);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return services;
    }
         public Service getServiceById(int id) {
        String sql = "SELECT * FROM Service WHERE ServiceID = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Service(
                        rs.getInt("ServiceID"),
                        rs.getString("ServiceName"),
                        rs.getInt("Category_ID")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
