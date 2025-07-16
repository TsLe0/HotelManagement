import DAO.BookingDAO;
import Models.Booking;
import java.util.List;

public class NewMain {
    public static void main(String[] args) {
BookingDAO bookingDAO = new BookingDAO();
        
        System.out.println("=== TESTING getAllBookings() ===");
        
        try {
            // Gọi hàm getAllBookings()
            List<Booking> bookings = bookingDAO.getAllBookings();
            
            // Kiểm tra kết quả
            if (bookings != null) {
                System.out.println("✓ Hàm getAllBookings() hoạt động thành công!");
                System.out.println("📊 Số lượng booking tìm thấy: " + bookings.size());
                
                if (bookings.isEmpty()) {
                    System.out.println("⚠️ Không có booking nào trong database");
                } else {
                    System.out.println("\n=== DANH SÁCH BOOKING ===");
                    
                    // In ra 5 booking đầu tiên (hoặc tất cả nếu < 5)
                    int displayCount = Math.min(5, bookings.size());
                    for (int i = 0; i < displayCount; i++) {
                        Booking booking = bookings.get(i);
                        System.out.println("\n--- Booking " + (i + 1) + " ---");
                        System.out.println("Booking ID: " + booking.getBookingId());
                        System.out.println("User ID: " + booking.getUserId());
                        System.out.println("Room Type ID: " + booking.getRoomTypeId());
                        System.out.println("Room Number: " + booking.getRoomNumber());
                        System.out.println("Check-in Date: " + booking.getCheckinDate());
                        System.out.println("Check-out Date: " + booking.getCheckoutDate());
                        System.out.println("Number of Guests: " + booking.getNumberOfGuests());
                        System.out.println("Total Price: " + booking.getTotalPrice());
                        System.out.println("Status: " + booking.getStatus());
                        System.out.println("Booking Date: " + booking.getBookingDate());
                        System.out.println("Special Requests: " + booking.getSpecialRequests());
                        System.out.println("Customer Name: " + booking.getCustomerName());
                        System.out.println("Customer Phone: " + booking.getCustomerPhoneNumber());
                    }
                    
                    if (bookings.size() > 5) {
                        System.out.println("\n... và " + (bookings.size() - 5) + " booking khác");
                    }
                }
                
                // Kiểm tra tính toàn vẹn dữ liệu
               
            } else {
                System.out.println("❌ Lỗi: Hàm getAllBookings() trả về null");
            }
            
        } catch (Exception e) {
            System.out.println("❌ Lỗi khi test hàm getAllBookings(): " + e.getMessage());
            e.printStackTrace();
        }
    }
    }

