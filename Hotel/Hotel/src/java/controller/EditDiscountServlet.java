package controller;

import dao.ManagerDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/edit")
public class EditDiscountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ form
        String idStr = request.getParameter("IDDiscount");
        String name = request.getParameter("DiscountName");
        String value = request.getParameter("DiscountValue");
        String start = request.getParameter("StartDay");
        String end = request.getParameter("EndDay");
        String note = request.getParameter("Note");

        try {
            int id = Integer.parseInt(idStr);

            // Cập nhật discount
            ManagerDao dao = new ManagerDao();
            dao.updateDiscount(id, name, value, start, end, note);

            // Set thông báo
            request.getSession().setAttribute("message", "🎯 Discount updated successfully!");
        } catch (Exception e) {
            e.printStackTrace(); // Log lỗi cho dev
            request.getSession().setAttribute("message", "❌ Cập nhật thất bại: " + e.getMessage());
        }

        // Chuyển về trang danh sách
        response.sendRedirect("showDiscount");
    }

    @Override
    public String getServletInfo() {
        return "Handles updating an existing discount";
    }
}
