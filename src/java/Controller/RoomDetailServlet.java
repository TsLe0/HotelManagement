package Controller;

import DAO.RoomImageDAO;
import DAO.RoomTypeDAO;
import DAO.RoomsDAO;
import Models.Room;
import Models.RoomImage;
import Models.RoomType;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.List;

public class RoomDetailServlet extends HttpServlet {

    RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
    RoomsDAO roomsDAO = new RoomsDAO();
    RoomImageDAO roomImageDAO = new RoomImageDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String roomTypeId = request.getParameter("roomTypeId");
        String checkinDate = request.getParameter("checkin");
        String checkoutDate = request.getParameter("checkout");

        try {
            RoomType roomType = roomTypeDAO.getRoomTypeById(roomTypeId); // String version

            if (roomType == null) {
                response.sendRedirect("home.jsp?error=Room+not+found");
                return;
            }

            List<Room> rooms = roomsDAO.getRoomsByTypeId(roomTypeId); // String version
            List<RoomImage> roomImages = roomImageDAO.getAllRoomImageByRoomTypeId(roomTypeId); // String version

            request.setAttribute("roomType", roomType);
            request.setAttribute("rooms", rooms);
            request.setAttribute("iList", roomImages);
            request.setAttribute("checkin", checkinDate);
            request.setAttribute("checkout", checkoutDate);

            System.out.println(roomType);

            request.getRequestDispatcher("roomDetail.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("home.jsp?error=Invalid+RoomTypeId");
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
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        System.out.println("Booking session ID: " + session.getId());

        if (user == null) {
            session.setAttribute("originalURL", request.getRequestURI() + "?" + request.getQueryString());
            response.sendRedirect("login.jsp?error=Please login to book a room.");
            return;
        }

        String roomTypeId = request.getParameter("roomTypeId");
        String checkinRaw = request.getParameter("checkin");
        String checkoutRaw = request.getParameter("checkout");
        String guestsRaw = request.getParameter("guests");

        try {
            LocalDate checkinDate = LocalDate.parse(checkinRaw);
            LocalDate checkoutDate = LocalDate.parse(checkoutRaw);
            int guests = Integer.parseInt(guestsRaw);

            if (checkinDate.isBefore(LocalDate.now())) {
                request.setAttribute("error", "Check-in date cannot be in the past.");
                processRequest(request, response);
                return;
            }
            if (!checkoutDate.isAfter(checkinDate)) {
                request.setAttribute("error", "Check-out date must be after the check-in date.");
                processRequest(request, response);
                return;
            }

            RoomType roomType = roomTypeDAO.getRoomTypeById(roomTypeId); // String version
            List<RoomImage> roomImages = roomImageDAO.getAllRoomImageByRoomTypeId(roomTypeId); // String version

            long nights = ChronoUnit.DAYS.between(checkinDate, checkoutDate);
            double totalPrice = nights * roomType.getRoomTypePrice();

            request.setAttribute("roomType", roomType);
            request.setAttribute("roomImages", roomImages);
            request.setAttribute("checkin", checkinDate);
            request.setAttribute("checkout", checkoutDate);
            request.setAttribute("guests", guests);
            request.setAttribute("nights", nights);
            request.setAttribute("totalPrice", totalPrice);

            request.getRequestDispatcher("roombooking.jsp").forward(request, response);

        } catch (NumberFormatException | DateTimeParseException e) {
            response.sendRedirect("home");
        }
    }
}
