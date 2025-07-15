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
    private double roomPrice;

    public Room() {
    }

    public Room(String roomNumber, String roomTypeID, RoomType roomType, String roomStatus, double roomPrice ) {
        this.roomNumber = roomNumber;
        this.roomTypeID = roomTypeID;
        this.roomType = roomType;
        this.roomStatus = roomStatus;
        this.roomPrice = roomPrice;
       
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

    public double getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(double roomPrice) {
        this.roomPrice = roomPrice;
    }

    @Override
    public String toString() {
        return "Room{" + "roomNumber=" + roomNumber + ", roomTypeID=" + roomTypeID + ", roomType=" + roomType + ", roomStatus=" + roomStatus + ", roomPrice=" + roomPrice + '}';
    }

   


  
    


}
