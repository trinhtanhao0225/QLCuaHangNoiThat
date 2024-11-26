package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class KhachHangDAO {
	static Connection conn =DBConnection.Database.getConnection();
	public static KhachHang getKhachHangByCCCD(String cccd) {
	    String sqlString = "SELECT * FROM KhachHang WHERE cccd = ?"; // Sử dụng ? để tránh SQL Injection

	    try {
	        PreparedStatement ps = conn.prepareStatement(sqlString);
	        ps.setString(1, cccd); // Truyền giá trị cccd vào câu lệnh SQL
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            KhachHang kh = new KhachHang(
	                rs.getString("cccd"),
	                rs.getString("ten"),
	                rs.getDate("ngaySinh"),
	                rs.getString("email"),
	                rs.getString("soDienThoai"),
	                rs.getString("diaChi")
	            );
	            return kh;
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return null;
	}
	public static void themKhachHang(KhachHang kh){
        // 1. Thêm hoặc cập nhật thông tin khách hàng
        String insertKhachHang = "INSERT INTO KhachHang (cccd, ten, ngaySinh, email, soDienThoai, diaChi) " +
                "SELECT ?, ?, ?, ?, ?, ? ";

        try{
        	PreparedStatement stmt = conn.prepareStatement(insertKhachHang);
            stmt.setString(1, kh.getCccd());
            stmt.setString(2, kh.getTen());
            stmt.setDate(3, kh.getNgaySinh());
            stmt.setString(4, kh.getEmail());
            stmt.setString(5, kh.getSdt());
            stmt.setString(6, kh.getDiaChi());
            stmt.executeUpdate();
        }
        catch (Exception ex) {
	        ex.printStackTrace();
	    }
	}
}
