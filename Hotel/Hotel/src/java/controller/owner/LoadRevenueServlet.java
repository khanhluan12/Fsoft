/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.owner;

import dao.OwnerDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BookingByDate;

/**
 *
 * @author admin
 */
public class LoadRevenueServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        OwnerDao odao = new OwnerDao();
        int totalRevenue = odao.getTotalRevenue();
        int todayRevenue = odao.getTodayRevenue();
        int numberBooking = odao.getNumberOfBooking();
        int numberOfUser = odao.getNumberOfUser();
        String topNameRoomType = odao.getTopNameRoomType();
        int numberOfEmployee = odao.getNumberOfEmployee();
        
        List<BookingByDate> listBookingByDate = odao.getTopBookingByDay();
        System.out.println(listBookingByDate);
        System.out.println(totalRevenue);
        System.out.println(todayRevenue);
        System.out.println(numberBooking);
        System.out.println(numberOfUser);
                System.out.println(topNameRoomType);
                        System.out.println(numberOfEmployee);
        request.setAttribute("listBookingByDate", listBookingByDate);
        request.setAttribute("numberOfEmployee", numberOfEmployee);
        request.setAttribute("topNameRoomType", topNameRoomType);
        request.setAttribute("numberOfUser", numberOfUser);
        request.setAttribute("numberBooking", numberBooking);
        request.setAttribute("todayRevenue", todayRevenue);
        request.setAttribute("totalRevenue", totalRevenue);
        request.getRequestDispatcher("owner_index.jsp").forward(request, response);
//        out.print("<h1>" + listBookingByDate.toString()+"</h1>");
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
