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

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15)    // 15 MB
public class AddNewRoomTypeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // set tim kiem tieng Viet
        ManagerDao manadao = new ManagerDao();
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + "images";

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Part filePart = request.getPart("image");

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Đường dẫn lưu file
        String filePath = uploadFilePath + File.separator + fileName;
        filePart.write(filePath);

        String name = request.getParameter("NameRoomType"); 
        String maxPerson = request.getParameter("MaxPerson");
        String numberOfBed = request.getParameter("NumberOfBed");
        String numberOfBath = request.getParameter("NumberOfBath");
        String price = request.getParameter("Price");
        String totalRoom = request.getParameter("TotalRoom");
        String content = request.getParameter("Content");
        String status = "Valid";

        manadao.addRoomType(name, maxPerson, numberOfBed, numberOfBath, price, totalRoom, status, content, fileName);
        request.getRequestDispatcher("showRoomType").forward(request, response);
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
        request.setCharacterEncoding("UTF-8"); // set tim kiem tieng Viet
        ManagerDao manadao = new ManagerDao();
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + "images";

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Part filePart = request.getPart("image");

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Đường dẫn lưu file
        String filePath = uploadFilePath + File.separator + fileName;
        filePart.write(filePath);

        String name = request.getParameter("NameRoomType");
        String maxPerson = request.getParameter("MaxPerson");
        String numberOfBed = request.getParameter("NumberOfBed");
        String numberOfBath = request.getParameter("numberOfBath");
        String price = request.getParameter("Price");
        String totalRoom = request.getParameter("TotalRoom");
        String content = request.getParameter("Content");
        String status = "Valid";

        manadao.addRoomType(name, maxPerson, numberOfBed, numberOfBath, price, totalRoom, status, content, fileName);
        request.getRequestDispatcher("showRoomType").forward(request, response);
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
