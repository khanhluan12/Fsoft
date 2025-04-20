package controller;

import dao.ManagerDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author admin
 */
public class ShowAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ManagerDao managerDao = new ManagerDao();
        List<User> userList = managerDao.getAccounts();

        HttpSession session = request.getSession();
        session.setAttribute("listU", userList);

        // Pass along any notification messages from the BanAccountController
        String notification = (String) request.getAttribute("notification");
        String notificationType = (String) request.getAttribute("notificationType");

        if (notification != null && !notification.isEmpty()) {
            request.setAttribute("notification", notification);
            request.setAttribute("notificationType", notificationType);
        }

        request.getRequestDispatcher("manager_account.jsp").forward(request, response);
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
