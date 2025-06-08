/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class RoomStatus {
    private int roomStatusID;
    private String roomStatusName;

    public RoomStatus() {
    }

    public RoomStatus(int roomStatusID, String roomStatusName) {
        this.roomStatusID = roomStatusID;
        this.roomStatusName = roomStatusName;
    }

    public int getRoomStatusID() {
        return roomStatusID;
    }

    public void setRoomStatusID(int roomStatusID) {
        this.roomStatusID = roomStatusID;
    }

    public String getRoomStatusName() {
        return roomStatusName;
    }

    public void setRoomStatusName(String roomStatusName) {
        this.roomStatusName = roomStatusName;
    }

    @Override
    public String toString() {
        return "RoomStatus{" + "roomStatusID=" + roomStatusID + ", roomStatusName=" + roomStatusName + '}';
    }
    
}

