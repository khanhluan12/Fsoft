
import dao.ServiceDAO;
import dao.ServiceItemDAO;
import java.util.List;
import model.Service;
import model.ServiceItem;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author plmin
 */
public class Main {
        public static void main(String[] args) {
        testServiceDAO();
        testServiceItemDAO(1); // test with serviceId = 1 (food)
    }

    public static void testServiceDAO() {
        ServiceDAO serviceDAO = new ServiceDAO();
        List<Service> services = serviceDAO.getAllServices();

        System.out.println("=== Services ===");
        if (services.isEmpty()) {
            System.out.println("No services found.");
        } else {
            for (Service service : services) {
                System.out.println("ID: " + service.getServiceID()
                        + ", Name: " + service.getServiceName()
                        + ", CategoryID: " + service.getCategoryID());
            }
        }
    }

    public static void testServiceItemDAO(int serviceId) {
        ServiceItemDAO itemDAO = new ServiceItemDAO();
        List<ServiceItem> items = itemDAO.getItemsByServiceId(serviceId);

        System.out.println("\n=== Service Items for ServiceID: " + serviceId + " ===");
        if (items.isEmpty()) {
            System.out.println("No service items found.");
        } else {
            for (ServiceItem item : items) {
                System.out.println("ID: " + item.getItemID()
                        + ", Name: " + item.getItemName()
                        + ", Price: $" + item.getPrice()
                        + ", ImageURL: " + item.getImageURL());
            }
        }
    }
}
