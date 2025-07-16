package Controller;

import DAO.BookingDAO;
import DAO.RoomTypeDAO;
import Models.Booking;
import Models.RoomType;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class AdminBookingDetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String bookingIdStr = request.getParameter("bookingId");

        if (bookingIdStr != null && !bookingIdStr.isEmpty()) {
            try {
                int bookingId = Integer.parseInt(bookingIdStr);
                BookingDAO bookingDAO = new BookingDAO();
                RoomTypeDAO roomTypeDAO = new RoomTypeDAO();

                Booking booking = bookingDAO.getById(bookingId);
                
                if (booking != null) {
                    RoomType roomType = roomTypeDAO.getRoomTypeById(booking.getRoomTypeId());
                    request.setAttribute("booking", booking);
                    request.setAttribute("roomType", roomType);
                    request.getRequestDispatcher("/adminBookingDetail.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Booking not found.");
                    request.getRequestDispatcher("/bookingManagement.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid Booking ID format.");
                request.getRequestDispatcher("/bookingManagement.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Booking ID is required.");
            request.getRequestDispatcher("/bookingManagement.jsp").forward(request, response);
        }
    }
}
