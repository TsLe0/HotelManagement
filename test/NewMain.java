
import DAO.RoomTypeDAO;
import Models.RoomType;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
/**
 *
 * @author Admin
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        RoomTypeDAO dao = new RoomTypeDAO();
        List<RoomType> roomTypes = dao.getAllRoomType();

        System.out.println("==== Testing getAllRoomType() ====");
        if (roomTypes == null) {
            System.out.println("❌ Test failed: Returned list is null.");
        } else if (roomTypes.isEmpty()) {
            System.out.println("✅ Test passed: List is empty (no RoomType records in DB).");
        } else {
            System.out.println("✅ Test passed: Retrieved " + roomTypes.size() + " RoomType(s).");
            for (RoomType rt : roomTypes) {
                System.out.println("RoomTypeID: " + rt.getRoomTypeID()
                        + ", Name: " + rt.getRoomTypeName()
                        + ", Price: " + rt.getRoomTypePrice()
                        + ", Description: " + rt.getRoomDec()
                        + ", Area: " + rt.getRoomArea()
                        + ", Beds: " + rt.getNumBeds());
            }
    }
    }

}
