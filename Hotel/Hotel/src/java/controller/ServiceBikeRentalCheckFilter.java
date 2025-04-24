/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author plmin
 */
@WebFilter("/ServicesCartServlet")
public class ServiceBikeRentalCheckFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Only check for POST requests (when submitting bike rental)
        if ("POST".equalsIgnoreCase(httpRequest.getMethod())) {
            String itemId = httpRequest.getParameter("itemId");

            if (itemId != null) {
                HttpSession session = httpRequest.getSession(false);

                // Check if user is logged in
                if (session == null || session.getAttribute("userA") == null) {
                    httpResponse.sendRedirect("login.jsp");
                    return;
                }

                // Let the servlet handle the active booking check since it has access to the ServiceItemDAO
            }
        }
        chain.doFilter(request, response);
    }
}
