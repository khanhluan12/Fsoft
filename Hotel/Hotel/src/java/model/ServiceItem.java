/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;

/**
 *
 * @author ADMIN
 */
public class ServiceItem {

    private int itemID;
    private int serviceID;
    private String itemName;
    private double price;
    private String imageURL;
    private String description;

    public ServiceItem() {
    }

    public ServiceItem(int itemID, String itemName, double price, String imageURL, int serviceID, String description) {
        this.itemID = itemID;
        this.itemName = itemName;
        this.price = price;
        this.imageURL = imageURL;
        this.serviceID = serviceID;
        this.description = description;
    }

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "ServiceItem{" + "itemID=" + itemID + ", serviceID=" + serviceID + ", itemName=" + itemName + ", price=" + price + ", imageURL=" + imageURL + ", description=" + description + '}';
    }

}
