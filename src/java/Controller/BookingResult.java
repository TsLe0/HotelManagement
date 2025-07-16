/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BookingDAO;
import DAO.RoomTypeDAO;
import DAO.UserDAO;
import Models.Booking;
import Models.RoomType;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class BookingResult extends HttpServlet {
    BookingDAO bDAo = new BookingDAO();
    UserDAO uDao = new UserDAO();
    RoomTypeDAO rtDao = new RoomTypeDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingIdRaw = request.getParameter("bookingId");
        System.out.println(bookingIdRaw);
        
        int bookingId = Integer.parseInt(bookingIdRaw);
        
        Booking b = bDAo.getById(bookingId);
        
        User user = uDao.getUserById(b.getUserId());
        RoomType rt = rtDao.getRoomTypeById(b.getRoomTypeId());
        
        request.setAttribute("booking", b);
        request.setAttribute("userEmail", user.getEmail());
        request.setAttribute("roomType", rt.getRoomTypeName());
        request.getRequestDispatcher("bookingSuccess.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
