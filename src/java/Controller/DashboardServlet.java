package Controller;

import DAO.BookingDAO;
import DAO.RoomsDAO;
import Models.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class DashboardServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        RoomsDAO roomsDAO = new RoomsDAO();
        BookingDAO bookingDAO = new BookingDAO();
        
        int totalRooms = roomsDAO.getTotalRooms();
        int totalBookings = bookingDAO.getTotalBookings();
        List<Booking> recentBookings = bookingDAO.getRecentBookings(5);
        
        request.setAttribute("totalRooms", totalRooms);
        request.setAttribute("totalBookings", totalBookings);
        request.setAttribute("recentBookings", recentBookings);
        
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
