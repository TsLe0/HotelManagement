
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
public class CMM {

    /**
     * @param args the command line arguments
     */
  public static void main(String[] args) {
       RoomTypeDAO dao = new RoomTypeDAO();

        int page = 1;
        int pageSize = 5;
        String sort = "price_asc"; // có thể thử: "price_desc", "default"
        String roomTypeId = "all"; // hoặc thử "RT01" nếu có dữ liệu

        List<RoomType> roomTypes = dao.getActiveRoomTypes(page, pageSize, sort, roomTypeId);

        if (roomTypes.isEmpty()) {
            System.out.println("Không có loại phòng nào được tìm thấy.");
        } else {
            System.out.println("Danh sách loại phòng đang kinh doanh:");
            for (RoomType rt : roomTypes) {
                System.out.println("ID: " + rt.getRoomTypeID());
                System.out.println("Tên: " + rt.getRoomTypeName());
                System.out.println("Giá: " + rt.getRoomTypePrice());
                System.out.println("Mô tả: " + rt.getRoomDec());
                System.out.println("Diện tích: " + rt.getRoomArea());
                System.out.println("Số giường: " + rt.getNumBeds());
                System.out.println("Trạng thái: " + rt.getRoomTypeStatus());
                System.out.println("-----------------------------------");
            }
        }
    }
    
}
