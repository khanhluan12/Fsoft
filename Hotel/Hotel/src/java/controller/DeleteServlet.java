package controller;

import dao.ManagerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class DeleteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String IDAccount = request.getParameter("IDAccount");
        String IDDiscount = request.getParameter("IDDiscount");
        String IDRoomType = request.getParameter("IDRoomType");

        // Get the session to store success messages
        HttpSession session = request.getSession();

        ManagerDao manadao = new ManagerDao();

        try {
            if (IDAccount != null) {
                manadao.deleteAccount(IDAccount);
                // Set success message for account deletion
                session.setAttribute("successMessage", "Tài khoản với ID " + IDAccount + " đã được xóa thành công!");
                response.sendRedirect("showAccount");
            } else if (IDDiscount != null) {
                manadao.deleteDiscount(IDDiscount);
                // Set success message for discount deletion
                session.setAttribute("successMessage", "Mã giảm giá với ID " + IDDiscount + " đã được xóa thành công!");
                response.sendRedirect("showDiscount");
            } else if (IDRoomType != null) {
                manadao.deleteRoomType(IDRoomType);
                // Set success message for room type deletion
                session.setAttribute("successMessage", "Loại phòng với ID " + IDRoomType + " đã được xóa thành công!");
                response.sendRedirect("showRoomType");
            }
        } catch (Exception e) {
            // If any exception occurs during deletion
            if (IDAccount != null) {
                session.setAttribute("errorMessage", "Không thể xóa tài khoản với ID " + IDAccount);
                response.sendRedirect("showAccount");
            } else if (IDDiscount != null) {
                session.setAttribute("errorMessage", "Không thể xóa mã giảm giá với ID " + IDDiscount);
                response.sendRedirect("showDiscount");
            } else if (IDRoomType != null) {
                session.setAttribute("errorMessage", "Không thể xóa loại phòng với ID " + IDRoomType);
                response.sendRedirect("showRoomType");
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
