/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class BookingByDate {

    private String dateTop5;
    private String numberOfBooking;
    private String totalOfRoom;
    private String totalPrice;

    public BookingByDate(String dateTop5, String numberOfBooking, String totalOfRoom, String totalPrice) {
        this.dateTop5 = dateTop5;
        this.numberOfBooking = numberOfBooking;
        this.totalOfRoom = totalOfRoom;
        this.totalPrice = totalPrice;
    }

    public String getDateTop5() {
        return dateTop5;
    }

    public void setDateTop5(String dateTop5) {
        this.dateTop5 = dateTop5;
    }

    public String getNumberOfBooking() {
        return numberOfBooking;
    }

    public void setNumberOfBooking(String numberOfBooking) {
        this.numberOfBooking = numberOfBooking;
    }

    public String getTotalOfRoom() {
        return totalOfRoom;
    }

    public void setTotalOfRoom(String totalOfRoom) {
        this.totalOfRoom = totalOfRoom;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "BookingByDate{" + "Date=" + dateTop5 + ", numberOfBooking=" + numberOfBooking + ", totalOfRoom=" + totalOfRoom + ", totalPrice=" + totalPrice + '}';
    }
}
