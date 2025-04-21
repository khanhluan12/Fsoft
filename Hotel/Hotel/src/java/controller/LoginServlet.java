package controller;

import Service.SessionManager;
import dao.FeedbackDAO;
import dao.UserDao;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Feedback;
import model.User;

/**
 *
 * @author admin
 */
public class LoginServlet extends HttpServlet {

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

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        User user = userDao.checkAccountValid(userName, password);

        if (user != null) {
            HttpSession session = request.getSession();
            if (!user.isIsBan()) {
                if (user.getIDRole() == 1) {
                    if (user.isIsAcive()) {
                        session.setAttribute("userA", user);
                        SessionManager.addSession(user.getIDAccount(), session);
                        response.sendRedirect("customer_home.jsp");
                    } else {
                        request.setAttribute("loginFail", "Username or password incorrect");
                        request.setAttribute("userName", userName); // giữ lại userName
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } else if (user.getIDRole() == 2 || user.getIDRole() == 3) {
                    session.setAttribute("userA", user);
                    response.sendRedirect("manager_home.jsp");
                } else if (user.getIDRole() == 4) {
                    session.setAttribute("userA", user);
                    request.getRequestDispatcher("loadRevenue").forward(request, response);
                }
            } else {
                request.setAttribute("loginFail", "Username or password incorrect");
                request.setAttribute("userName", userName); // giữ lại userName
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("loginFail", "Username or password incorrect");
            request.setAttribute("userName", userName); // giữ lại userName
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
        processRequest(request, response);
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
