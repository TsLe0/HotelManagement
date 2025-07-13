/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

public class Room {

    private String roomNumber;
    private String roomTypeID;
    private RoomType roomType;
    private String roomStatus;

    public Room() {
    }

    public Room(String roomNumber, String roomTypeID, RoomType roomType, String roomStatus) {
        this.roomNumber = roomNumber;
        this.roomTypeID = roomTypeID;
        this.roomType = roomType;
        this.roomStatus = roomStatus;
    }



    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(String roomTypeID) {
        this.roomTypeID = roomTypeID;
    }


    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }

    public String getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(String roomStatus) {
        this.roomStatus = roomStatus;
    }

    @Override
    public String toString() {
        return "Room{" + "roomNumber=" + roomNumber + ", roomTypeID=" + roomTypeID + ", roomType=" + roomType + ", roomStatus=" + roomStatus + '}';
    }


  
    


}
