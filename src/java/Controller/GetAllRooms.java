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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "GetAllRooms", urlPatterns = {"/getallrooms"})
public class GetAllRooms extends HttpServlet {
    
    RoomsDAO dao = new RoomsDAO();
    RoomTypeDAO typeDao = new RoomTypeDAO();
    RoomImageDAO imageDAO = new RoomImageDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pageStr = request.getParameter("page");
        String searchQuery = request.getParameter("search");
        String sort = request.getParameter("sort");
        String roomTypeFilter = request.getParameter("roomType");

        int page = (pageStr == null) ? 1 : Integer.parseInt(pageStr);
        int pageSize = 3; // Number of rooms per page

        if (sort == null || sort.trim().isEmpty()) {
            sort = "default";
        }
        if (roomTypeFilter == null || roomTypeFilter.trim().isEmpty()) {
            roomTypeFilter = "all";
        }

        int totalRooms;
        List<RoomType> tList;

        // Get all room types for the filter dropdown
        List<RoomType> allRoomTypes = typeDao.getAllActiveRoomTypes();

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            totalRooms = typeDao.countSearchedActiveRoomTypes(searchQuery);
            tList = typeDao.searchActiveRoomTypesByName(searchQuery, page, pageSize, sort);
        } else {
            // Use the new methods that accept a filter
            totalRooms = typeDao.countActiveRoomTypes(roomTypeFilter);
            tList = typeDao.getActiveRoomTypes(page, pageSize, sort, roomTypeFilter);
        }

        int totalPages = (int) Math.ceil((double) totalRooms / pageSize);
        List<List<RoomImage>> iList = new ArrayList<>();

        for (RoomType r : tList) {
            iList.add(imageDAO.getAllRoomImageByRoomTypeId(r.getRoomTypeID()));
        }

        request.setAttribute("iList", iList);
        request.setAttribute("tList", tList);
        request.setAttribute("allRoomTypes", allRoomTypes); // For the filter dropdown
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("sort", sort);
        request.setAttribute("selectedRoomType", roomTypeFilter); // To keep filter state
        request.getRequestDispatcher("room.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
