/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Service.ConfigVNPAY;
import dao.ServiceItemDAO;
import dao.ServiceOrderDAO;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.User;

/**
 *
 * @author plmin
 */
@WebServlet("/OrderServiceServlet")
public class ServicesOrderServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServicesOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServicesOrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private void Payment(HttpServletRequest request, HttpServletResponse response, double price, List<CartItem> cartItems) throws IOException {
        String vnp_TxnRef = ConfigVNPAY.getRandomNumber(8);

        HttpSession session = request.getSession();

        // Store cart items in session for later use after payment
        session.setAttribute("pendingOrderItems", cartItems);

        String vnp_IpAddr = ConfigVNPAY.getIpAddress(request);

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", "2.1.0");
        vnp_Params.put("vnp_Command", "pay");
        vnp_Params.put("vnp_TmnCode", ConfigVNPAY.vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf((long) (price * 100))); // full payment
        vnp_Params.put("vnp_CurrCode", "VND");

//        String bankCode = request.getParameter("bankCode");
//        if (bankCode != null && !bankCode.isEmpty()) {
//             vnp_Params.put("vnp_BankCode", bankCode);
//        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan dich vu: " + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", "service");
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        // Dynamic return URL
        String baseURL = request.getRequestURL().toString().replace(request.getServletPath(), "");
        String returnUrl = baseURL + "/ServicesOrderServlet";
        vnp_Params.put("vnp_ReturnUrl", returnUrl);

        // CreateDate and ExpireDate
        Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cal.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        cal.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cal.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        // Sort params and build query
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator<String> itr = fieldNames.iterator();

        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                hashData.append(fieldName).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()))
                        .append('=')
                        .append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    hashData.append('&');
                    query.append('&');
                }
            }
        }

        // Add secure hash
        String vnp_SecureHash = ConfigVNPAY.hmacSHA512(ConfigVNPAY.secretKey, hashData.toString());
        query.append("&vnp_SecureHash=").append(vnp_SecureHash);

        String paymentUrl = ConfigVNPAY.vnp_PayUrl + "?" + query.toString();
        response.sendRedirect(paymentUrl);
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

        //DEBUG
        System.out.println("[DEBUG] All request parameters from VNPAY:");
        Enumeration<String> paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String name = paramNames.nextElement();
            System.out.println("[DEBUG] " + name + " = " + request.getParameter(name));
        }

        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        System.out.println("vnp_ResponseCode: " + vnp_ResponseCode);

        if (null == vnp_ResponseCode) {
            request.setAttribute("error", "Service payment failed! Error code: " + vnp_ResponseCode);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
            switch (vnp_ResponseCode) {
                case "00":

                    //DEBUG
                    System.out.println("[DEBUG] Payment successful, processing order...");
                    try {
                        HttpSession session = request.getSession();

                        //DEBUG
                        System.out.println("[DEBUG] Session ID: " + session.getId());

                        User user = (User) session.getAttribute("userA");

                        System.out.println("[DEBUG] User from session: " + (user != null ? user.getIDAccount() : "null"));

                        if (user == null) {

                            //DEBUG
                            System.out.println("[DEBUG] User is null, redirecting to login");

                            response.sendRedirect("login.jsp");
                            return;
                        }

                        // Retrieve pending order items from session
                        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

                        //DEBUG
                        System.out.println("[DEBUG] Cart items from session: " + (cartItems != null ? cartItems.size() + " items" : "null"));

                        Double servicePrice = (Double) session.getAttribute("serviceTotal");

                        //DEBUG
                        System.out.println("[DEBUG] Service total price: " + servicePrice);

                        if (cartItems != null && !cartItems.isEmpty()) {
                            //DEBUG
                            System.out.println("[DEBUG] Attempting to create service order for userID: " + user.getIDAccount());

// Save order to DB
                            ServiceOrderDAO orderDAO = new ServiceOrderDAO();

                            // Create orders for each cart item
                            for (CartItem item : cartItems) {
                                // Use the properties from the nested ServiceItem object
                                int itemID = item.getItem().getItemID();
                                double price = item.getItem().getPrice();

                                //DEBUG
                                System.out.println("[DEBUG] Creating order for item ID: " + item.getServiceId()
                                        + ", quantity: " + item.getQuantity()
                                        + ", total price: " + (item.getPrice() * item.getQuantity()));

                                try {
                                    orderDAO.createServiceOrder(
                                            itemID, // Use itemID from the nested ServiceItem
                                            user.getIDAccount(),
                                            item.getQuantity(),
                                            price * item.getQuantity(), // Use price from the nested ServiceItem
                                            "Completed"
                                    );

                                    // DEBUG
                                    System.out.println("[DEBUG] Order created successfully");

                                } catch (Exception e) {

                                    //DEBUG
                                    System.out.println("[DEBUG] Error creating order: " + e.getMessage());
                                }
                            }

                            // Clear session attributes
                            session.removeAttribute("cartItems");
                            session.removeAttribute("serviceTotal");
                            session.removeAttribute("pendingOrderItems");

                            //DEBUG
                            System.out.println("[DEBUG] Session attributes cleared, redirecting to customer home");

                            // Set success message
                            request.setAttribute("orderSuccess", "Service order payment successful!");

                            // Redirect to customer home page
                            request.getRequestDispatcher("customer_home.jsp").forward(request, response);
                            return;
                        } else {
                            request.setAttribute("error", "Cart is empty or session expired.");
                        }
                    } catch (Exception e) {

                        //DEBUG
                        System.out.println("[DEBUG] Exception in payment processing: " + e.getMessage());

                        e.printStackTrace();
                        request.setAttribute("error", "System error: " + e.getMessage());
                    }
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    break;
                case "24":
                    // User canceled payment
                    response.sendRedirect("customer_home.jsp?vnp_ResponseCode=24");
                    break;
                default:
                    request.setAttribute("error", "Service payment failed! Error code: " + vnp_ResponseCode);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    break;
            }
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
            HttpSession session = request.getSession();
            List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
            Double servicePrice = (Double) session.getAttribute("serviceTotal");

            // DEBUG
            System.out.println("[DEBUG] Session cartItems: " + cartItems);
            System.out.println("[DEBUG] Session ID: " + session.getId());

            if (cartItems == null || cartItems.isEmpty() || servicePrice == null) {
                response.getWriter().write("No service data found.");
                return;
            }

            Payment(request, response, servicePrice, cartItems);
        } catch (Exception e) {
            e.printStackTrace(); // Debug print stack trace
            response.getWriter().write("Error occurred: " + e.getMessage());
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
