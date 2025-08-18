
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
public class CMM {

    /**
     * @param args the command line arguments
     */
  public static void main(String[] args) {
       RoomsDAO roomDAO = new RoomsDAO();
        int limit = 5; // Lấy 5 phòng mới nhất

        List<Room> latestRooms = roomDAO.getLatestRooms(limit);

        System.out.println("Danh sách " + limit + " phòng mới nhất:");
        for (Room room : latestRooms) {
            System.out.println("Số phòng: " + room.getRoomNumber());
            System.out.println("Trạng thái: " + room.getRoomStatus());
            System.out.println("Loại phòng ID: " + room.getRoomTypeID());
            if (room.getRoomType() != null) {
                System.out.println("Tên loại phòng: " + room.getRoomType().getRoomTypeName());
                System.out.println("Giá: " + room.getRoomType().getRoomTypePrice());
            }
            System.out.println("----------");
        }
    }
    }
    

