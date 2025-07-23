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
            response.sendRedirect("booking-history");
            return;
        }

        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            BookingDAO bookingDAO = new BookingDAO();
            
            // Optional: Check if the booking actually belongs to the user
            Booking booking = bookingDAO.getById(bookingId);
            if (booking == null || booking.getUserId() != user.getId()) {
                // Security check: prevent users from cancelling bookings of others
                response.sendRedirect("booking-history");
                return;
            }

            // Proceed with cancellation only if the status is "Pending"
            if ("Pending".equalsIgnoreCase(booking.getStatus())) {
                boolean success = bookingDAO.updateBookingStatus(bookingId, "Cancelled");
                
                // If a room was assigned, make it available again.
                // Note: Usually, "Pending" bookings might not have a room number assigned yet.
                // This is a safeguard.
                if (success && booking.getRoomNumber() != null && !booking.getRoomNumber().isEmpty()) {
                    RoomsDAO roomsDAO = new RoomsDAO();
                    roomsDAO.updateRoomStatus(booking.getRoomNumber(), "Available");
                }
            }
            
            response.sendRedirect("booking-history");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("booking-history");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles booking cancellation requests.";
    }
}
