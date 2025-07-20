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

        // Lấy session hiện tại
        HttpSession session = request.getSession(false); // false: không tạo session mới nếu chưa có

        if (session == null || session.getAttribute("account") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("account");

        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> bookingHistory = bookingDAO.getBookingsByUserId(user.getId());

        request.setAttribute("bookingHistory", bookingHistory);
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
