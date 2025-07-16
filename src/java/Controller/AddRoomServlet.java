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
        HttpSession session = request.getSession();
        try {
            String roomNumber = request.getParameter("roomNumber");
            String roomTypeId = request.getParameter("roomTypeId");
            String roomStatus = request.getParameter("roomStatus");

            // Validate room number
            if (roomNumber == null || roomNumber.trim().isEmpty()) {
                session.setAttribute("addRoomError", "Room number cannot be empty.");
                response.sendRedirect("add-room");
                return;
            }

            if (roomNumber.length() > 6) {
                session.setAttribute("addRoomError", "Room number must not exceed 6 characters.");
                response.sendRedirect("add-room");
                return;
            }

            // Check if room number already exists
            for (Room r : dao.getAllRoom()) {
                if (r.getRoomNumber().equalsIgnoreCase(roomNumber)) {
                    session.setAttribute("addRoomError", "Room number already existed.");
                    response.sendRedirect("add-room");
                    return;
                }
            }

            // Check if RoomType is active
           RoomType selectedRoomType = roomTypeDAO.getRoomTypeById(roomTypeId);
if (selectedRoomType == null || !"Đang kinh doanh".equalsIgnoreCase(selectedRoomType.getRoomTypeStatus())) {
    session.setAttribute("addRoomError", "Selected room type is not active.");
    response.sendRedirect("add-room");
    return;
}


            // Add the new room
            Room newRoom = new Room();
            newRoom.setRoomNumber(roomNumber);
            newRoom.setRoomTypeID(roomTypeId);
            newRoom.setRoomStatus(roomStatus);

            dao.addRoom(newRoom);

            session.setAttribute("message", "Thêm thành công.");
            response.sendRedirect("adminroom");

        } catch (Exception e) {
            session.setAttribute("errorMessage", "Thêm phòng thất bại.");
            e.printStackTrace();
            response.sendRedirect("add-room");
        }
    }

}
