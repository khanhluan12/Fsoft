package controller;

import dao.ManagerDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.RoomType;

public class ShowRoomCustomerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShowRoomCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowRoomCustomerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        String roomTypeFilter = request.getParameter("roomTypeFilter");

        ManagerDao managerDao = new ManagerDao();
        UserDao userDao = new UserDao();
        List<RoomType> roomTypeList;

        // Lấy rating trung bình của tất cả các loại phòng
        Map<Integer, Double> averageRatings = userDao.getAverageRatingsByRoomType();

        if (checkin != null && checkout != null && !checkin.isEmpty() && !checkout.isEmpty()) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date checkinDate = sdf.parse(checkin);
                Date checkoutDate = sdf.parse(checkout);
                roomTypeList = managerDao.getAvailableRoomTypes(checkinDate, checkoutDate, roomTypeFilter);
                request.setAttribute("source", "check");
            } catch (ParseException e) {
                roomTypeList = managerDao.getRoomType();
                request.setAttribute("source", "default");
            }
        } else {
            roomTypeList = managerDao.getRoomType();
            for (RoomType rt : roomTypeList) {
                rt.setRoomFree(5); // Giả định mỗi loại phòng có 5 phòng trống
            }
            request.setAttribute("source", "default");

            if (roomTypeFilter != null && !roomTypeFilter.isEmpty()) {
                roomTypeList.removeIf(rt -> {
                    String name = rt.getNameRoomType().toLowerCase();
                    return !name.contains(roomTypeFilter.toLowerCase());
                });
            }
        }

        // Gán rating trung bình vào từng RoomType
        for (RoomType roomType : roomTypeList) {
            if (averageRatings.containsKey(roomType.getIDRoomType())) {
                roomType.setAverageRating(averageRatings.get(roomType.getIDRoomType()));
            }
        }

List<RoomType> allRoomTypes = managerDao.getRoomType(); 
request.setAttribute("allRoomTypes", allRoomTypes);
request.setAttribute("listRoom", roomTypeList);
request.setAttribute("pagegRoom", true);
request.getRequestDispatcher("customer_room.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet hiển thị danh sách phòng cho khách hàng với đánh giá trung bình";
    }
}
