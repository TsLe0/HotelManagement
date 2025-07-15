package Controller;

import DAO.RoomImageDAO;
import DAO.RoomTypeDAO;
import DAO.RoomsDAO;
import Models.Room;
import Models.RoomImage;
import Models.RoomType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminRoomTypeDetails", urlPatterns = {"/admin-room-type-details"})
public class AdminRoomTypeDetails extends HttpServlet {

    RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
    RoomsDAO roomsDAO = new RoomsDAO();
    RoomImageDAO roomImageDAO = new RoomImageDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomTypeId = request.getParameter("roomTypeId");

        if (roomTypeId != null && !roomTypeId.isEmpty()) {
            try {
                RoomType roomType = roomTypeDAO.getRoomTypeById(roomTypeId);

                if (roomType != null) {
                    List<Room> rooms = roomsDAO.getRoomsByTypeId(roomTypeId);
                    List<RoomImage> roomImages = roomImageDAO.getAllRoomImageByRoomTypeId(roomTypeId);

                    request.setAttribute("roomType", roomType);
                    request.setAttribute("rooms", rooms);
                    request.setAttribute("iList", roomImages);

                    request.getRequestDispatcher("roomTypeDetailManagement.jsp").forward(request, response);
                } else {
                    response.sendRedirect("admin-room-type?error=Room+type+not+found");
                }
            } catch (Exception e) {
                // Log the exception and redirect
                e.printStackTrace();
                response.sendRedirect("admin-room-type?error=An+error+occurred");
            }
        } else {
            response.sendRedirect("admin-room-type?error=Invalid+Room+Type+ID");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to display details of a room type for admin.";
    }
}
