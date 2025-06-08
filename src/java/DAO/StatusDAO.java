/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Room;
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
public class StatusDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<RoomStatus> getAllStatuses() {
        List<RoomStatus> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) [RoomStatusID]\n"
                + "      ,[RoomStatusName]\n"
                + "  FROM [HotelManagement].[dbo].[RoomStatus]";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                RoomStatus r = new RoomStatus();
                r.setRoomStatusID(rs.getInt(1));
                r.setRoomStatusName(rs.getString(2));
                list.add(r);

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
