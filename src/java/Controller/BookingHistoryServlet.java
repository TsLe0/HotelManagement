package Controller;

import DAO.BookingDAO;
import Models.Booking;
import Models.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BookingHistoryServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("account") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("account");
        BookingDAO bookingDAO = new BookingDAO();

        // Pagination logic
        int page = 1;
        int pageSize = 6; // 6 bookings per page
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                // Handle invalid page parameter
                page = 1;
            }
        }

        int totalBookings = bookingDAO.getBookingCountByUserId(user.getId());
        int totalPages = (int) Math.ceil((double) totalBookings / pageSize);

        // Ensure page is within valid range
        if (page > totalPages && totalPages > 0) {
            page = totalPages;
        }
        if (page < 1) {
            page = 1;
        }

        List<Booking> bookingHistory = bookingDAO.getBookingsByUserId(user.getId(), page, pageSize);

        request.setAttribute("bookingHistory", bookingHistory);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("bookingHistory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
