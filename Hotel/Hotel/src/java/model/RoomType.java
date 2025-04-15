/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class RoomType {

    private int IDRoomType;
    private String NameRoomType;
    private int MaxPerson;
    private int NumberOfBed;
    private int NumberOfBath;
    private int Price;
    private int totalRoom;
    private String RoomStatus;
    private String Content;
    private String image;
    private int roomFree;
    private int numberRoomBook;
    private double averageRating;

    public RoomType(int IDRoomType, String NameRoomType, int MaxPerson, int NumberOfBed, int NumberOfBath, int Price, int totalRoom, String RoomStatus, String Content) {
        this.IDRoomType = IDRoomType;
        this.NameRoomType = NameRoomType;
        this.MaxPerson = MaxPerson;
        this.NumberOfBed = NumberOfBed;
        this.NumberOfBath = NumberOfBath;
        this.Price = Price;
        this.totalRoom = totalRoom;
        this.RoomStatus = RoomStatus;
        this.Content = Content;
    }

    public int getNumberRoomBook() {
        return numberRoomBook;
    }

    public void setNumberRoomBook(int numberRoomBook) {
        this.numberRoomBook = numberRoomBook;
    }

    public int getRoomFree() {
        return roomFree;
    }

    public void setRoomFree(int roomFree) {
        this.roomFree = roomFree;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getIDRoomType() {
        return IDRoomType;
    }

    public void setIDRoomType(int IDRoomType) {
        this.IDRoomType = IDRoomType;
    }

    public String getNameRoomType() {
        return NameRoomType;
    }

    public void setNameRoomType(String NameRoomType) {
        this.NameRoomType = NameRoomType;
    }

    public int getMaxPerson() {
        return MaxPerson;
    }

    public void setMaxPerson(int MaxPerson) {
        this.MaxPerson = MaxPerson;
    }

    public int getNumberOfBed() {
        return NumberOfBed;
    }

    public void setNumberOfBed(int NumberOfBed) {
        this.NumberOfBed = NumberOfBed;
    }

    public int getNumberOfBath() {
        return NumberOfBath;
    }

    public void setNumberOfBath(int NumberOfBath) {
        this.NumberOfBath = NumberOfBath;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getTotalRoom() {
        return totalRoom;
    }

    public void setTotalRoom(int totalRoom) {
        this.totalRoom = totalRoom;
    }

    public String getRoomStatus() {
        return RoomStatus;
    }

    public void setRoomStatus(String RoomStatus) {
        this.RoomStatus = RoomStatus;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    // Thêm getter và setter
    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    public String getStarRating() {
        if (averageRating == 0) {
            return "Chưa có đánh giá";
        }
        return String.format("%.1f sao", averageRating);
    }

    @Override
    public String toString() {
        return "RoomType{" + "IDRoomType=" + IDRoomType + ", NameRoomType=" + NameRoomType + ", MaxPerson=" + MaxPerson + ", NumberOfBed=" + NumberOfBed + ", NumberOfBath=" + NumberOfBath + ", Price=" + Price + ", totalRoom=" + totalRoom + ", RoomStatus=" + RoomStatus + ", Content=" + Content + ", image=" + image + '}';
    }
}
