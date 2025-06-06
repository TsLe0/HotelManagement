/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;



public class Rooms {

 private int roomID;
    private int typeID;
    private String status;
    private RoomType roomtype;

    public Rooms() {
    }

    public Rooms(int roomID, int typeID, String status, RoomType roomtype) {
        this.roomID = roomID;
        this.typeID = typeID;
        this.status = status;
        this.roomtype = roomtype;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public RoomType getRoomtype() {
        return roomtype;
    }

    public void setRoomtype(RoomType roomtype) {
        this.roomtype = roomtype;
    }

    @Override
    public String toString() {
        return "Rooms{" + "roomID=" + roomID + ", typeID=" + typeID + ", status=" + status + ", roomtype=" + roomtype + '}';
    }

   


   
}
