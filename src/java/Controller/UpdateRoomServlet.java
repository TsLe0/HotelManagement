/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.RoomTypeDAO;
import DAO.RoomsDAO;
import Models.Room; 
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Admin
 */

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
        String roomTypeID_raw = request.getParameter("roomTypeID");
        String roomStatusID_raw = request.getParameter("roomStatusID");
        String roomDesc = request.getParameter("roomDesc");
        String roomPrice_raw = request.getParameter("roomPrice");

        try {
            int roomTypeID = Integer.parseInt(roomTypeID_raw);
            int roomStatusID = Integer.parseInt(roomStatusID_raw);
            double roomPrice = Double.parseDouble(roomPrice_raw);
            dao.updateRoom(roomNumber, roomTypeID, roomStatusID, roomDesc, roomPrice);
            request.setAttribute("message", "Room " + roomNumber + " updated successfully!");
            response.sendRedirect("adminroom"); // Redirect to the room management page
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format for Room Type ID, Room Status ID, or Room Price.");
            request.getRequestDispatcher("updateRoom.jsp").forward(request, response);
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
