package controller;

import Service.SessionManager;
import dao.UserDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author admin
 */
public class BanAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean isBan = request.getParameter("status").equals("ban");

        UserDao udao = new UserDao();
        udao.BanAndUnbanAccount(id, isBan);
        
        //  Invalidate session when banning user
        if (isBan) {
            SessionManager.invalidateSession(id);
        }

        // Set notification message
        if (isBan) {
            request.setAttribute("notification", "Account ID " + id + " has been banned successfully.");
            request.setAttribute("notificationType", "alert-success");
        } else {
            request.setAttribute("notification", "Account ID " + id + " has been unbanned successfully.");
            request.setAttribute("notificationType", "alert-success");
        }

        request.getRequestDispatcher("showAccount").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
