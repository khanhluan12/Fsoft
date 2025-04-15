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
import java.util.*;

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

        // 👉 Dùng VND trực tiếp, chỉ cần nhân 100 theo yêu cầu của VNPAY
        long amount = (long) (price * 100000); // Thanh toán 30% tổng tiền

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

        // Tạo chuỗi dữ liệu để ký
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();

        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if (fieldValue != null && fieldValue.length() > 0) {
                hashData.append(fieldName).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
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

        // Chuyển hướng người dùng tới trang thanh toán VNPAY
        response.sendRedirect(paymentUrl);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
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
                        request.setAttribute("booksuccess", "Thanh toán và đặt phòng thành công!");
                        request.getRequestDispatcher("customer_home.jsp").forward(request, response);
                        return;
                    } else {
                        request.setAttribute("error", "Không thể lưu đặt phòng.");
                    }
                } else {
                    request.setAttribute("error", "Thiếu thông tin đặt phòng.");
                }
            } catch (Exception e) {
                request.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            }
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else if ("24".equals(vnp_ResponseCode)) {
            response.sendRedirect("customer_home.jsp?vnp_ResponseCode=24");
        } else {
            request.setAttribute("error", "Thanh toán thất bại! Mã lỗi: " + vnp_ResponseCode);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Booking and Payment Servlet with VNPAY integration";
    }
}
