package DAO;

import Models.Booking;
import Models.RoomType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;

public class BookingDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Thêm booking mới
    public int addBooking(Booking booking) {
        String sql = "INSERT INTO Bookings (UserID, RoomTypeID, RoomNumber, CheckInDate, CheckOutDate, NumberOfGuests, TotalPrice, Status, BookingDate,"
                + " SpecialRequests, CustomerName, CustomerPhoneNumber) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = connection; PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, booking.getUserId());
            ps.setInt(2, booking.getRoomTypeId());
            ps.setString(3, booking.getRoomNumber());
            ps.setDate(4, booking.getCheckinDate());
            ps.setDate(5, booking.getCheckoutDate());
            ps.setInt(6, booking.getNumberOfGuests());
            ps.setDouble(7, booking.getTotalPrice());
            ps.setString(8, booking.getStatus());
            ps.setDate(9, booking.getBookingDate());
            ps.setString(10, booking.getSpecialRequests());
            ps.setString(11, booking.getCustomerName());
            ps.setString(12, booking.getCustomerPhoneNumber());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1); // Trả về BookingID vừa tạo
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; 
    }

    // Lấy danh sách tất cả các booking
    public List<Booking> getAllBookings() {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT BookingID, UserID, RoomTypeID, RoomNumber, CheckInDate, CheckOutDate, NumberOfGuests, TotalPrice, Status, BookingDate, SpecialRequests FROM Bookings";

        try (Connection conn = connection; PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingId(rs.getInt("BookingID"));
                b.setUserId(rs.getInt("UserID"));
                b.setRoomTypeId(rs.getInt("RoomTypeID"));
                b.setRoomNumber(rs.getString("RoomNumber"));
                b.setCheckinDate(rs.getDate("CheckInDate"));
                b.setCheckoutDate(rs.getDate("CheckOutDate"));
                b.setNumberOfGuests(rs.getInt("NumberOfGuests"));
                b.setTotalPrice(rs.getDouble("TotalPrice"));
                b.setStatus(rs.getString("Status"));
                b.setBookingDate(rs.getDate("BookingDate"));
                b.setSpecialRequests(rs.getString("SpecialRequests"));
                list.add(b);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public Booking getById(int bookingId) {
        String sql = "SELECT * FROM [HotelManagement].[dbo].[Bookings]\n"
                + "WHERE BookingID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bookingId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingId(rs.getInt(1));
                b.setUserId(rs.getInt(2));
                b.setRoomTypeId(rs.getInt(3));
                b.setRoomNumber(rs.getString(4));
                b.setCheckinDate(rs.getDate(5));
                b.setCheckoutDate(rs.getDate(6));
                b.setNumberOfGuests(rs.getInt(7));
                b.setTotalPrice(rs.getDouble(8));
                b.setStatus(rs.getString(9));
                b.setBookingDate(rs.getDate(10));
                b.setSpecialRequests(rs.getString(11));
                b.setCustomerName(rs.getString(12));
                b.setCustomerPhoneNumber(rs.getString(13));

                return b;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
