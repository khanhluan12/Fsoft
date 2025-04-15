package model;

public class BookingDetail {

    private int bookingDetailId;
    private int roomTypeId;
    private int numberOfRooms;
    private String roomName;

    // Constructor mới
    public BookingDetail(int bookingDetailId, int roomTypeId, int numberOfRooms, String roomName) {
        this.bookingDetailId = bookingDetailId;
        this.roomTypeId = roomTypeId;
        this.numberOfRooms = numberOfRooms;
        this.roomName = roomName;
    }

    // Getters và setters (nếu cần)
    public int getBookingDetailId() {
        return bookingDetailId;
    }

    public int getRoomTypeId() {
        return roomTypeId;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }

    public String getRoomName() {
        return roomName;
    }
}
