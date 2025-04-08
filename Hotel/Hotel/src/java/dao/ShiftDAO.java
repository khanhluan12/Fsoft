package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import model.ShiftSchedule;
import dbcontext.DBUtil;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class ShiftDAO {
    public List<ShiftSchedule> getShiftsByUserID(int userID) {
        List<ShiftSchedule> list = new ArrayList<>();
        String sql = "SELECT s.* FROM ShiftSchedule s " +
                     "JOIN UserShift us ON s.ShiftID = us.ShiftID " +
                     "WHERE us.IDAccount = ?"; 

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ShiftSchedule shift = new ShiftSchedule();
                shift.setShiftID(rs.getInt("ShiftID"));
                shift.setShiftName(rs.getString("ShiftName"));
                shift.setStartTime(rs.getTime("StartTime"));
                shift.setEndTime(rs.getTime("EndTime"));
                shift.setShiftDate(rs.getDate("ShiftDate"));
                list.add(shift);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
public List<ShiftSchedule> getAllShifts() {
    List<ShiftSchedule> list = new ArrayList<>();
    String sql = "SELECT s.*, a.IDAccount, a.FullName AS EmployeeName " +  // Lấy cả IDAccount
                 "FROM ShiftSchedule s " +
                 "LEFT JOIN UserShift us ON s.ShiftID = us.ShiftID " +
                 "LEFT JOIN Account a ON us.IDAccount = a.IDAccount";

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            ShiftSchedule shift = new ShiftSchedule();
            shift.setShiftID(rs.getInt("ShiftID"));
            shift.setShiftName(rs.getString("ShiftName"));
            shift.setStartTime(rs.getTime("StartTime"));
            shift.setEndTime(rs.getTime("EndTime"));
            shift.setShiftDate(rs.getDate("ShiftDate"));
            shift.setIDAccount(rs.getInt("IDAccount")); // Thêm dòng này
            shift.setEmployeeName(rs.getString("EmployeeName")); 
            list.add(shift);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}


public int addShift(ShiftSchedule shift, int employeeID) {
    String sql = "INSERT INTO ShiftSchedule (ShiftName, StartTime, EndTime, ShiftDate) VALUES (?, ?, ?, ?)";
    try (Connection conn = DBUtil.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

        stmt.setString(1, shift.getShiftName());
        stmt.setTime(2, shift.getStartTime());
        stmt.setTime(3, shift.getEndTime());
        stmt.setDate(4, shift.getShiftDate()); // Thêm ngày làm việc

        int affectedRows = stmt.executeUpdate();

        if (affectedRows > 0) {
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int shiftID = generatedKeys.getInt(1);
                    if (employeeID > 0) {
                        assignEmployeeToShift(employeeID, shiftID);
                    }
                    return shiftID;
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }   catch (Exception ex) {
            Logger.getLogger(ShiftDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    return -1; // Lỗi
}



  
public List<User> getAllEmployees() {
    List<User> employeeList = new ArrayList<>();
    String sql = "SELECT IDAccount, FullName FROM Account WHERE IDRole = 3 AND IsActive = 1"; // Chỉ lấy nhân viên đang hoạt động
    try (Connection conn = DBUtil.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            User emp = new User();
            emp.setIDAccount(rs.getInt("IDAccount"));
            emp.setFullName(rs.getString("FullName"));
            employeeList.add(emp);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return employeeList;
}
private void assignEmployeeToShift(int employeeID, int shiftID) {
    String sql = "INSERT INTO UserShift (IDAccount, ShiftID) VALUES (?, ?)";
    
    try (Connection conn = DBUtil.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, employeeID);
        stmt.setInt(2, shiftID);

        stmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }   catch (Exception ex) {
            Logger.getLogger(ShiftDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
}

public void updateShift(ShiftSchedule shift, int employeeID) {
    String sql = "UPDATE ShiftSchedule SET ShiftName=?, StartTime=?, EndTime=?, ShiftDate=? WHERE ShiftID=?";
    
    try (Connection conn = DBUtil.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, shift.getShiftName());
        stmt.setTime(2, shift.getStartTime());
        stmt.setTime(3, shift.getEndTime());
        stmt.setDate(4, new java.sql.Date(shift.getShiftDate().getTime())); // Thêm ShiftDate
        stmt.setInt(5, shift.getShiftID());

        stmt.executeUpdate();

        // Cập nhật nhân viên trong UserShift nếu có sự thay đổi
        updateUserShift(employeeID, shift.getShiftID(), conn);

    } catch (SQLException e) {
        e.printStackTrace();
    } catch (Exception ex) {
        Logger.getLogger(ShiftDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
}
private void updateUserShift(int employeeID, int shiftID, Connection conn) throws SQLException {
    // Kiểm tra xem ca làm này đã có nhân viên chưa
    String checkSql = "SELECT COUNT(*) FROM UserShift WHERE ShiftID = ?";
    try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
        checkStmt.setInt(1, shiftID);
        ResultSet rs = checkStmt.executeQuery();
        if (rs.next() && rs.getInt(1) > 0) {
            // Nếu đã có nhân viên, cập nhật nhân viên mới
            String updateSql = "UPDATE UserShift SET IDAccount = ? WHERE ShiftID = ?";
            try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                updateStmt.setInt(1, employeeID);
                updateStmt.setInt(2, shiftID);
                updateStmt.executeUpdate();
            }
        } else {
            // Nếu chưa có, thêm mới vào UserShift
            String insertSql = "INSERT INTO UserShift (IDAccount, ShiftID) VALUES (?, ?)";
            try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                insertStmt.setInt(1, employeeID);
                insertStmt.setInt(2, shiftID);
                insertStmt.executeUpdate();
            }
        }
    }
}
public boolean deleteShift(int shiftID) {
    String deleteUserShiftSQL = "DELETE FROM UserShift WHERE ShiftID = ?";
    String deleteShiftSQL = "DELETE FROM ShiftSchedule WHERE ShiftID = ?";
    
    try (Connection conn = DBUtil.getConnection()) {
        conn.setAutoCommit(false); 

        try (PreparedStatement stmt1 = conn.prepareStatement(deleteUserShiftSQL);
             PreparedStatement stmt2 = conn.prepareStatement(deleteShiftSQL)) {

            // Xóa tất cả các bản ghi trong UserShift trước
            stmt1.setInt(1, shiftID);
            stmt1.executeUpdate();

            // Xóa ShiftSchedule sau khi đã xóa liên kết
            stmt2.setInt(1, shiftID);
            int rowsDeleted = stmt2.executeUpdate();

            conn.commit(); // Xác nhận giao dịch
            return rowsDeleted > 0;

        } catch (Exception e) {
            conn.rollback(); // Hoàn tác nếu có lỗi
            e.printStackTrace();
        } finally {
            conn.setAutoCommit(true); // Khôi phục chế độ tự động commit
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

public ShiftSchedule getShiftByID(int shiftID) {
    String sql = "SELECT * FROM ShiftSchedule WHERE ShiftID = ?";
    try (Connection conn = DBUtil.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, shiftID);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            ShiftSchedule shift = new ShiftSchedule();
            shift.setShiftID(rs.getInt("ShiftID"));
            shift.setShiftName(rs.getString("ShiftName"));
            shift.setStartTime(rs.getTime("StartTime"));
            shift.setEndTime(rs.getTime("EndTime"));
            return shift;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

}
