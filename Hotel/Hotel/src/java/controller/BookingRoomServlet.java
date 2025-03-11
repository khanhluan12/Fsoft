package controller;

import Service.ConfigVNPAY;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.BookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import model.BookingDetails;
import model.RoomType;

public class BookingRoomServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            BookingDetails bookingDetails = (BookingDetails) request.getSession().getAttribute("booking");
            List<RoomType> rooms = (List<RoomType>) request.getSession().getAttribute("rooms");

            if (bookingDetails == null || rooms == null) {
                response.getWriter().write("Invalid booking or room information.");
                return;
            }

            Payment(request, response, bookingDetails.getTotalPrice(), bookingDetails, rooms);
        } catch (Exception e) {
            response.getWriter().write(e.getMessage());
        }
    }

    public void Payment(HttpServletRequest request, HttpServletResponse response, double price, BookingDetails bookingDetails, List<RoomType> rooms) throws IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        long amount = (long) ((price) * 100000 * 0.3);
        String bankCode = request.getParameter("bankCode");

        String vnp_TxnRef = ConfigVNPAY.getRandomNumber(8);
        String vnp_IpAddr = ConfigVNPAY.getIpAddress(request);

        String vnp_TmnCode = ConfigVNPAY.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = request.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", ConfigVNPAY.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                // Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                // Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = ConfigVNPAY.hmacSHA512(ConfigVNPAY.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = ConfigVNPAY.vnp_PayUrl + "?" + queryUrl;
        JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", paymentUrl);
        Gson gson = new Gson();
        //response.getWriter().write(gson.toJson(job));
        response.sendRedirect(paymentUrl);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        // Log the response code for debugging
        System.out.println("vnp_ResponseCode: " + vnp_ResponseCode);
        if ("00".equals(vnp_ResponseCode)) {
            try {
                BookingDAO bdao = new BookingDAO();
                BookingDetails bookingDetails = (BookingDetails) request.getSession().getAttribute("booking");
                List<RoomType> rooms = (List<RoomType>) request.getSession().getAttribute("rooms");

                if (bookingDetails != null && rooms != null) {
                    int id = bdao.inserBookings(bookingDetails);
                    if (id > 0) {
                        for (RoomType room : rooms) {
                            bdao.inserBookingRoom(id, room.getIDRoomType(), room.getNumberRoomBook());
                        }
                        response.getWriter().write("Payment and booking successful!");
                    } else {
                        response.getWriter().write("Failed to insert booking.");
                    }
                } else {
                    response.getWriter().write("Invalid booking or room information.");
                }
            } catch (Exception e) {
                response.getWriter().write(e.getMessage());
            }
        } else {
            response.getWriter().write("Payment failed!");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
