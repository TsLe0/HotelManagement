package Controller;

import DAO.RoomTypeDAO;
import Models.RoomType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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

        // Đọc dữ liệu từ form
        String id = request.getParameter("roomTypeID");
        String name = request.getParameter("roomTypeName");
        double price = Double.parseDouble(request.getParameter("roomTypePrice"));
        String desc = request.getParameter("roomDec");
        double area = Double.parseDouble(request.getParameter("roomArea"));
        int numBeds = Integer.parseInt(request.getParameter("numBeds"));
        String status = request.getParameter("roomTypeStatus");

        // Tạo RoomType object
        RoomType roomType = new RoomType();
        roomType.setRoomTypeID(id);
        roomType.setRoomTypeName(name);
        roomType.setRoomTypePrice(price);
        roomType.setRoomDec(desc);
        roomType.setRoomArea(area);
        roomType.setNumBeds(numBeds);
        roomType.setRoomTypeStatus(status);

        // Gọi DAO để lưu vào DB
        RoomTypeDAO dao = new RoomTypeDAO();
        boolean success = dao.addRoomType(roomType);

        if (success) {
            response.sendRedirect("admin-room-type"); // chuyển tới danh sách sau khi thêm thành công
        } else {
            request.setAttribute("error", "Thêm loại phòng thất bại. Vui lòng kiểm tra lại.");
            request.getRequestDispatcher("add-room-type").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet thêm RoomType";
    }
}
