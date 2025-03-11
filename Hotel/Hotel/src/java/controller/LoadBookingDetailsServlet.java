/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ManagerDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Booking;
import model.RoomType;
import model.User;

/**
 *
 * @author admin
 */
public class LoadBookingDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String IDAcc = request.getParameter("IDAccount");
//        PrintWriter out =response.getWriter();
//        out.print("<h1>" + IDAcc + "</h1>");
        String IDB = request.getParameter("IDBooking");
        ManagerDao mdao = new ManagerDao();
        Booking bdt = mdao.getBookingById(IDB);

        UserDao udao = new UserDao();
        User acc = udao.getAccountById(IDAcc);
        
        HttpSession session = request.getSession();
        session.setAttribute("bdt", bdt);
        session.setAttribute("acc", acc);
        request.getRequestDispatcher("showBookingDetails.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
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
