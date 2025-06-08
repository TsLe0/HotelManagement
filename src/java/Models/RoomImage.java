/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class RoomImage {
    private int imageID;
    private String RoomNumber;
    private String roomImages;
    private Room room;

    public RoomImage() {
    }

    public RoomImage(int imageID, String RoomNumber, String roomImages, Room room) {
        this.imageID = imageID;
        this.RoomNumber = RoomNumber;
        this.roomImages = roomImages;
        this.room = room;
    }

    public String getRoomNumber() {
        return RoomNumber;
    }

    public void setRoomNumber(String RoomNumber) {
        this.RoomNumber = RoomNumber;
    }

 

    public int getImageID() {
        return imageID;
    }

    public void setImageID(int imageID) {
        this.imageID = imageID;
    }

    public String getRoomImages() {
        return roomImages;
    }

    public void setRoomImages(String roomImages) {
        this.roomImages = roomImages;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    @Override
    public String toString() {
        return "RoomImage{" + "imageID=" + imageID + ", RoomNumber=" + RoomNumber + ", roomImages=" + roomImages + ", room=" + room + '}';
    }



  
    
    
}
