
import DAO.RoomTypeDAO;



/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author Admin
 */
public class CMM {

    /**
     * @param args the command line arguments
     */
  public static void main(String[] args) {
        RoomTypeDAO dao = new RoomTypeDAO();
        int totalRoomTypes = dao.getTotalRoomTypes();
        System.out.println("Tổng số hạng phòng: " + totalRoomTypes);
    }
    
}
