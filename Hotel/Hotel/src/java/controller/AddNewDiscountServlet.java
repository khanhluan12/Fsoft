/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ManagerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class AddNewDiscountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         request.setCharacterEncoding("UTF-8"); // set tim kiem tieng Viet

        String DiscountName = request.getParameter("DiscountName");
        String DiscountValue = request.getParameter("DiscountValue");
        String StartDay = request.getParameter("StartDay");
        String EndDay = request.getParameter("EndDay");
        String Note = request.getParameter("Note");
        
//        String status ="Valid";

        ManagerDao manadao = new ManagerDao();
        manadao.addDiscount(DiscountName, DiscountValue, StartDay, EndDay, Note);
        request.getRequestDispatcher("showDiscount").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
