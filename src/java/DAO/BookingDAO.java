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
            ps.setString(2, booking.getRoomTypeId());
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
            System.out.println("tuanvm dm ");
            e.printStackTrace();
        }
        return -1;
    }

    // Lấy danh sách tất cả các booking
    public List<Booking> getAllBookings() {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM Bookings";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingId(rs.getInt("BookingID"));
                b.setUserId(rs.getInt("UserID"));
                b.setRoomTypeId(rs.getString("RoomTypeID"));
                b.setRoomNumber(rs.getString("RoomNumber"));
                b.setCheckinDate(rs.getDate("CheckInDate"));
                b.setCheckoutDate(rs.getDate("CheckOutDate"));
                b.setNumberOfGuests(rs.getInt("NumberOfGuests"));
                b.setTotalPrice(rs.getDouble("TotalPrice"));
                b.setStatus(rs.getString("Status"));
                b.setBookingDate(rs.getDate("BookingDate"));
                b.setSpecialRequests(rs.getString("SpecialRequests"));
                b.setCustomerName(rs.getString("CustomerName"));
                b.setCustomerPhoneNumber(rs.getString("CustomerPhoneNumber"));
                list.add(b);
            }

        } catch (Exception e) {
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
                b.setRoomTypeId(rs.getString(3));
                b.setCustomerName(rs.getString(4));
                b.setCustomerPhoneNumber(rs.getString(5));
                b.setRoomNumber(rs.getString(6));
                b.setCheckinDate(rs.getDate(7));
                b.setCheckoutDate(rs.getDate(8));
                b.setNumberOfGuests(rs.getInt(9));
                b.setTotalPrice(rs.getFloat(10));
                b.setStatus(rs.getString(11));
                b.setBookingDate(rs.getDate(12));
                b.setSpecialRequests(rs.getString(13));

                return b;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean updateBookingStatus(int bookingId, String status) {
        String sql = "UPDATE Bookings SET Status = ? WHERE BookingID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, bookingId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateBookingRoom(int bookingId, String roomNumber) {
        String sql = "UPDATE Bookings SET RoomNumber = ? WHERE BookingID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, roomNumber);
            ps.setInt(2, bookingId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean assignRoomToBooking(int bookingId, String roomNumber) {
        String sql = "UPDATE Bookings SET RoomNumber = ?, Status = 'Confirmed' WHERE BookingID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, roomNumber);
            ps.setInt(2, bookingId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getTotalBookings() {
        String sql = "SELECT COUNT(*) FROM Bookings";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Booking> getRecentBookings(int limit) {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT TOP (?) * FROM Bookings ORDER BY BookingDate DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, limit);
            rs = ps.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingId(rs.getInt("BookingID"));
                b.setUserId(rs.getInt("UserID"));
                b.setRoomTypeId(rs.getString("RoomTypeID"));
                b.setRoomNumber(rs.getString("RoomNumber"));
                b.setCheckinDate(rs.getDate("CheckInDate"));
                b.setCheckoutDate(rs.getDate("CheckOutDate"));
                b.setNumberOfGuests(rs.getInt("NumberOfGuests"));
                b.setTotalPrice(rs.getDouble("TotalPrice"));
                b.setStatus(rs.getString("Status"));
                b.setBookingDate(rs.getDate("BookingDate"));
                b.setSpecialRequests(rs.getString("SpecialRequests"));
                b.setCustomerName(rs.getString("CustomerName"));
                b.setCustomerPhoneNumber(rs.getString("CustomerPhoneNumber"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy danh sách các booking theo UserID
    public List<Booking> getBookingsByUserId(int userId) {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM Bookings WHERE UserID = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingId(rs.getInt("BookingID"));
                b.setUserId(rs.getInt("UserID"));
                b.setRoomTypeId(rs.getString("RoomTypeID"));
                b.setRoomNumber(rs.getString("RoomNumber"));
                b.setCheckinDate(rs.getDate("CheckInDate"));
                b.setCheckoutDate(rs.getDate("CheckOutDate"));
                b.setNumberOfGuests(rs.getInt("NumberOfGuests"));
                b.setTotalPrice(rs.getDouble("TotalPrice"));
                b.setStatus(rs.getString("Status"));
                b.setBookingDate(rs.getDate("BookingDate"));
                b.setSpecialRequests(rs.getString("SpecialRequests"));
                b.setCustomerName(rs.getString("CustomerName"));
                b.setCustomerPhoneNumber(rs.getString("CustomerPhoneNumber"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
