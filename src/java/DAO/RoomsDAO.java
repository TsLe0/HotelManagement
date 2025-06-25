/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.RoomType;
import Models.Room;
import Models.RoomStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RoomsDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Room> getAllRoom() {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    r.RoomNumber, r.RoomTypeID, r.RoomStatusID, r.RoomDesc, r.RoomPrice, \n"
                + "    t.RoomTypeName, t.NumBeds, t.ImagePath,\n"
                + "    s.RoomStatusName\n"
                + "FROM Room r\n"
                + "left JOIN RoomType t ON t.RoomTypeID = r.RoomTypeID\n"
                + "left JOIN RoomStatus s ON s.RoomStatusID = r.RoomStatusID";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setRoomNumber(rs.getString(1));
                room.setRoomTypeID(rs.getInt(2));
                room.setRoomStatusID(rs.getInt(3));
                room.setRoomDesc(rs.getString(4));
                room.setRoomPrice(rs.getDouble(5));

                RoomType roomtype = new RoomType();
                roomtype.setRoomTypeID(rs.getInt(2));
                roomtype.setRoomTypeName(rs.getString(6));
                roomtype.setNumBeds(rs.getInt(7));
                roomtype.setImagePath(rs.getString(8));

                room.setRoomType(roomtype);

                RoomStatus roomStatus = new RoomStatus();
                roomStatus.setRoomStatusID(rs.getInt(3));
                roomStatus.setRoomStatusName(rs.getString(9));

                room.setRoomStatus(roomStatus);

                list.add(room);

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public void addRooms(String roomNumber, int roomTypeId, int statusId, String roomDesc, double roomPrice) {
        String sql = "INSERT INTO Room (RoomNumber, RoomTypeID, RoomStatusID, RoomDesc, RoomPrice) "
                + "VALUES (?, ?, ?, ?, ?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, roomNumber);
            ps.setInt(2, roomTypeId);
            ps.setInt(3, statusId);
            ps.setString(4, roomDesc);
            ps.setDouble(5, roomPrice);
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public void updateRoom(String roomNumber, int roomTypeId, int statusId, String roomDesc, double roomPrice) {
        String sql = "UPDATE Room SET RoomTypeID = ?, RoomStatusID = ?, RoomDesc = ?, RoomPrice = ? WHERE RoomNumber = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, roomTypeId);
            ps.setInt(2, statusId);
            ps.setString(3, roomDesc);
            ps.setDouble(4, roomPrice);
            ps.setString(5, roomNumber);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Room " + roomNumber + " updated successfully!");
            } else {
                System.out.println("No room found with the given RoomNumber: " + roomNumber);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Room getRoomById(String roomNumber) {
        String sql = "SELECT \n"
                + "    r.RoomNumber, r.RoomTypeID, r.RoomStatusID, r.RoomDesc, r.RoomPrice, \n"
                + "    t.RoomTypeName, t.NumBeds, t.ImagePath,\n"
                + "    s.RoomStatusName\n"
                + "FROM Room r\n"
                + "LEFT JOIN RoomType t ON t.RoomTypeID = r.RoomTypeID\n"
                + "LEFT JOIN RoomStatus s ON s.RoomStatusID = r.RoomStatusID\n"
                + "WHERE r.RoomNumber = ?";

        Room room = null;

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, roomNumber);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    room = new Room();
                    room.setRoomNumber(rs.getString(1));
                    room.setRoomTypeID(rs.getInt(2));
                    room.setRoomStatusID(rs.getInt(3));
                    room.setRoomDesc(rs.getString(4));
                    room.setRoomPrice(rs.getDouble(5));

                    RoomType roomtype = new RoomType();
                    roomtype.setRoomTypeID(rs.getInt(2));
                    roomtype.setRoomTypeName(rs.getString(6));
                    roomtype.setNumBeds(rs.getInt(7));
                    roomtype.setImagePath(rs.getString(8));
                    room.setRoomType(roomtype);

                    RoomStatus roomStatus = new RoomStatus();
                    roomStatus.setRoomStatusID(rs.getInt(3));
                    roomStatus.setRoomStatusName(rs.getString(9));
                    room.setRoomStatus(roomStatus);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // or use logger
        }

        return room;
    }

    public void disableRoom(String roomNumber) {
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(
                "UPDATE Room SET RoomStatusID = 4 WHERE RoomNumber = ?")) {

            ps.setString(1, roomNumber);
            int rows = ps.executeUpdate();

            System.out.println((rows > 0)
                    ? "Room " + roomNumber + " disabled successfully."
                    : "No room found with RoomNumber: " + roomNumber);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
