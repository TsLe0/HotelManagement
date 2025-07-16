
package Models;

/**
 *
 * @author Admin
 */
public class RoomType {

    private String roomTypeID;
    private String roomTypeName;
    private String roomDec;
    private double roomArea;
    private double roomTypePrice;
    private int numBeds;
    private String imagePath;
    private String roomTypeStatus;

    public RoomType() {
    }

    public RoomType(String roomTypeID, String roomTypeName, String roomDec, double roomArea, double roomTypePrice, int numBeds, String imagePath, String roomTypeStatus) {
        this.roomTypeID = roomTypeID;
        this.roomTypeName = roomTypeName;
        this.roomDec = roomDec;
        this.roomArea = roomArea;
        this.roomTypePrice = roomTypePrice;
        this.numBeds = numBeds;
        this.imagePath = imagePath;
        this.roomTypeStatus = roomTypeStatus;
    }

    public String getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(String roomTypeID) {
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

    public String getRoomTypeStatus() {
        return roomTypeStatus;
    }

    public void setRoomTypeStatus(String roomTypeStatus) {
        this.roomTypeStatus = roomTypeStatus;
    }

    @Override
    public String toString() {
        return "RoomType{" + "roomTypeID=" + roomTypeID + ", roomTypeName=" + roomTypeName + ", roomDec=" + roomDec + ", roomArea=" + roomArea + ", roomTypePrice=" + roomTypePrice + ", numBeds=" + numBeds + ", imagePath=" + imagePath + ", roomTypeStatus=" + roomTypeStatus + '}';
    }

 
  
    
  
    
}
