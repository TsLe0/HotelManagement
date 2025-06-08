/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.RoomType;
import Models.Room;
import Models.RoomImage;
import Models.RoomStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
}
