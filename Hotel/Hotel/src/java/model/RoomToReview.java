package model;

public class RoomToReview {

    private int idBookingDetail;
    private int idBooking;
    private int idRoomType;
    private String roomTypeName;
    private int numberOfRoom;

    // Getter và Setter cho idBookingDetail
    public int getIdBookingDetail() {
        return idBookingDetail;
    }

    public void setIdBookingDetail(int idBookingDetail) {
        this.idBookingDetail = idBookingDetail;
    }

    // Các getter và setter khác
    public int getIdBooking() {
        return idBooking;
    }

    public void setIdBooking(int idBooking) {
        this.idBooking = idBooking;
    }

    public int getIdRoomType() {
        return idRoomType;
    }

    public void setIdRoomType(int idRoomType) {
        this.idRoomType = idRoomType;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public int getNumberOfRoom() {
        return numberOfRoom;
    }

    public void setNumberOfRoom(int numberOfRoom) {
        this.numberOfRoom = numberOfRoom;
    }
}
