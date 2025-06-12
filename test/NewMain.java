
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
        
   
//        allGetCategories();
//        System.out.println(" /n");
//      hktProducts();
//        product();
       allRoom();
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
