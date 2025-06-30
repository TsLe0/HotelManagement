package Controller;

import DAO.BookingDAO;
import DAO.RoomTypeDAO;
import Models.Booking;
import Models.RoomType;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

@WebServlet(name = "ConfirmBookingServlet", urlPatterns = {"/confirmBooking"})
public class ConfirmBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        // 1. Check login
        if (user == null) {
            response.sendRedirect("login.jsp?error=Please login to book a room.");
            return;
        }

        try {
            // 2. Get and validate parameters
            int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
            String roomNumber = request.getParameter("roomNumber"); 
            String fullName = request.getParameter("fullName"); 
            String phone = request.getParameter("phone"); 
            LocalDate checkinDate = LocalDate.parse(request.getParameter("checkin"));
            LocalDate checkoutDate = LocalDate.parse(request.getParameter("checkout"));
            String specialRequests = request.getParameter("specialRequests");

            // 3. Validate ngày
            if (checkinDate.isBefore(LocalDate.now())) {
                request.setAttribute("error", "Ngày nhận phòng không được ở quá khứ.");
                request.getRequestDispatcher("roomDetail?roomTypeId=" + roomTypeId).forward(request, response);
                return;
            }
            if (!checkoutDate.isAfter(checkinDate)) {
                request.setAttribute("error", "Ngày trả phòng phải sau ngày nhận phòng.");
                request.getRequestDispatcher("roomDetail?roomTypeId=" + roomTypeId).forward(request, response);
                return;
            }

            // 4. Lấy roomType và tính số ngày
            RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
            RoomType roomType = roomTypeDAO.getRoomTypeById(roomTypeId);

            if (roomType == null) {
                request.setAttribute("error", "Không tìm thấy loại phòng.");
                request.getRequestDispatcher("roomDetail?roomTypeId=" + roomTypeId).forward(request, response);
                return;
            }

            long days = java.time.temporal.ChronoUnit.DAYS.between(checkinDate, checkoutDate);
            if (days <= 0) days = 1; // Tối thiểu 1 đêm

            double totalPrice = days * roomType.getRoomTypePrice();

            // 5. Tạo booking
            Booking booking = new Booking();
            booking.setUserId(user.getId());
            booking.setRoomTypeId(roomTypeId);
            booking.setRoomNumber(roomNumber);
            booking.setCheckinDate(Date.valueOf(checkinDate));
            booking.setCheckoutDate(Date.valueOf(checkoutDate));
            booking.setTotalPrice(totalPrice);
            booking.setStatus("Pending");
            booking.setBookingDate(new Date(System.currentTimeMillis()));
            booking.setSpecialRequests(specialRequests);
            booking.setCustomerPhoneNumber(phone);
            booking.setCustomerName(fullName);

            // 6. Lưu booking
            BookingDAO bookingDAO = new BookingDAO();
            int newBookingId = bookingDAO.addBooking(booking);

            if (newBookingId != -1 ) {
                response.sendRedirect("booking-result?bookingId=" + newBookingId);
            } else {
                request.setAttribute("error", "Đặt phòng thất bại. Vui lòng thử lại.");
                request.getRequestDispatcher("roombooking.jsp").forward(request, response);
            }

        } catch (NumberFormatException | DateTimeParseException e) {
            request.setAttribute("error", "Dữ liệu đầu vào không hợp lệ.");
            request.getRequestDispatcher("roombooking.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống khi đặt phòng.");
            request.getRequestDispatcher("roombooking.jsp").forward(request, response);
        }
}
}
