import DAO.BookingDAO;
import Models.Booking;
import java.util.List;
public class NewMain {
    public static void main(String[] args) {
    BookingDAO bookingDAO = new BookingDAO();

        // Giả sử bạn đã có UserID = 1 trong database
        int testUserId = 5;

        List<Booking> bookings = bookingDAO.getBookingsByUserId(testUserId);

        if (bookings.isEmpty()) {
            System.out.println("No bookings found for user ID: " + testUserId);
        } else {
            System.out.println("Bookings for user ID: " + testUserId);
            for (Booking b : bookings) {
                System.out.println(b); // Ensure Booking class has a proper toString() method
            }
        }
    }
}

