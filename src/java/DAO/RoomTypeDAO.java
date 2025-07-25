/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

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
                + "      ,[RoomTypePrice]\n"
                + "      ,[RoomDec]\n"
                + "      ,[RoomArea]\n"
                + "      ,[NumBeds]\n"
                + "      ,[RoomTypeStatus]\n"
                + "  FROM [HotelManagement].[dbo].[RoomType]";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                RoomType r = new RoomType();
                r.setRoomTypeID(rs.getString(1));
                r.setRoomTypeName(rs.getString(2));
                r.setRoomTypePrice(rs.getDouble(3));
                r.setRoomDec(rs.getString(4));
                r.setRoomArea(rs.getDouble(5));
                r.setNumBeds(rs.getInt(6));
                r.setRoomTypeStatus(rs.getString(7));
                list.add(r);

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int countActiveRoomTypes(String roomTypeId) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM [HotelManagement].[dbo].[RoomType] WHERE [RoomTypeStatus] = N'Đang kinh doanh'");
        if (roomTypeId != null && !roomTypeId.isEmpty() && !roomTypeId.equals("all")) {
            sql.append(" AND [RoomTypeID] = ?");
        }

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql.toString());
            if (roomTypeId != null && !roomTypeId.isEmpty() && !roomTypeId.equals("all")) {
                ps.setString(1, roomTypeId);
            }
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<RoomType> getActiveRoomTypes(int page, int pageSize, String sort, String roomTypeId) {
        List<RoomType> list = new ArrayList<>();
        String orderBy;
        switch (sort) {
            case "price_asc":
                orderBy = "RoomTypePrice ASC";
                break;
            case "price_desc":
                orderBy = "RoomTypePrice DESC";
                break;
            default:
                orderBy = "RoomTypeID";
                break;
        }

        StringBuilder sql = new StringBuilder("SELECT [RoomTypeID], [RoomTypeName], [RoomTypePrice], [RoomDec], [RoomArea], [NumBeds], [RoomTypeStatus]\n")
                .append("FROM [HotelManagement].[dbo].[RoomType]\n")
                .append("WHERE [RoomTypeStatus] = N'Đang kinh doanh'\n");

        if (roomTypeId != null && !roomTypeId.isEmpty() && !roomTypeId.equals("all")) {
            sql.append(" AND [RoomTypeID] = ?\n");
        }

        sql.append("ORDER BY ").append(orderBy).append("\n")
           .append("OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;");

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql.toString());
            int paramIndex = 1;
            if (roomTypeId != null && !roomTypeId.isEmpty() && !roomTypeId.equals("all")) {
                ps.setString(paramIndex++, roomTypeId);
            }
            ps.setInt(paramIndex++, (page - 1) * pageSize);
            ps.setInt(paramIndex, pageSize);

            rs = ps.executeQuery();
            while (rs.next()) {
                RoomType r = new RoomType();
                r.setRoomTypeID(rs.getString(1));
                r.setRoomTypeName(rs.getString(2));
                r.setRoomTypePrice(rs.getDouble(3));
                r.setRoomDec(rs.getString(4));
                r.setRoomArea(rs.getDouble(5));
                r.setNumBeds(rs.getInt(6));
                r.setRoomTypeStatus(rs.getString(7));
                list.add(r);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<RoomType> getAllActiveRoomTypes() {
        List<RoomType> list = new ArrayList<>();
        String sql = "SELECT [RoomTypeID], [RoomTypeName] FROM [HotelManagement].[dbo].[RoomType] WHERE [RoomTypeStatus] = N'Đang kinh doanh' ORDER BY RoomTypeName";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                RoomType r = new RoomType();
                r.setRoomTypeID(rs.getString(1));
                r.setRoomTypeName(rs.getString(2));
                list.add(r);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int countSearchedActiveRoomTypes(String searchQuery) {
        String sql = "SELECT COUNT(*) FROM [HotelManagement].[dbo].[RoomType] WHERE [RoomTypeStatus] = N'Đang kinh doanh' AND [RoomTypeName] LIKE ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchQuery + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<RoomType> searchActiveRoomTypesByName(String searchQuery, int page, int pageSize, String sort) {
        List<RoomType> list = new ArrayList<>();
        String orderBy;
        switch (sort) {
            case "price_asc":
                orderBy = "RoomTypePrice ASC";
                break;
            case "price_desc":
                orderBy = "RoomTypePrice DESC";
                break;
            default:
                orderBy = "RoomTypeID";
                break;
        }

        String sql = "SELECT [RoomTypeID], [RoomTypeName], [RoomTypePrice], [RoomDec], [RoomArea], [NumBeds], [RoomTypeStatus]\n"
                + "FROM [HotelManagement].[dbo].[RoomType]\n"
                + "WHERE [RoomTypeStatus] = N'Đang kinh doanh' AND [RoomTypeName] LIKE ?\n"
                + "ORDER BY " + orderBy + "\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchQuery + "%");
            ps.setInt(2, (page - 1) * pageSize);
            ps.setInt(3, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                RoomType r = new RoomType();
                r.setRoomTypeID(rs.getString(1));
                r.setRoomTypeName(rs.getString(2));
                r.setRoomTypePrice(rs.getDouble(3));
                r.setRoomDec(rs.getString(4));
                r.setRoomArea(rs.getDouble(5));
                r.setNumBeds(rs.getInt(6));
                r.setRoomTypeStatus(rs.getString(7));
                list.add(r);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public RoomType getRoomTypeById(String roomTypeId) {
        String sql = "select*from RoomType\n"
                + "WHERE RoomTypeID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, roomTypeId);
            rs = ps.executeQuery();
            while (rs.next()) {
                RoomType r = new RoomType();
                r.setRoomTypeID(rs.getString(1));
                r.setRoomTypeName(rs.getString(2));
                r.setRoomTypePrice(rs.getDouble(3));
                r.setRoomDec(rs.getString(4));
                r.setRoomArea(rs.getDouble(5));
                r.setNumBeds(rs.getInt(6));
                r.setRoomTypeStatus(rs.getString(7));
                return r;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean addRoomType(RoomType roomType) {
        String sql = "INSERT INTO RoomType (RoomTypeID, RoomTypeName, RoomTypePrice, RoomDec, RoomArea, NumBeds, RoomTypeStatus) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, roomType.getRoomTypeID());
            ps.setString(2, roomType.getRoomTypeName());
            ps.setDouble(3, roomType.getRoomTypePrice());
            ps.setString(4, roomType.getRoomDec());
            ps.setDouble(5, roomType.getRoomArea());
            ps.setInt(6, roomType.getNumBeds());
            ps.setString(7, roomType.getRoomTypeStatus()); // ví dụ: "Đang kinh doanh" hoặc "Ngừng kinh doanh"

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean editRoomType(RoomType roomType) {
        String sql = "UPDATE RoomType SET RoomTypeName = ?, RoomTypePrice = ?, RoomDec = ?, "
                + "RoomArea = ?, NumBeds = ?, RoomTypeStatus = ? WHERE RoomTypeID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, roomType.getRoomTypeName());
            ps.setDouble(2, roomType.getRoomTypePrice());
            ps.setString(3, roomType.getRoomDec());
            ps.setDouble(4, roomType.getRoomArea());
            ps.setInt(5, roomType.getNumBeds());
            ps.setString(6, roomType.getRoomTypeStatus());
            ps.setString(7, roomType.getRoomTypeID());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean disableRoomType(String roomTypeId) {
        String sql = "UPDATE RoomType SET RoomTypeStatus = N'Ngừng kinh doanh' WHERE RoomTypeID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, roomTypeId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    public boolean existsRoomTypeId(String roomTypeId) {
        String sql = "SELECT 1 FROM RoomType WHERE RoomTypeID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, roomTypeId);
            rs = ps.executeQuery();
            return rs.next(); // true nếu tìm thấy
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public int getTotalRoomTypes() {
        String sql = "SELECT count(*) FROM RoomType";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
}
