/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbcontext;

import dao.ManagerDao;
import dao.UserDao;
import model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CheckRoomValid;
/**
 *
 * @author admin
 */
public class DBContext {
    public static Connection getConnection() {
        Connection connection = null;
        String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String serverName = "LAPTOP-GOCR7MGB\\SQLEXPRESS";
        String databaseName = "G2HotelTest";
        String port = "1433";
        String user = "sa";
        String password = "123";
        /**
         * @param connectionString can sometime be called as URL
         */
        String url = "jdbc:sqlserver://localhost:" + port + ";databaseName=" + databaseName + ";encrypt=true;trustServerCertificate=true;";
        try {
            Class.forName(driverName);
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Connected success.");
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("ERROR");
        }
        return connection;
    }
    public static void disconnect(Connection con) throws SQLException {
        con.close();
    }

    
    public static void main(String[] args) {
        DBContext db = new DBContext();
        try {
            System.out.println(DBContext.getConnection());
        } catch (Exception e) {
        }
//        UserDao ud = new UserDao();
//        List<CheckRoomValid> l = ud.checkRoomValid("2023-06-14", "2023-06-20");
//        System.out.println("sfs" + l.toString());

        ManagerDao m = new ManagerDao();
        List<User> list = new ArrayList<>();
        list = m.getAccounts();
        for (User user : list) {
             System.out.println(user.toString());;
        }
    }
    

}
