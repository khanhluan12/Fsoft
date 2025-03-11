/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Service.CryptoUnil;
import Service.Email;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import model.InforSever;

/**
 *
 * @author admin
 */
public class ForgotPassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userEmail = request.getParameter("userEmail");
        UserDao adao = new UserDao();
        int newAccID = adao.getAccountByEmail(userEmail).getIDAccount();
        if (newAccID != 0) {
            try {
                String bodyMail = "Click this link to active your account: "+InforSever.HostSever+"/Account?AccountId=" + CryptoUnil.encrypt(newAccID + "") + "&Action=RQResetPassword";
                Email.sendEmail(userEmail, "Request To Reset your account password", bodyMail);
                response.getWriter().write("Please check your mail to get token reset!!");
                return;
            } catch (MessagingException ex) {
                Logger.getLogger(ForgotPassController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        response.getWriter().write("Incorrect, Your Email not existed");
    }
}
