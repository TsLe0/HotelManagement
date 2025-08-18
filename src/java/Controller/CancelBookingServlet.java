package Controller;

import DAO.BookingDAO;
import DAO.RoomsDAO;
import Models.Booking;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class CancelBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("account");
        String bookingIdStr = request.getParameter("bookingId");

        if (bookingIdStr == null || bookingIdStr.isEmpty()) {
            // If booking ID is missing, redirect with an error message
            session.setAttribute("errorMessage", "Yêu cầu hủy phòng không hợp lệ.");
            response.sendRedirect("booking-history");
            return;
        }

        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            BookingDAO bookingDAO = new BookingDAO();
            
            // Optional: Check if the booking actually belongs to the user
            Booking booking = bookingDAO.getById(bookingId);
            if (booking == null) {
                session.setAttribute("errorMessage", "Không tìm thấy đặt phòng này.");
                response.sendRedirect("booking-history");
                return;
            }

            // Security check: prevent users from cancelling bookings of others
            if (booking.getUserId() != user.getId()) {
                session.setAttribute("errorMessage", "Bạn không có quyền hủy đặt phòng này.");
                response.sendRedirect("booking-history");
                return;
            }

            // Proceed with cancellation only if the status is "Pending" or "Confirmed"
            // You might want to allow cancellation for "Confirmed" too, depending on business rules
            if ("Pending".equalsIgnoreCase(booking.getStatus()) || "Confirmed".equalsIgnoreCase(booking.getStatus())) {
                boolean success = bookingDAO.updateBookingStatus(bookingId, "Cancelled");
                
                if (success) {
                    // If a room was assigned, make it available again.
                    // This applies if the booking was confirmed and had a room assigned.
                    if (booking.getRoomNumber() != null && !booking.getRoomNumber().isEmpty()) {
                        RoomsDAO roomsDAO = new RoomsDAO();
                        roomsDAO.updateRoomStatus(booking.getRoomNumber(), "Available");
                    }
                    // Set success message for JSP
                    session.setAttribute("cancellationMessage", "Phòng đã được hủy thành công!");
                } else {
                    // Set error message if cancellation failed at DAO level
                    session.setAttribute("errorMessage", "Không thể hủy phòng. Vui lòng thử lại.");
                }
            } else {
                // Booking is not in a cancellable state
                session.setAttribute("errorMessage", "Không thể hủy phòng có trạng thái '" + booking.getStatus() + "'.");
            }
            
            response.sendRedirect("booking-history"); // Always redirect to refresh the history page

        } catch (NumberFormatException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Mã đặt phòng không hợp lệ.");
            response.sendRedirect("booking-history");
        } catch (Exception e) { // Catch any other unexpected exceptions
            e.printStackTrace();
            session.setAttribute("errorMessage", "Đã xảy ra lỗi khi xử lý yêu cầu hủy phòng.");
            response.sendRedirect("booking-history");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles booking cancellation requests.";
    }
}