import DAO.RoomImageDAO;
import Models.Booking;
import java.util.ArrayList;
import java.util.List;

public class NewMain {
    public static void main(String[] args) {
        RoomImageDAO dao = new RoomImageDAO();
        
        List<String> list = new ArrayList<>();
        list.add("123213312");
        dao.insertRoomImages("V01", list);
        
    }
}

