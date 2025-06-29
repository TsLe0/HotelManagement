
package Models;

/**
 *
 * @author Admin
 */
public class RoomType {

    private int roomTypeID;
    private String roomTypeName;
    private String roomDec;
    private double roomArea;
    private double roomTypePrice;
    private int numBeds;
    private String imagePath;

    public RoomType() {
    }

    public RoomType(int roomTypeID, String roomTypeName, String roomDec, double roomArea, double roomTypePrice, int numBeds, String imagePath) {
        this.roomTypeID = roomTypeID;
        this.roomTypeName = roomTypeName;
        this.roomDec = roomDec;
        this.roomArea = roomArea;
        this.roomTypePrice = roomTypePrice;
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

    public String getRoomDec() {
        return roomDec;
    }

    public void setRoomDec(String roomDec) {
        this.roomDec = roomDec;
    }

    public double getRoomArea() {
        return roomArea;
    }

    public void setRoomArea(double roomArea) {
        this.roomArea = roomArea;
    }

    public double getRoomTypePrice() {
        return roomTypePrice;
    }

    public void setRoomTypePrice(double roomTypePrice) {
        this.roomTypePrice = roomTypePrice;
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
        return "RoomType{" + "roomTypeID=" + roomTypeID + ", roomTypeName=" + roomTypeName + ", roomDec=" + roomDec + ", roomArea=" + roomArea + ", roomTypePrice=" + roomTypePrice + ", numBeds=" + numBeds + ", imagePath=" + imagePath + '}';
    }

  
    
  
    
}
