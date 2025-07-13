package Controller;

import DAO.RoomTypeDAO;
import DAO.RoomsDAO;
import Models.Room;
import Models.RoomType;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class AddRoomServlet extends HttpServlet {

    RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
    RoomsDAO dao = new RoomsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<RoomType> roomTypeList = roomTypeDAO.getAllRoomType();
        request.setAttribute("roomTypeList", roomTypeList);
        request.getRequestDispatcher("addRoom.jsp").forward(request, response);

        HttpSession session = request.getSession();
        session.removeAttribute("addRoomError");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String roomNumber = request.getParameter("roomNumber");
        String roomTypeId = request.getParameter("roomTypeId"); // Changed to String
        String roomStatus = request.getParameter("roomStatus");

        HttpSession session = request.getSession();

        if (roomNumber != null && !roomNumber.trim().isEmpty()) {
            for (Room r : dao.getAllRoom()) {
                if (r.getRoomNumber().equalsIgnoreCase(roomNumber)) {
                    session.setAttribute("addRoomError", "Room number already existed.");
                    response.sendRedirect("add-room");
                    return;
                }
            }
        } else {
            session.setAttribute("addRoomError", "Room number cannot be empty.");
            response.sendRedirect("add-room");
            return;
        }

        if (roomNumber.length() > 10) {
            session.setAttribute("addRoomError", "Room number must not exceed 10 characters.");
            response.sendRedirect("add-room");
            return;
        }

        Room newRoom = new Room();
        newRoom.setRoomNumber(roomNumber);
        newRoom.setRoomTypeID(roomTypeId); // Now a String
        newRoom.setRoomStatus(roomStatus);

        dao.addRoom(newRoom);

        response.sendRedirect("adminroom");
    }
}
