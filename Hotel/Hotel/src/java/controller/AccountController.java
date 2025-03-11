/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Service.CryptoUnil;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class AccountController extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("Action");
        switch (action) {
            case "ActiveAccount":
                ActiveAccount(request, response);
                break;
            case "RQResetPassword":
                RQResetPassword(request, response);
                break;
            case "ResetPassword":
                ResetPassword(request, response);
                break;
        }
    }

    private void ActiveAccount(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException, Exception {
        String decryptedText = CryptoUnil.decrypt(request.getParameter("AccountId"));
        int AccountId = Integer.parseInt(decryptedText);
        UserDao ao = new UserDao();
        ao.ActiveAccount(AccountId);
        request.setAttribute("MessageActive", "Your account was activated");
        request.getRequestDispatcher("Account.jsp").forward(request, response);
    }
    
    private void ResetPassword(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        int AccountId = Integer.parseInt(request.getParameter("AccountId"));
        String newPass = request.getParameter("NewPass");
        UserDao ao = new UserDao();
        ao.ResetPass(AccountId, newPass);
        request.setAttribute("AccountId", "Your account was activated");
        request.setAttribute("MessageActive", "Your pass change successful");
        request.getRequestDispatcher("Account.jsp").forward(request, response);
    }
    
    private void RQResetPassword(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        String decryptedText = CryptoUnil.decrypt(request.getParameter("AccountId"));
        int AccountId = Integer.parseInt(decryptedText);        
        request.setAttribute("AccountId", AccountId);
        request.setAttribute("MessageReset", true);
        request.getRequestDispatcher("Account.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
