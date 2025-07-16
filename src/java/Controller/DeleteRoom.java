/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.RoomsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author Admin
 */
public class DeleteRoom extends HttpServlet {

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
            out.println("<title>Servlet DeleteRoom</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteRoom at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomNumber = request.getParameter("roomNumber");
        HttpSession session = request.getSession();

        try {
            if (roomNumber == null || roomNumber.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Mã phòng không hợp lệ.");
            } else {
                RoomsDAO dao = new RoomsDAO();
                boolean success = dao.disableRoom(roomNumber);
                if (success) {
                    session.setAttribute("message", "✅ Phòng " + roomNumber + " đã được vô hiệu hóa thành công.");
                } else {
                    session.setAttribute("errorMessage", "❌ Không thể vô hiệu hóa phòng " + roomNumber + ". Có thể đang được sử dụng hoặc không tồn tại.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "⚠️ Đã xảy ra lỗi: " + e.getMessage());
        }

        // Quay lại trang quản lý phòng
        response.sendRedirect("adminroom");
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
        processRequest(request, response);
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
