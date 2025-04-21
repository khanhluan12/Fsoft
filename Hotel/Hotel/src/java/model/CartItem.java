/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author plmin
 */
public class CartItem {

    private ServiceItem item;
    private int serviceId;
    private int quantity;
    private double price;
    private String rentalDate;
    private String rentalTime;

    public CartItem() {
    }

    public CartItem(ServiceItem item, int quantity) {
        this.item = item;
        this.quantity = quantity;
        this.serviceId = item.getServiceID();
        this.price = item.getPrice();
    }

    public CartItem(ServiceItem item, int quantity, String rentalDate, String rentalTime) {
        this(item, quantity);
        this.rentalDate = rentalDate;
        this.rentalTime = rentalTime;
    }

    public ServiceItem getItem() {
        return item;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getRentalDate() {
        return rentalDate;
    }

    public void setRentalDate(String rentalDate) {
        this.rentalDate = rentalDate;
    }

    public String getRentalTime() {
        return rentalTime;
    }

    public void setRentalTime(String rentalTime) {
        this.rentalTime = rentalTime;
    }

    @Override
    public String toString() {
        return "CartItem{" + "item=" + item + ", serviceId=" + serviceId + ", quantity=" + quantity + ", price=" + price + ", rentalDate=" + rentalDate + ", rentalTime=" + rentalTime + '}';
    }

}
