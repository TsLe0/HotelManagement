
import DAO.RoomsDAO;
import Models.Room;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        try {
            // Khởi tạo DAO
            RoomsDAO roomsDAO = new RoomsDAO();

            // Định dạng ngày
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date checkIn = sdf.parse("2025-07-25");
            Date checkOut = sdf.parse("2025-07-28");

            // ID loại phòng (ví dụ RoomTypeID = "RT01")
            String roomTypeId = "RT01";

            // Gọi method
            List<Room> availableRooms = roomsDAO.getAvailableRoomsByTypeId(roomTypeId, checkIn, checkOut);

            // In kết quả
            if (availableRooms.isEmpty()) {
                System.out.println("Không có phòng trống trong khoảng thời gian đã chọn.");
            } else {
                System.out.println("Danh sách phòng trống:");
                for (Room room : availableRooms) {
                    System.out.println("Phòng: " + room.getRoomNumber() +
                                       ", Trạng thái: " + room.getRoomStatus() +
                                       ", Loại phòng: " + room.getRoomTypeID());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    }
    
}
