/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BookingDAO;
import DAO.RoomsDAO;
import Models.Booking;
import Models.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ChangeRoom extends HttpServlet {

    private final BookingDAO bookingDAO = new BookingDAO();
    private final RoomsDAO roomsDAO = new RoomsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingIdStr = request.getParameter("bookingId");
        if (bookingIdStr != null) {
            int bookingId = Integer.parseInt(bookingIdStr);
            Booking booking = bookingDAO.getById(bookingId);
            java.sql.Date checkIn = booking.getCheckinDate();
                    java.sql.Date checkOut = booking.getCheckoutDate();

                    // Lấy danh sách phòng trống từ DAO
                    List<Room> availableRooms = roomsDAO.getAvailableRoomsByTypeId(
                            String.valueOf(booking.getRoomTypeId()), checkIn, checkOut
                    );

            request.setAttribute("booking", booking);
            request.setAttribute("availableRooms", availableRooms);
            request.getRequestDispatcher("/changeRoom.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin-booking");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String newRoomNumber = request.getParameter("newRoomNumber");
            String oldRoomNumber = request.getParameter("oldRoomNumber");

            if (bookingDAO.updateBookingRoom(bookingId, newRoomNumber)) {
                roomsDAO.updateRoomStatus(oldRoomNumber, "Trống");
                roomsDAO.updateRoomStatus(newRoomNumber, "Đang sử dụng");
                session.setAttribute("successMessage", "Room for booking #" + bookingId + " has been changed to " + newRoomNumber + ".");
            } else {
                session.setAttribute("errorMessage", "Failed to change room for booking #" + bookingId + ".");
            }
        } catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "Invalid input.");
        }
        response.sendRedirect(request.getContextPath() + "/admin-booking");
    }

}
