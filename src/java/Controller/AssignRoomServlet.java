package Controller;

import DAO.BookingDAO;
import DAO.RoomTypeDAO;
import DAO.RoomsDAO;
import DAO.UserDAO;
import Models.Booking;
import Models.Room;
import Models.RoomType;
import Models.User;
import Services.EmailService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class AssignRoomServlet extends HttpServlet {

    private final BookingDAO bookingDAO = new BookingDAO();
    private final RoomsDAO roomsDAO = new RoomsDAO();
    private final RoomTypeDAO tdao = new RoomTypeDAO();
    private final UserDAO udao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingIdStr = request.getParameter("bookingId");
        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            Booking booking = bookingDAO.getById(bookingId);
            if (booking != null) {
                List<Room> availableRooms = roomsDAO.getAvailableRoomsByTypeId(booking.getRoomTypeId());
                request.setAttribute("booking", booking);
                request.setAttribute("availableRooms", availableRooms);
                request.getRequestDispatcher("/assignRoom.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("errorMessage", "Booking not found.");
                response.sendRedirect(request.getContextPath() + "/admin-booking");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("errorMessage", "Invalid Booking ID.");
            response.sendRedirect(request.getContextPath() + "/admin-booking");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));

            Booking b = bookingDAO.getById(bookingId);

            RoomType rt = tdao.getRoomTypeById(b.getRoomTypeId());
            b.setRoomType(rt);

            User user = udao.getUserById(b.getUserId());

            String roomNumber = request.getParameter("roomNumber");
            b.setRoomNumber(roomNumber);

            if (roomNumber == null || roomNumber.isEmpty()) {
                session.setAttribute("errorMessage", "You must select a room to assign.");
                response.sendRedirect(request.getContextPath() + "/assign-room?bookingId=" + bookingId);
                return;
            }
            
            if (bookingDAO.assignRoomToBooking(bookingId, roomNumber)) {
                // Also update the room's status to 'In Use'
                roomsDAO.updateRoomStatus(roomNumber, "Đang sử dụng");
                EmailService.sendBookingConfirmation(user, b);
                session.setAttribute("successMessage", "Room " + roomNumber + " assigned to booking #" + bookingId + " and status updated.");
            } else {
                session.setAttribute("errorMessage", "Failed to assign room.");
            }
        } catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "Invalid data provided.");
        }
        response.sendRedirect(request.getContextPath() + "/admin-booking");
    }
}
