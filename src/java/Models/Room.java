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
    private int roomStatusID;
    private RoomStatus roomStatus;
    private String roomDesc;
    private double roomPrice;

    public Room() {
    }

    public Room(String roomNumber, int roomTypeID, RoomType roomType, int roomStatusID, RoomStatus roomStatus, String roomDesc, double roomPrice) {
        this.roomNumber = roomNumber;
        this.roomTypeID = roomTypeID;
        this.roomType = roomType;
        this.roomStatusID = roomStatusID;
        this.roomStatus = roomStatus;
        this.roomDesc = roomDesc;
        this.roomPrice = roomPrice;
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

    public int getRoomStatusID() {
        return roomStatusID;
    }

    public void setRoomStatusID(int roomStatusID) {
        this.roomStatusID = roomStatusID;
    }

    public RoomStatus getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(RoomStatus roomStatus) {
        this.roomStatus = roomStatus;
    }

    public String getRoomDesc() {
        return roomDesc;
    }

    public void setRoomDesc(String roomDesc) {
        this.roomDesc = roomDesc;
    }

    public double getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(double roomPrice) {
        this.roomPrice = roomPrice;
    }

    @Override
    public String toString() {
        return "Room{" + "roomNumber=" + roomNumber + ", roomTypeID=" + roomTypeID + ", roomType=" + roomType + ", roomStatusID=" + roomStatusID + ", roomStatus=" + roomStatus + ", roomDesc=" + roomDesc + ", roomPrice=" + roomPrice + '}';
    }


}
