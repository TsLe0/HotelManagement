package Controller;

import DAO.RoomTypeDAO;
import DAO.RoomsDAO;
import Models.Room; 
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateRoomServlet extends HttpServlet {

    RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
    RoomsDAO dao = new RoomsDAO();
    Room room;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomNumber = request.getParameter("roomNumber");

        try {
            room = dao.getRoomById(roomNumber);
            request.setAttribute("room", room);
            request.setAttribute("roomTypeList", roomTypeDAO.getAllRoomType());

            request.getRequestDispatcher("updateRoom.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading room data: " + e.getMessage());
            request.getRequestDispatcher("adminroom").forward(request, response); 
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomNumber = request.getParameter("roomNumber");
        String roomTypeID = request.getParameter("roomTypeID"); // Now use String directly
        String roomStatus = request.getParameter("roomStatus");

        try {
            // No need to parse roomTypeID since it's a String
            Room roomToUpdate = new Room();
            roomToUpdate.setRoomNumber(roomNumber);
            roomToUpdate.setRoomTypeID(roomTypeID); // Set String
            roomToUpdate.setRoomStatus(roomStatus);

            dao.updateRoom(roomToUpdate);

            request.setAttribute("message", "Room " + roomNumber + " updated successfully!");
            response.sendRedirect("adminroom"); // Redirect to the room management page
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while updating the room: " + e.getMessage());
            request.getRequestDispatcher("updateRoom.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
