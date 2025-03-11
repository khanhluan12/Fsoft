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
import model.User;

/**
 *
 * @author admin
 */
public class RegisterServlet extends HttpServlet {

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
            throws ServletException, IOException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        String fName = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String passCon = request.getParameter("confirm_password");
        String idrole = request.getParameter("idrole");
        UserDao dao = new UserDao();
        User acc = dao.checkAccountExist(user);
        if (acc != null) {
            if (idrole.equals("1")) {
                request.setAttribute("mess", "Username is exist!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else if (idrole.equals("3")) {
                request.setAttribute("mess", "Username is exist!");
                request.getRequestDispatcher("manager_account.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("mess", "Password not match!");
            if (!pass.equals(passCon)) {
                if (idrole.equals("1")) {
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else if (idrole.equals("3")) {
                    request.getRequestDispatcher("manager_account.jsp").forward(request, response);
                }
            } else {
                int newID = dao.addAccount(user, pass, fName, gender, city, email, phone, idrole);
                if(newID > 0){
                    request.setAttribute("loginFail", "Register success! Please check your mail to active accounnt");
                    String idString = CryptoUnil.encrypt(newID + "");
                    Email.sendEmail(email, "Active you account", "Click this link to active your account: "+InforSever.HostSever+"/Account?Action=ActiveAccount&AccountId=" + idString);
                }else{
                    request.setAttribute("loginFail", "Fail to register please try again");
                }
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
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
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
