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
    private BigDecimal price;
    private String imageURL;

    public ServiceItem() {
    }

    public ServiceItem(int itemID, int serviceID, String itemName, BigDecimal price, String imageURL) {
        this.itemID = itemID;
        this.serviceID = serviceID;
        this.itemName = itemName;
        this.price = price;
        this.imageURL = imageURL;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    @Override
    public String toString() {
        return "ServiceItem{" + "itemID=" + itemID + ", serviceID=" + serviceID + ", itemName=" + itemName + ", price=" + price + ", imageURL=" + imageURL + '}';
    }
    
}
