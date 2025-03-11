package model;

public class CheckRoomValid {
    private int IDRoom;
    private int RoomValid;

    public CheckRoomValid(int IDRoom, int RoomValid) {
        this.IDRoom = IDRoom;
        this.RoomValid = RoomValid;
    }

    public int getIDRoom() {
        return IDRoom;
    }

    public void setIDRoom(int IDRoom) {
        this.IDRoom = IDRoom;
    }

    public int getRoomValid() {
        return RoomValid;
    }

    public void setRoomValid(int RoomValid) {
        this.RoomValid = RoomValid;
    }

    @Override
    public String toString() {
        return "CheckRoomValid{" + "IDRoom=" + IDRoom + ", RoomValid=" + RoomValid + '}';
    }
}
