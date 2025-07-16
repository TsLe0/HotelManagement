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
            session.setAttribute("bookingRequest", request.getParameterMap());
            session.setAttribute("originalURL", request.getRequestURI() + "?" + request.getQueryString());
            response.sendRedirect("login.jsp?error=Please login to book a room.");
            return;
        }

        String roomTypeId = request.getParameter("roomTypeId"); // Now using String
        String checkinRaw = request.getParameter("checkin");
        String checkoutRaw = request.getParameter("checkout");

        try {
            // 2. Parse and validate dates
            LocalDate checkinDate = LocalDate.parse(checkinRaw);
            LocalDate checkoutDate = LocalDate.parse(checkoutRaw);
            int nights = (int) ChronoUnit.DAYS.between(checkinDate, checkoutDate);

            // 3. Validation
            if (checkinDate.isBefore(LocalDate.now())) {
                request.setAttribute("error", "Check-in date cannot be in the past.");
                request.getRequestDispatcher("roomDetail?roomTypeId=" + roomTypeId).forward(request, response);
                return;
            }
            if (!checkoutDate.isAfter(checkinDate)) {
                request.setAttribute("error", "Check-out date must be after the check-in date.");
                request.getRequestDispatcher("roomDetail?roomTypeId=" + roomTypeId).forward(request, response);
                return;
            }

            // 4. Fetch room data
            RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
            RoomType roomType = roomTypeDAO.getRoomTypeById(roomTypeId); // Pass String

            RoomImageDAO roomImageDAO = new RoomImageDAO();
            List<RoomImage> roomImages = roomImageDAO.getAllRoomImageByRoomTypeId(roomTypeId); // Pass String

            // 5. Set data for view
            request.setAttribute("roomType", roomType);
            request.setAttribute("roomImages", roomImages);
            request.setAttribute("checkin", checkinDate);
            request.setAttribute("checkout", checkoutDate);
            request.setAttribute("nights", nights);
            request.setAttribute("total", nights * roomType.getRoomTypePrice());

            request.getRequestDispatcher("roombooking.jsp").forward(request, response);

        } catch (DateTimeParseException e) {
            System.out.println(e.getMessage());
            response.sendRedirect("home");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home");
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
