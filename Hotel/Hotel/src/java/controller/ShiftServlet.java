package controller;

import dao.ShiftDAO;
import model.ShiftSchedule;
import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@WebServlet("/ShiftServlet")
public class ShiftServlet extends HttpServlet {
    private ShiftDAO shiftDAO = new ShiftDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("shifts", shiftDAO.getAllShifts());
        request.getRequestDispatcher("manage_shift.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("ShiftServlet");
            return;
        }
        switch (action) {
            case "add":
                addShift(request, response);
                break;
            case "update":
                updateShift(request, response);
                break;
            case "delete":
                deleteShift(request, response);
                break;
            default:
                response.sendRedirect("ShiftServlet");
                break;
        }
    }

private void addShift(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
    try {
        String shiftName = request.getParameter("shiftName");

        LocalDateTime startDateTime = LocalDateTime.parse(request.getParameter("startTime"));
        LocalDateTime endDateTime = LocalDateTime.parse(request.getParameter("endTime"));

        Timestamp startTimestamp = Timestamp.valueOf(startDateTime);
        Timestamp endTimestamp = Timestamp.valueOf(endDateTime);

        int employeeID = Integer.parseInt(request.getParameter("IDAccount"));

        ShiftSchedule shift = new ShiftSchedule();
        shift.setShiftName(shiftName);
        shift.setStartDateTime(startTimestamp);
        shift.setEndDateTime(endTimestamp);

        shiftDAO.addShift(shift, employeeID);
        response.sendRedirect("ShiftServlet");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi thêm ca trực: " + e.getMessage());
    }
}


  private void updateShift(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
    try {
        int shiftID = Integer.parseInt(request.getParameter("shiftID"));
        String shiftName = request.getParameter("shiftName");

        LocalDateTime startDateTime = LocalDateTime.parse(request.getParameter("startTime"));
        LocalDateTime endDateTime = LocalDateTime.parse(request.getParameter("endTime"));

        Timestamp startTimestamp = Timestamp.valueOf(startDateTime);
        Timestamp endTimestamp = Timestamp.valueOf(endDateTime);

        int employeeID = Integer.parseInt(request.getParameter("employeeID"));

        ShiftSchedule shift = new ShiftSchedule();
        shift.setShiftID(shiftID);
        shift.setShiftName(shiftName);
        shift.setStartDateTime(startTimestamp);
        shift.setEndDateTime(endTimestamp);

        shiftDAO.updateShift(shift, employeeID);
        response.sendRedirect("ShiftServlet");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật ca trực: " + e.getMessage());
    }
}


    private void deleteShift(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int shiftID = Integer.parseInt(request.getParameter("shiftID"));
            shiftDAO.deleteShift(shiftID);
            response.sendRedirect("ShiftServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xóa ca trực: " + e.getMessage());
        }
    }
}
