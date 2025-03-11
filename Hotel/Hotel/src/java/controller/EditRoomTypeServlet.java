/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ManagerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;

/**
 *
 * @author admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15)    // 15 MB
public class EditRoomTypeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + "images";

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String id = request.getParameter("IDRoomType");
        String name = request.getParameter("NameRoomType");
        //        String maxPerson = request.getParameter("MaxPerson"); 
        String maxPerson = "5";
        String numberOfBed = request.getParameter("NumberOfBed");
        String numberOfBath = request.getParameter("NumberOfBath");
        String price = request.getParameter("Price");
        String totalRoom = request.getParameter("TotalRoom");
        String content = request.getParameter("Content");
        String status = "Valid";

        ManagerDao rdao = new ManagerDao();
        rdao.updateRoomType(id, name, maxPerson, numberOfBed, numberOfBath, price, totalRoom, status, content);

        Part filePart = request.getPart("image");
        if (filePart != null) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Đường dẫn lưu file
            String filePath = uploadFilePath + File.separator + fileName;
            filePart.write(filePath);
            rdao.updateRoomTypeImage(id, fileName);
        }

        request.getRequestDispatcher("showRoomType").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("IDRoomType");
        String name = request.getParameter("NameRoomType");
        //        String maxPerson = request.getParameter("MaxPerson"); 
        String maxPerson = "5";
        String numberOfBed = request.getParameter("NumberOfBed");
        String numberOfBath = request.getParameter("NumberOfBath");
        String price = request.getParameter("Price");
        String totalRoom = request.getParameter("TotalRoom");
        String content = request.getParameter("Content");
        String status = "Valid";

        ManagerDao rdao = new ManagerDao();
        rdao.updateRoomType(id, name, maxPerson, numberOfBed, numberOfBath, price, totalRoom, status, content);

        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0 && filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
            String applicationPath = request.getServletContext().getRealPath("");
            String uploadFilePath = applicationPath + File.separator + "images";

            File uploadDir = new File(uploadFilePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Đường dẫn lưu file
            String filePath = uploadFilePath + File.separator + fileName;
            filePart.write(filePath);
            rdao.updateRoomTypeImage(id, fileName);
        }

        request.getRequestDispatcher("showRoomType").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
