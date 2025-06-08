/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.List;

public class Room {

    private String roomNumber;
    private int roomTypeID;
    private int roomStatusID;
    private String roomDesc;
    private RoomType roomType;
    private RoomStatus roomStatus;
    private double roomPrice;
    private List<RoomImage> roomImages;

    public Room() {
    }

    public Room(String roomNumber, int roomTypeID, int roomStatusID, String roomDesc, RoomType roomType, RoomStatus roomStatus, double roomPrice, List<RoomImage> roomImages) {
        this.roomNumber = roomNumber;
        this.roomTypeID = roomTypeID;
        this.roomStatusID = roomStatusID;
        this.roomDesc = roomDesc;
        this.roomType = roomType;
        this.roomStatus = roomStatus;
        this.roomPrice = roomPrice;
        this.roomImages = roomImages;
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

    public int getRoomStatusID() {
        return roomStatusID;
    }

    public void setRoomStatusID(int roomStatusID) {
        this.roomStatusID = roomStatusID;
    }

    public String getRoomDesc() {
        return roomDesc;
    }

    public void setRoomDesc(String roomDesc) {
        this.roomDesc = roomDesc;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }

    public RoomStatus getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(RoomStatus roomStatus) {
        this.roomStatus = roomStatus;
    }

    public double getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(double roomPrice) {
        this.roomPrice = roomPrice;
    }

    public List<RoomImage> getRoomImages() {
        return roomImages;
    }

    public void setRoomImages(List<RoomImage> roomImages) {
        this.roomImages = roomImages;
    }

    @Override
    public String toString() {
        return "Room{" + "roomNumber=" + roomNumber + ", roomTypeID=" + roomTypeID + ", roomStatusID=" + roomStatusID + ", roomDesc=" + roomDesc + ", roomType=" + roomType + ", roomStatus=" + roomStatus + ", roomPrice=" + roomPrice + ", roomImages=" + roomImages + '}';
    }

}
