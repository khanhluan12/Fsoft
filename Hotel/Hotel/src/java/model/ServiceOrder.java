/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author plmin
 */
public class ServiceOrder {

    private int orderId;
    private String serviceName;
    private int quantity;
    private double totalPrice;
    private String orderDate;
    private String status;

    public ServiceOrder() {
    }

    public ServiceOrder(int orderId, String serviceName, int quantity, double totalPrice, String orderDate, String status) {
        this.orderId = orderId;
        this.serviceName = serviceName;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ServiceOrder{" + "orderId=" + orderId + ", serviceName=" + serviceName + ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", orderDate=" + orderDate + ", status=" + status + '}';
    }

}
