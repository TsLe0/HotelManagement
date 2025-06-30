
import java.sql.Date;
import DAO.BookingDAO;
import Models.Booking;

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
        // Tạo đối tượng Booking
 Booking booking = new Booking();
        booking.setUserId(1); // UserID đã tồn tại trong DB
        booking.setRoomTypeId(2); // RoomTypeID đã tồn tại
        booking.setRoomNumber(null);
        booking.setCheckinDate(Date.valueOf("2025-07-10"));
        booking.setCheckoutDate(Date.valueOf("2025-07-15"));
        booking.setNumberOfGuests(2);
        booking.setTotalPrice(1500000.0);
        booking.setStatus("Pending");
        booking.setBookingDate(new Date(System.currentTimeMillis()));
        booking.setSpecialRequests("Cần phòng gần thang máy");

        // Gọi DAO để thêm vào DB
        BookingDAO dao = new BookingDAO();
        boolean success = dao.addBooking(booking);

        // In kết quả
        if (success) {
            System.out.println("✅ Booking added successfully!");
        } else {
            System.out.println("❌ Failed to add booking.");
        }
    }
}


