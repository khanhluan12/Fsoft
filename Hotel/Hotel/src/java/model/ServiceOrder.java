/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

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
   private String fullName;
     private String email;
    private String phone;
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
 public ServiceOrder(int orderId, String serviceName, String orderDate, String fullName, String email, String phone, double totalPrice) {
        this.orderId = orderId;
        this.serviceName = serviceName;
        this.orderDate = orderDate;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.totalPrice = totalPrice;
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "ServiceOrder{" + "orderId=" + orderId + ", serviceName=" + serviceName + ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", orderDate=" + orderDate + ", status=" + status + '}';
    }

}
