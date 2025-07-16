import DAO.RoomImageDAO;
import Models.Booking;
import java.util.ArrayList;
import java.util.List;
import Models.Room;
import DAO.RoomsDAO;
public class NewMain {
    public static void main(String[] args) {
     Room room = new Room();
        room.setRoomNumber("A111");
        room.setRoomTypeID("D01");  // Giả sử RT001 tồn tại và có Status = N'Đang kinh doanh'
        room.setRoomStatus("Trống");

        // Gọi DAO để thêm phòng
        RoomsDAO roomDAO = new RoomsDAO();
        roomDAO.addRoom(room);
    }
}

