/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbcontext;

import dao.ServiceOrderDAO;
import dao.UserDao;
import java.util.List;
import model.ServiceOrder;
import model.User;

/**
 *
 * @author admin
 */
public class Main {
//    public static void main(String[] args) {
//        UserDao dao = new UserDao();
//        boolean check = dao.login(new User("trandanglen","240602"));
//        System.out.println(""+check);
//        check = dao.registerUser(new User("Kim", "Tien", "kimtientran@gmail.com", "tienttk", "1111"));
//        System.out.println("Insert: " + check);
//    }
//    public static void main(String[] args) {
//        try {
//            System.out.println(new DBUtil().getConnection());
//        } catch (Exception e) {
//        }
//    }
    
        public static void main(String[] args) {
        // Create an instance of ServiceOrderDAO
        ServiceOrderDAO orderDAO = new ServiceOrderDAO();
        
        // Test data - replace with your actual test values
        int testItemId = 1;       // Existing ItemID from ServiceItem table
        int testUserId = 16;       // Existing UserID from Account table
        int testQuantity = 2;
        double testTotalPrice = 5000.00;
        String testStatus = "Completed - Test 3";
        
        System.out.println("Starting test for createServiceOrder()...");
        
        // Call the method we want to test
        boolean result = orderDAO.createServiceOrder(testItemId, testUserId, testQuantity, 
                                                   testTotalPrice, testStatus);
        
        // Check and display results
        if (result) {
            System.out.println("Test PASSED - Service order created successfully!");
            
            // Optional: Verify the order was actually created by retrieving it
            System.out.println("\nVerifying order creation...");
            List<ServiceOrder> orders = orderDAO.getServiceOrdersByUserId(testUserId);
            
            if (!orders.isEmpty()) {
                ServiceOrder latestOrder = orders.get(0); // Get most recent order
                System.out.println("Latest order details:");
                System.out.println("Order ID: " + latestOrder.getOrderId());
                System.out.println("Service Name: " + latestOrder.getServiceName());
                System.out.println("Quantity: " + latestOrder.getQuantity());
                System.out.println("Total Price: " + latestOrder.getTotalPrice());
                System.out.println("Status: " + latestOrder.getStatus());
            } else {
                System.out.println("⚠️ Order creation verification failed - no orders found");
            }
        } else {
            System.out.println("❌ Test FAILED - Service order creation failed");
        }
        
        System.out.println("\nTest completed.");
    }
}
