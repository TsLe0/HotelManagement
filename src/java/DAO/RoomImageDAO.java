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

    public List<RoomImage> getAllRoomImageByRoomTypeId(String roomTypeId) {
        List<RoomImage> list = new ArrayList<>();
        String sql = "select * from RoomImage\n"
                + "where RoomTypeID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, roomTypeId);
            rs = ps.executeQuery();

            while (rs.next()) {

                RoomImage r = new RoomImage();
                r.setImageID(rs.getInt(1));
                r.setRoomTypeID(rs.getString(2));
                r.setRoomImages(rs.getString(3));

                list.add(r);

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertRoomImages(String roomTypeID, List<String> imagePaths) {
        String sql = "INSERT INTO RoomImage (RoomTypeID, RoomImages) VALUES (?, ?)";
        System.out.println(imagePaths.size());
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            
            for (String path : imagePaths) {
                ps.setString(1, roomTypeID);
                ps.setString(2, path);
                ps.addBatch();
            }

            ps.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
