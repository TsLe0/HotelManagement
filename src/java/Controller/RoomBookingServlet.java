package Controller;

import DAO.RoomImageDAO;
import DAO.RoomTypeDAO;
import Models.RoomImage;
import Models.RoomType;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Year;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.List;

@WebServlet(name = "RoomBookingServlet", urlPatterns = {"/roombooking"})
public class RoomBookingServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        // 1. Check if user is logged in
        if (user == null) {
            // Save the booking request and redirect to login
            session.setAttribute("bookingRequest", request.getParameterMap());
            session.setAttribute("originalURL", request.getRequestURI() + "?" + request.getQueryString());
            response.sendRedirect("login.jsp?error=Please login to book a room.");
            return;
        }

        String roomTypeIdRaw = request.getParameter("roomTypeId");
        String checkinRaw = request.getParameter("checkin");
        String checkoutRaw = request.getParameter("checkout");

        try {
            // 2. Parse and validate parameters
            int roomTypeId = Integer.parseInt(roomTypeIdRaw);
            LocalDate checkinDate = LocalDate.parse(checkinRaw);
            LocalDate checkoutDate = LocalDate.parse(checkoutRaw);
            int nights = (int) ChronoUnit.DAYS.between(checkinDate, checkoutDate);

            // 3. Server-side validation
            if (checkinDate.isBefore(LocalDate.now())) {
                request.setAttribute("error", "Check-in date cannot be in the past.");
                request.getRequestDispatcher("roomDetail?roomTypeId=" + roomTypeId).forward(request, response);
                return;
            }
            if (checkoutDate.isBefore(checkinDate) || checkoutDate.isEqual(checkinDate)) {
                request.setAttribute("error", "Check-out date must be after the check-in date.");
                request.getRequestDispatcher("roomDetail?roomTypeId=" + roomTypeId).forward(request, response);
                return;
            }

            // 4. Fetch room details from DAO
            RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
            RoomType roomType = roomTypeDAO.getRoomTypeById(roomTypeId);
            
            RoomImageDAO roomImageDAO = new RoomImageDAO();
            List<RoomImage> roomImages = roomImageDAO.getAllRoomImageByRoomTypeId(roomTypeId);

            // 5. Set attributes and forward to booking confirmation page
            request.setAttribute("roomType", roomType);
            request.setAttribute("roomImages", roomImages);
            request.setAttribute("checkin", checkinDate);
            request.setAttribute("checkout", checkoutDate);
            request.setAttribute("nights", nights);
            request.setAttribute("total", nights * roomType.getRoomTypePrice());

            request.getRequestDispatcher("roombooking.jsp").forward(request, response);

        } catch (NumberFormatException | DateTimeParseException e) {
            System.out.println(e.getMessage());
            response.sendRedirect("home"); // Redirect to home on bad data
        }
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
}
