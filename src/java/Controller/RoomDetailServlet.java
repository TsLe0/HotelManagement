/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.RoomImageDAO;
import DAO.RoomTypeDAO;
import DAO.RoomsDAO;
import Models.Room;
import Models.RoomImage;
import Models.RoomType;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 *
 * @author Admin
 */
public class RoomDetailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String roomTypeIdRaw = request.getParameter("roomTypeId");
        try {
            int roomTypeId = Integer.parseInt(roomTypeIdRaw);
            RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
            RoomType roomType = roomTypeDAO.getRoomTypeById(roomTypeId);
            
            RoomsDAO roomsDAO = new RoomsDAO();
            List<Room> rooms = roomsDAO.getRoomsByTypeId(roomTypeId);
            
            RoomImageDAO roomImageDAO = new RoomImageDAO();
            List<RoomImage> roomImages = roomImageDAO.getAllRoomImageByRoomTypeId(roomTypeId);
            
            request.setAttribute("roomType", roomType);
            request.setAttribute("rooms", rooms);
            request.setAttribute("roomImages", roomImages);
            
            request.getRequestDispatcher("roomDetail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle error
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
