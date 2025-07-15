/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Room;
import Models.RoomType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RoomsDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private Room extractRoomFromResultSet(ResultSet rs) throws SQLException {
        Room room = new Room();
        room.setRoomNumber(rs.getString("RoomNumber"));
        room.setRoomStatus(rs.getString("RoomStatus"));
        room.setRoomTypeID(rs.getString("RoomTypeID"));

        RoomType roomType = new RoomType();
        roomType.setRoomTypeID(rs.getString("RoomTypeID"));
    
        room.setRoomType(roomType);
        return room;
    }

    public List<Room> getAllRoom() {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT r.RoomNumber, r.RoomStatus, r.RoomTypeID "
                   + "FROM Room r";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
            while (rs.next()) {
                Room room = new Room();
            room.setRoomNumber(rs.getString("RoomNumber"));
            room.setRoomStatus(rs.getString("RoomStatus"));

            String roomTypeId = rs.getString("RoomTypeID");
            room.setRoomTypeID(roomTypeId);
            room.setRoomType(roomTypeDAO.getRoomTypeById(roomTypeId));
            
            list.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Room> getActiveRoom() {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT r.RoomNumber, r.RoomStatus, r.RoomTypeID "
                   + "FROM Room r WHERE r.RoomStatus = 'Active'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
            while (rs.next()) {
                Room room = new Room();
            room.setRoomNumber(rs.getString("RoomNumber"));
            room.setRoomStatus(rs.getString("RoomStatus"));

            String roomTypeId = rs.getString("RoomTypeID");
            room.setRoomTypeID(roomTypeId);
            room.setRoomType(roomTypeDAO.getRoomTypeById(roomTypeId));
            
            list.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addRoom(Room room) {
        String sql = "INSERT INTO Room (RoomNumber, RoomTypeID, RoomStatus) VALUES (?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, room.getRoomNumber());
            ps.setString(2, room.getRoomTypeID());
            ps.setString(3, room.getRoomStatus());
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void updateRoom(Room room) {
        String sql = "UPDATE Room SET RoomTypeID = ?, RoomStatus = ? WHERE RoomNumber = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, room.getRoomTypeID());
            ps.setString(2, room.getRoomStatus());
            ps.setString(3, room.getRoomNumber());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("con moa may");
            e.printStackTrace();
        }
    }

    public Room getRoomById(String roomNumber) {
        String sql = "SELECT r.RoomNumber, r.RoomStatus, r.RoomTypeID "
                   + "FROM Room r JOIN RoomType rt ON r.RoomTypeID = rt.RoomTypeID "
                   + "WHERE r.RoomNumber = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, roomNumber);
            rs = ps.executeQuery();
            if (rs.next()) {
                Room room = new Room();
                room.setRoomNumber(rs.getString("RoomNumber"));
                room.setRoomStatus(rs.getString("RoomStatus"));
                String roomTypeId = rs.getString("RoomTypeID");
                room.setRoomTypeID(roomTypeId);
                RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
                room.setRoomType(roomTypeDAO.getRoomTypeById(roomTypeId));
                return room;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean disableRoom(String roomNumber) {
    Room room = getRoomById(roomNumber);

    if (room == null) {
        System.out.println("Không tìm thấy phòng: " + roomNumber);
        return false;
    }

    if ("Đang sử dụng".equalsIgnoreCase(room.getRoomStatus())) {
        System.out.println("Không thể vô hiệu hóa phòng đang được sử dụng: " + roomNumber);
        return false;
    }

    String sql = "UPDATE Room SET RoomStatus = N'Vô hiệu hóa' WHERE RoomNumber = ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(sql);
        ps.setString(1, roomNumber);
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    } finally {
    }
}

    
    public List<Room> getRoomsByTypeId(String roomTypeId) {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT r.RoomNumber, r.RoomStatus, r.RoomTypeID "
                   + "FROM Room r "
                   + "WHERE r.RoomTypeID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, roomTypeId);
            rs = ps.executeQuery();
            RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
            while (rs.next()) {
                Room room = new Room();
                room.setRoomNumber(rs.getString("RoomNumber"));
                room.setRoomStatus(rs.getString("RoomStatus"));
                room.setRoomTypeID(roomTypeId);
                room.setRoomType(roomTypeDAO.getRoomTypeById(roomTypeId));
                list.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
