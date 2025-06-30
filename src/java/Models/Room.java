/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.List;

public class Room {

    private String roomNumber;
    private int roomTypeID;
    private RoomType roomType;
    private String roomStatus;

    public Room() {
    }

    public Room(String roomNumber, int roomTypeID, RoomType roomType, String roomStatus) {
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

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
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
