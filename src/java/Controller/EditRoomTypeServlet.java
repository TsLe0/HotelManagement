/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.RoomTypeDAO;
import Models.RoomType;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author Admin
 */
public class EditRoomTypeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditRoomTypeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditRoomTypeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    RoomTypeDAO rtd = new RoomTypeDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("roomTypeId");
        
        RoomType rt = rtd.getRoomTypeById(id);
        
        request.setAttribute("roomType", rt);
        request.getRequestDispatcher("editRoomType.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomTypeId = request.getParameter("roomTypeId");
        String roomTypeName = request.getParameter("roomTypeName");
        double roomTypePrice = Double.parseDouble(request.getParameter("roomTypePrice"));
        String roomDec = request.getParameter("roomDec");
        double roomArea = Double.parseDouble(request.getParameter("roomArea"));
        int numBeds = Integer.parseInt(request.getParameter("numBeds"));
        String roomTypeStatus = request.getParameter("roomTypeStatus");

        RoomType rt = new RoomType();
        rt.setRoomTypeID(roomTypeId);
        rt.setRoomTypeName(roomTypeName);
        rt.setRoomTypePrice(roomTypePrice);
        rt.setRoomDec(roomDec);
        rt.setRoomArea(roomArea);
        rt.setNumBeds(numBeds);
        rt.setRoomTypeStatus(roomTypeStatus);
        
        boolean success = rtd.editRoomType(rt);
        
        if (success) {
            response.sendRedirect("admin-room-type");
        } else {
            // Handle error
            request.setAttribute("error", "Failed to update room type.");
            doGet(request, response);
        }
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
