/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.RoomStatus;
import Models.RoomType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RoomTypeDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<RoomType> getAllRoomType() {
        List<RoomType> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) [RoomTypeID]\n"
                + "      ,[RoomTypeName]\n"
                + "      ,[NumBeds]\n"
                + "      ,[ImagePath]\n"
                + "  FROM [HotelManagement].[dbo].[RoomType]";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                RoomType r = new RoomType();
                r.setRoomTypeID(rs.getInt(1));
                r.setRoomTypeName(rs.getString(2));
                r.setNumBeds(rs.getInt(3));
                r.setImagePath(rs.getString(4));
                list.add(r);

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
