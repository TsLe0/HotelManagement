package Controller;

import DAO.RoomTypeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DisableRoomType extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Lấy roomTypeId từ request
        String roomTypeId = request.getParameter("roomTypeId");
        
        // Gọi DAO để cập nhật trạng thái
        RoomTypeDAO dao = new RoomTypeDAO();
        boolean success = dao.disableRoomType(roomTypeId);
        
        if (success) {
            // Nếu thành công, chuyển hướng về trang danh sách hoặc hiển thị thông báo
            response.sendRedirect("admin-room-type?status=disabled");
        } else {
            // Nếu thất bại, có thể redirect lại với lỗi hoặc thông báo
            response.sendRedirect("admin-room-type-list.jsp?status=error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optional: có thể xử lý GET tương tự POST nếu bạn muốn
        doPost(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to disable a room type by ID";
    }

}
