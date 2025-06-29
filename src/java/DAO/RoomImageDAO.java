/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.RoomImage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RoomImageDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<RoomImage> getAllRoomImageByRoomTypeId(int roomTypeID) {
        List<RoomImage> list = new ArrayList<>();
        String sql = "select * from RoomImage\n"
                + "where RoomTypeID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, roomTypeID);
            rs = ps.executeQuery();
            
            while (rs.next()) {

                RoomImage r = new RoomImage();
                r.setImageID(rs.getInt(1));
                r.setRoomTypeID(rs.getInt(2));
                r.setRoomImages(rs.getString(3));

                list.add(r);

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
