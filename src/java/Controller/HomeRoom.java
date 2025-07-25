/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.RoomImageDAO;
import DAO.RoomTypeDAO;
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
public class HomeRoom extends HttpServlet {

    private final RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
    private final RoomImageDAO roomImageDAO = new RoomImageDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get top 4 active room types for the featured section
        List<RoomType> featuredRoomTypes = roomTypeDAO.getActiveRoomTypes(1, 4, "default", "all");
        List<List<RoomImage>> featuredRoomImages = new ArrayList<>();

        for (RoomType rt : featuredRoomTypes) {
            featuredRoomImages.add(roomImageDAO.getAllRoomImageByRoomTypeId(rt.getRoomTypeID()));
        }

        request.setAttribute("featuredRoomTypes", featuredRoomTypes);
        request.setAttribute("featuredRoomImages", featuredRoomImages);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
