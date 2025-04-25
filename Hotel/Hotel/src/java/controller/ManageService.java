package controller;

import dao.ServiceDAO;
import dao.ServiceItemDAO;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Service;
import model.ServiceItem;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class ManageService extends HttpServlet {

    private ServiceItemDAO serviceItemDAO;
    private ServiceDAO serviceDAO;

    @Override
    public void init() {
        serviceItemDAO = new ServiceItemDAO();
        serviceDAO = new ServiceDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("deleteService".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            serviceDAO.deleteService(id);
            request.setAttribute("message", "Service deleted successfully!");
            List<Service> services = serviceDAO.getAllServices();
             request.setAttribute("services", services);
             request.getRequestDispatcher("serviceList.jsp").forward(request, response);
            return;
        }

        if ("delete".equals(action)) {
    int id = Integer.parseInt(request.getParameter("id"));
    ServiceItem item = serviceItemDAO.getItemById(id); 
    
    if (item != null) {
        int serviceID = item.getServiceID();
        serviceItemDAO.delete(id);
        response.sendRedirect("ManageService?action=viewDetail&id=" + serviceID + "&message=deleted");
    } else {
        response.sendRedirect("ManageService?action=error&message=notfound");
    }
}
if ("viewDetail".equals(action)) {
    int serviceID = Integer.parseInt(request.getParameter("id"));
    List<ServiceItem> service = serviceItemDAO.getItemsByServiceId(serviceID);
    request.setAttribute("service", service);
    request.setAttribute("serviceID", serviceID);
    String message = request.getParameter("message");
    if ("deleted".equals(message)) {
        request.setAttribute("message", "Service item deleted successfully!");
    }
    request.getRequestDispatcher("serviceDetail.jsp").forward(request, response);
}

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String action = request.getParameter("action");

        // ===== Xử lý CRUD cho Service =====
       if ("addService".equals(action) || "updateService".equals(action)) {
    int id = request.getParameter("id") == null || request.getParameter("id").isEmpty()
            ? 0 : Integer.parseInt(request.getParameter("id"));
    String serviceName = request.getParameter("serviceName");

    if (serviceName != null && !serviceName.trim().isEmpty()) {
        Service s = new Service(id, serviceName);
        if (id == 0) {
            serviceDAO.insertService(s);
            response.sendRedirect("ManageService?action=list&message=addSuccess");
        } else {
            serviceDAO.updateService(s);
            response.sendRedirect("ManageService?action=list&message=updateSuccess");
        }
        return; // Quan trọng!
    }


    response.sendRedirect("ManageService?action=list&message=invalid");
    return;
}


        // ===== Xử lý CRUD cho ServiceItem =====
       int id = request.getParameter("id") == null || request.getParameter("id").isEmpty()
        ? 0 : Integer.parseInt(request.getParameter("id"));
String serviceIdParam = request.getParameter("serviceID");
int serviceID = (serviceIdParam == null || serviceIdParam.isEmpty()) ? 0 : Integer.parseInt(serviceIdParam);

String name = request.getParameter("itemName");
if (name == null || name.trim().isEmpty()) {
    response.sendRedirect("ManageService?action=viewDetail&id=" + serviceID + "&message=nameRequired");
    return;
}

double price = Double.parseDouble(request.getParameter("price"));
String description = request.getParameter("description");
String oldImageURL = request.getParameter("oldImageURL");

String applicationPath = request.getServletContext().getRealPath("");
String uploadFilePath = applicationPath + File.separator + "images";

File uploadDir = new File(uploadFilePath);
if (!uploadDir.exists()) uploadDir.mkdirs();

Part filePart = request.getPart("image");
String fileName = null;
String imageURL = null;

if (filePart != null && filePart.getSize() > 0) {
    String originalName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
    fileName = System.currentTimeMillis() + "_" + originalName;
    String filePath = uploadFilePath + File.separator + fileName;
    filePart.write(filePath);
    imageURL = "images/" + fileName;
} else {
    imageURL = oldImageURL;
}

ServiceItem item = new ServiceItem(id, name, price, imageURL, serviceID, description);

if (id == 0) {
    serviceItemDAO.insert(item);
    response.sendRedirect("ManageService?action=viewDetail&id=" + serviceID + "&message=addSuccess");
} else {
    serviceItemDAO.update(item);
    response.sendRedirect("ManageService?action=viewDetail&id=" + serviceID + "&message=updateSuccess");
}

    }

    @Override
    public String getServletInfo() {
        return "ManageService Servlet";
    }
}
