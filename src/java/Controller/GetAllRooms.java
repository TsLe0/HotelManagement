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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class GetAllRooms extends HttpServlet {
    
    RoomsDAO dao = new RoomsDAO();
    RoomTypeDAO typeDao = new RoomTypeDAO();
    RoomImageDAO imageDAO = new RoomImageDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<List<RoomImage>> iList = new ArrayList<>();
        List<RoomType> tList = typeDao.getAllRoomType();
        
        for (RoomType r : tList) {
            iList.add(imageDAO.getAllRoomImageByRoomTypeId(r.getRoomTypeID()));
        }
        request.setAttribute("iList", iList);
//        System.out.println(iList.get(0));
        request.setAttribute("tList", tList);
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
