package Controller;

import DAO.BookingDAO;
import DAO.RoomTypeDAO;
import DAO.RoomsDAO;
import Models.Booking;
import Models.Room;
import Models.RoomType;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class AdminBookingDetailServlet extends HttpServlet {

    private final BookingDAO bookingDAO = new BookingDAO();
    private final RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
    private final RoomsDAO roomsDAO = new RoomsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String bookingIdStr = request.getParameter("bookingId");

        if (bookingIdStr != null && !bookingIdStr.isEmpty()) {
            try {
                int bookingId = Integer.parseInt(bookingIdStr);
                Booking booking = bookingDAO.getById(bookingId);

                if (booking != null) {
                    RoomType roomType = roomTypeDAO.getRoomTypeById(booking.getRoomTypeId());
                    List<Room> availableRooms = roomsDAO.getAvailableRoomsByTypeId(booking.getRoomTypeId());

                    request.setAttribute("booking", booking);
                    request.setAttribute("roomType", roomType);
                    request.setAttribute("availableRooms", availableRooms);
                    request.getRequestDispatcher("/adminBookingDetail.jsp").forward(request, response);
                } else {
                    sendError(request, response, "Booking not found.");
                }
            } catch (NumberFormatException e) {
                sendError(request, response, "Invalid Booking ID format.");
            }
        } else {
            sendError(request, response, "Booking ID is required.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("cancel".equals(action)) {
            try {
                int bookingId = Integer.parseInt(request.getParameter("bookingId"));
                if (bookingDAO.updateBookingStatus(bookingId, "Cancelled")) {
                    session.setAttribute("successMessage", "Booking #" + bookingId + " has been cancelled.");
                } else {
                    session.setAttribute("errorMessage", "Failed to cancel booking #" + bookingId + ".");
                }
            } catch (NumberFormatException e) {
                session.setAttribute("errorMessage", "Invalid Booking ID.");
            }
        }
        
        response.sendRedirect(request.getContextPath() + "/admin-booking");
    }

    private void sendError(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", message);
        request.getRequestDispatcher("/bookingManagement.jsp").forward(request, response);
    }
}
