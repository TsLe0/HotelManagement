package Controller;

import DAO.BookingDAO;
import Models.Booking;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "BookingHistoryDetailServlet", urlPatterns = {"/booking-history-detail"})
public class BookingHistoryDetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        // 1. Check if user is logged in
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String bookingIdStr = request.getParameter("bookingId");
        if (bookingIdStr == null || bookingIdStr.isEmpty()) {
            response.sendRedirect("bookingHistory?error=InvalidRequest");
            return;
        }

        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            BookingDAO bookingDAO = new BookingDAO();
            Booking booking = bookingDAO.getById(bookingId);

            // 2. Check if booking exists and belongs to the current user
            if (booking != null && booking.getUserId() == user.getId()) {
                request.setAttribute("booking", booking);
                request.getRequestDispatcher("bookingHistoryDetail.jsp").forward(request, response);
            } else {
                // Booking not found or does not belong to the user
                response.sendRedirect("bookingHistory?error=AccessDenied");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("bookingHistory?error=InvalidId");
        }
    }
}
