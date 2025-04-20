package controller;

import dao.ManagerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class AddNewRoomTypeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            ManagerDao manadao = new ManagerDao();
            // Handle file upload
            Part filePart = request.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            // Create upload directory if it doesn't exist
            String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            // Save the file
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            // Get form parameters
            String name = request.getParameter("name");
            String maxPerson = request.getParameter("maxPerson");
            String price = request.getParameter("price");
            String bed = request.getParameter("bed");
            String bath = request.getParameter("bath");
            String content = request.getParameter("content");
            String totalRoom = request.getParameter("totalRoom");

            // Set default values for missing parameters
            if (maxPerson == null || maxPerson.isEmpty()) {
                maxPerson = "2"; // Default value if not provided
            }
            if (totalRoom == null || totalRoom.isEmpty()) {
                totalRoom = "1"; // Default value if not provided
            }
            String status = "Valid";

            // Add the new room type
            manadao.addRoomType(name, maxPerson, bed, bath, price, totalRoom, status, content, fileName);

            // Add success message to session
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Room '" + name + "' has been successfully added!");

            // Redirect to show rooms page
            response.sendRedirect("showRoomType");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error adding room: " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect POST requests to doPost
        doPost(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for adding new room types";
    }
}
