import java.util.List;
import DAO.RoomTypeDAO;
import Models.RoomType;

public class NewMain {
    public static void main(String[] args) {
        RoomTypeDAO dao = new RoomTypeDAO();

        RoomType roomType = new RoomType();
        roomType.setRoomTypeID("RT005");
        roomType.setRoomTypeName("Luxury Suite");
        roomType.setRoomTypePrice(250.00);
        roomType.setRoomDec("Phòng sang trọng, view biển");
        roomType.setRoomArea(45.5);
        roomType.setNumBeds(2);
        roomType.setRoomTypeStatus("Đang kinh doanh"); // hoặc "Ngừng kinh doanh"

        boolean success = dao.addRoomType(roomType);

        if (success) {
            System.out.println("Thêm RoomType thành công!");
        } else {
            System.out.println("Thêm RoomType thất bại!");
        }
    }
    }

