/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.RoomTypeDAO;
import DAO.RoomsDAO;
import DAO.StatusDAO;
import Models.Room;
import Models.RoomStatus;
import Models.RoomType;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Admin
 */
public class AddRoomServlet extends HttpServlet {

    StatusDAO statusDao = new StatusDAO();
    RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
    RoomsDAO dao = new RoomsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<RoomStatus> statusList = statusDao.getAllStatuses();
        List<RoomType> roomTypeList = roomTypeDAO.getAllTypes();

        request.setAttribute("statusList", statusList);
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
        String roomDesc = request.getParameter("roomDesc");
        double price = Double.parseDouble(request.getParameter("price"));
        int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
        int statusId = Integer.parseInt(request.getParameter("roomStatusId"));
        
        HttpSession session = request.getSession();
        
        if (!roomNumber.isEmpty()){
            for(Room r: dao.getAllRoom()){
                if (r.getRoomNumber().equalsIgnoreCase(roomNumber)){
                    session.setAttribute("addRoomError", "Room number already existed.");
                    response.sendRedirect("add-room");
                    return;
                }
            }
        }

        dao.addRooms(roomNumber, roomTypeId, statusId, roomDesc, price);

        response.sendRedirect("adminroom");
    }

}
