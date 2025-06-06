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
    private int typeID;
    private String name;
    private String description;
    private double pricePerNight;
    private int capacity;
    private String imagePath;

    public RoomType(int typeID, String name, String description, double pricePerNight, int capacity, String imagePath) {
        this.typeID = typeID;
        this.name = name;
        this.description = description;
        this.pricePerNight = pricePerNight;
        this.capacity = capacity;
        this.imagePath = imagePath;
    }

    public RoomType() {
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(double pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "RoomType{" + "typeID=" + typeID + ", name=" + name + ", description=" + description + ", pricePerNight=" + pricePerNight + ", capacity=" + capacity + ", imagePath=" + imagePath + '}';
    }
    
}
