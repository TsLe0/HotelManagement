
import DAO.RoomsDAO;
import Models.Room;
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
  RoomsDAO dao = new RoomsDAO();

        // Giả sử roomNumber = "A101" đang có trong DB của bạn
        String roomNumber = "A101";
        int roomTypeId = 2;   // Ví dụ RoomTypeID = 2
        int statusId = 1;     // Ví dụ RoomStatusID = 1 (Available)
        String roomDesc = "Updated description for room A101";
        double roomPrice = 1500000.0;   // 1,500,000 VND

        dao.updateRoom(roomNumber, roomTypeId, statusId, roomDesc, roomPrice);
    }

    public static void allRoom( ) {
        RoomsDAO _dao = new RoomsDAO();
//       List<Room> x = _dao.getAllRoom();
//       for(Room c:x){
//            System.out.println(c);
//       }
       _dao.addRooms("123", 2, 1, "ALi", 0);
      
    }

    
    
}
