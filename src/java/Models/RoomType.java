/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class RoomType {

    private int roomTypeID;
    private String roomTypeName;
    private int numBeds;
    private String imagePath;

    public RoomType() {
    }

    public RoomType(int roomTypeID, String roomTypeName, int numBeds, String imagePath) {
        this.roomTypeID = roomTypeID;
        this.roomTypeName = roomTypeName;
        this.numBeds = numBeds;
        this.imagePath = imagePath;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public int getNumBeds() {
        return numBeds;
    }

    public void setNumBeds(int numBeds) {
        this.numBeds = numBeds;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "RoomType{" + "roomTypeID=" + roomTypeID + ", roomTypeName=" + roomTypeName + ", numBeds=" + numBeds + ", imagePath=" + imagePath + '}';
    }
}
