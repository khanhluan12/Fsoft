package controller;

import dao.ManagerDao;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class EditRoomTypeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            ManagerDao rdao = new ManagerDao();
            // Get data from form
            String id = request.getParameter("IDRoomType");
            String name = request.getParameter("NameRoomType");
            String maxPerson = request.getParameter("MaxPerson");
            String numberOfBed = request.getParameter("NumberOfBed");
            String numberOfBath = request.getParameter("NumberOfBath");
            String price = request.getParameter("Price");
            String totalRoom = request.getParameter("TotalRoom");
            String content = request.getParameter("Content");
            String status = "Valid";

            // Set default value for maxPerson if not provided
            if (maxPerson == null || maxPerson.isEmpty()) {
                maxPerson = "5"; // Default value
            }

            // Update room type data
            rdao.updateRoomType(id, name, maxPerson, numberOfBed, numberOfBath, price, totalRoom, status, content);

            // Handle image if provided
            Part filePart = request.getPart("image");
            if (filePart != null && filePart.getSize() > 0 && filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);
                rdao.updateRoomTypeImage(id, fileName);
            }

            // Send success message
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Room '" + name + "' has been successfully updated!");
            response.sendRedirect("showRoomType");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error updating room: " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for editing room types";
    }
}
