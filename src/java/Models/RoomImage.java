

package Models;

public class RoomImage {
    private int imageID;
    private int roomTypeID;
    private String roomImages;
    private RoomType roomType;

    public RoomImage() {
    }

    public RoomImage(int imageID, int roomTypeID, String roomImages, RoomType roomType) {
        this.imageID = imageID;
        this.roomTypeID = roomTypeID;
        this.roomImages = roomImages;
        this.roomType = roomType;
    }

    public int getImageID() {
        return imageID;
    }

    public void setImageID(int imageID) {
        this.imageID = imageID;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public String getRoomImages() {
        return roomImages;
    }

    public void setRoomImages(String roomImages) {
        this.roomImages = roomImages;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }

    @Override
    public String toString() {
        return "RoomImage{" + "imageID=" + imageID + ", roomTypeID=" + roomTypeID + ", roomImages=" + roomImages + ", roomType=" + roomType + '}';
    }
    
    

}
  
    
    

