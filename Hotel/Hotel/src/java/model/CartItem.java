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

    private ServiceItem item = null;
    private int serviceId;
    private int quantity;
    private double price;

    public CartItem() {
    }

    public CartItem(ServiceItem item, int quantity) {
        this.item = item;
        this.quantity = quantity;
    }

    public CartItem(ServiceItem item, int serviceId, int quantity, double price) {
        this.item = item;
        this.serviceId = serviceId;
        this.quantity = quantity;
        this.price = price;
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

    @Override
    public String toString() {
        return "CartItem{" + "item=" + item + ", serviceId=" + serviceId + ", quantity=" + quantity + ", price=" + price + '}';
    }

}
