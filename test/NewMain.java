import java.util.List;
import DAO.RoomTypeDAO;
import Models.RoomType;

public class NewMain {
    public static void main(String[] args) {
        RoomTypeDAO dao = new RoomTypeDAO();
    
    // Nhập RoomTypeID cần disable
    String testRoomTypeId = "RT005";

    boolean result = dao.disableRoomType(testRoomTypeId);
    
    if (result) {
        System.out.println("RoomType với ID " + testRoomTypeId + " đã được chuyển sang trạng thái 'Ngừng kinh doanh'.");
    } else {
        System.out.println("Không thể cập nhật RoomType với ID " + testRoomTypeId + ". Có thể ID không tồn tại hoặc đã ở trạng thái 'Ngừng kinh doanh'.");
    }
    }
}

