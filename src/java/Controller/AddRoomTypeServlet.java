package Controller;

import DAO.RoomTypeDAO;
import Models.RoomType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class AddRoomTypeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng đến trang form nhập liệu
        request.getRequestDispatcher("addRoomType.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("roomTypeID").trim();
        String name = request.getParameter("roomTypeName").trim();
        double price = Double.parseDouble(request.getParameter("roomTypePrice"));
        String desc = request.getParameter("roomDec");
        double area = Double.parseDouble(request.getParameter("roomArea"));
        int numBeds = Integer.parseInt(request.getParameter("numBeds"));
        String status = request.getParameter("roomTypeStatus");
        HttpSession session = request.getSession();
        
        if (id.isEmpty()) {
            request.setAttribute("error", "Mã hạng phòng không được để trống hoặc chỉ chứa khoảng trắng.");
            request.getRequestDispatcher("addRoomType.jsp").forward(request, response);
            return;
        }

        if (name.isEmpty()) {
            request.setAttribute("error", "Tên hạng phòng không được để trống hoặc chỉ chứa khoảng trắng.");
            request.getRequestDispatcher("addRoomType.jsp").forward(request, response);
            return;
        }

        if (id.length() > 6) {
            request.setAttribute("error", "Mã hạng phòng không được vượt quá 6 ký tự.");
            request.getRequestDispatcher("addRoomType.jsp").forward(request, response);
            return;
        }

        if (name.length() > 50) {
            request.setAttribute("error", "Tên hạng phòng không được vượt quá 50 ký tự.");
            request.getRequestDispatcher("addRoomType.jsp").forward(request, response);
            return;
        }
        
        RoomType roomType = new RoomType();
        roomType.setRoomTypeID(id);
        roomType.setRoomTypeName(name);
        roomType.setRoomTypePrice(price);
        roomType.setRoomDec(desc);
        roomType.setRoomArea(area);
        roomType.setNumBeds(numBeds);
        roomType.setRoomTypeStatus(status);

        RoomTypeDAO dao = new RoomTypeDAO();

        if (dao.existsRoomTypeId(id)) {
            request.setAttribute("error", "ID loại phòng đã tồn tại. Vui lòng chọn ID khác.");
            request.setAttribute("roomType", roomType);
            request.getRequestDispatcher("addRoomType.jsp").forward(request, response);
            return;
        }

        boolean success = dao.addRoomType(roomType);

        if (success) {
            session.setAttribute("message", "Thêm thành công.");
            response.sendRedirect("admin-room-type");
        } else {
            session.setAttribute("errorMessage", "Thêm loại phòng thất bại.");
            request.setAttribute("roomType", roomType);
            request.getRequestDispatcher("addRoomType.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet thêm RoomType";
    }
}
