package controller;

import dao.ManagerDao;
import dao.UserDao;
import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CheckRoomValid;
import model.RoomType;

public class CheckRoomValidServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        // Lấy ngày check-in/out từ request hoặc session
        String checkInDateStr = request.getParameter("check_in");
        String checkOutDateStr = request.getParameter("check_out");

        // Debug: In ra ngày check-in và check-out nhận được từ request
        System.out.println("Received check-in date: " + checkInDateStr);
        System.out.println("Received check-out date: " + checkOutDateStr);

        if (checkInDateStr == null || checkOutDateStr == null) {
            // Debug: Nếu không có ngày từ request, lấy từ session
            System.out.println("No dates received from request, checking session.");
            checkInDateStr = (String) request.getSession().getAttribute("check_in");
            checkOutDateStr = (String) request.getSession().getAttribute("check_out");

            // Debug: Kiểm tra giá trị ngày từ session
            System.out.println("Session check-in date: " + checkInDateStr);
            System.out.println("Session check-out date: " + checkOutDateStr);
        }

        // Kiểm tra nếu vẫn chưa có ngày (có thể không có giá trị nào từ cả request và session)
        if (checkInDateStr == null || checkOutDateStr == null) {
            System.out.println("Error: No valid dates found in request or session.");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Check-in and check-out dates are required.");
            return;
        }

        // Lưu vào session để sử dụng lại
        request.getSession().setAttribute("check_in", checkInDateStr);
        request.getSession().setAttribute("check_out", checkOutDateStr);
        System.out.println("Stored dates in session.");

        UserDao udao = new UserDao();
        ManagerDao mDao = new ManagerDao();

        // Kiểm tra phòng trống trong khoảng thời gian đã chọn
        List<CheckRoomValid> availableRooms = udao.checkRoomValid(checkInDateStr, checkOutDateStr);
        // Debug: Kiểm tra danh sách phòng có sẵn
        if (availableRooms != null) {
            System.out.println("Available rooms: " + availableRooms.size());
        } else {
            System.out.println("No available rooms data returned.");
        }

        // Lấy tất cả loại phòng
        List<RoomType> allRoomTypes = mDao.getRoomType();
        // Debug: Kiểm tra số lượng loại phòng có
        System.out.println("Total room types: " + allRoomTypes.size());

        // Lấy rating trung bình của từng loại phòng
        Map<Integer, Double> averageRatings = udao.getAverageRatingsByRoomType();
        // Debug: Kiểm tra thông tin rating
        System.out.println("Average ratings for room types: " + averageRatings);

        // Tính số ngày ở
        LocalDate checkInDate = LocalDate.parse(checkInDateStr);
        LocalDate checkOutDate = LocalDate.parse(checkOutDateStr);
        int numOfDays = (int) ChronoUnit.DAYS.between(checkInDate, checkOutDate);
        // Debug: In ra số ngày ở
        System.out.println("Number of days: " + numOfDays);

        // Cập nhật thông tin phòng trống và rating
        for (CheckRoomValid roomAvailability : availableRooms) {
            System.out.println("Checking availability for room ID: " + roomAvailability.getIDRoom());
            for (RoomType roomType : allRoomTypes) {
                if (roomType.getIDRoomType() == roomAvailability.getIDRoom()) {
                    System.out.println("Room found: " + roomType.getNameRoomType());
                    if (roomAvailability.getRoomValid() <= 0) {
                        // Xóa phòng nếu không còn phòng trống
                        System.out.println("No rooms available for this room type. Removing room type: " + roomType.getNameRoomType());
                        allRoomTypes.remove(roomType);
                        break;
                    } else {
                        // Cập nhật số phòng trống và rating
                        roomType.setRoomFree(roomAvailability.getRoomValid());
                        if (averageRatings.containsKey(roomType.getIDRoomType())) {
                            roomType.setAverageRating(averageRatings.get(roomType.getIDRoomType()));
                        }
                        System.out.println("Updated room availability and rating.");
                        break;
                    }
                }
            }
        }

        // Thiết lập các thuộc tính để truyền sang JSP
        request.setAttribute("numOfDays", numOfDays);
        request.setAttribute("listRoom", allRoomTypes);
        request.setAttribute("source", "search");

        // Debug: Kiểm tra dữ liệu trước khi forward
        System.out.println("Forwarding to JSP with numOfDays: " + numOfDays);
        System.out.println("Rooms to be displayed: " + allRoomTypes.size());

        // Forward sang trang hiển thị
        request.getRequestDispatcher("customer_room.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet quản lý kiểm tra phòng trống và hiển thị đánh giá";
    }
}
