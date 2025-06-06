/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.RoomType;
import Models.Rooms;
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

    public List<Rooms> getAllRoom() {
        List<Rooms> list = new ArrayList<>();
        String sql = "Select * from Room r\n"
                + "join RoomType t on t.TypeID=r.TypeID";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Rooms room = new Rooms();
                room.setRoomID(rs.getInt(1));
                room.setTypeID(rs.getInt(2));
                room.setStatus(rs.getString(3));
                RoomType roomtype = new RoomType();
                roomtype.setTypeID(rs.getInt(4));
                roomtype.setName(rs.getString(5));
                roomtype.setDescription(rs.getString(6));
                roomtype.setPricePerNight(rs.getDouble(7));
                roomtype.setCapacity(rs.getInt(8));
                roomtype.setImagePath(rs.getString(9));

                room.setRoomtype(roomtype);
                list.add(room);

            }
        } catch (Exception e) {
        }
        return list;

    }
}
