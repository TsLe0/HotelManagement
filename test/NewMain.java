import DAO.RoomsDAO;
import Models.Room;

public class NewMain {
    public static void main(String[] args) {
         RoomsDAO dao = new RoomsDAO();

        String testRoomNumber = "101";  // Thay bằng số phòng bạn muốn test

        boolean result = dao.disableRoom(testRoomNumber);

        if (result) {
            System.out.println("Phòng " + testRoomNumber + " đã được vô hiệu hóa thành công.");
        } else {
            System.out.println("Không thể vô hiệu hóa phòng " + testRoomNumber + ".");
        }
    }
}
