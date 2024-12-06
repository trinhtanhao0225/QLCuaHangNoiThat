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
	public static void themHoacCapNhatKhachHang(KhachHang kh) {
	    // 1. Kiểm tra xem khách hàng có tồn tại hay không
	    String checkExistQuery = "SELECT COUNT(*) FROM KhachHang WHERE cccd = ?";
	    String updateQuery = "UPDATE KhachHang SET ten = ?, ngaySinh = ?, email = ?, soDienThoai = ?, diaChi = ? WHERE cccd = ?";
	    String insertQuery = "INSERT INTO KhachHang (cccd, ten, ngaySinh, email, soDienThoai, diaChi) VALUES (?, ?, ?, ?, ?, ?)";

	    try {
	        // Kiểm tra sự tồn tại của khách hàng
	        PreparedStatement checkStmt = conn.prepareStatement(checkExistQuery);
	        checkStmt.setString(1, kh.getCccd());
	        ResultSet rs = checkStmt.executeQuery();
	        rs.next();
	        boolean exists = rs.getInt(1) > 0;

	        if (exists) {
	            // Khách hàng đã tồn tại, thực hiện cập nhật thông tin
	            PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
	            updateStmt.setString(1, kh.getTen());
	            updateStmt.setDate(2, kh.getNgaySinh());
	            updateStmt.setString(3, kh.getEmail());
	            updateStmt.setString(4, kh.getSdt());
	            updateStmt.setString(5, kh.getDiaChi());
	            updateStmt.setString(6, kh.getCccd());
	            updateStmt.executeUpdate();
	            updateStmt.close();
	            System.out.println("Thông tin khách hàng đã được cập nhật.");
	        } else {
	            // Khách hàng chưa tồn tại, thêm mới
	            PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
	            insertStmt.setString(1, kh.getCccd());
	            insertStmt.setString(2, kh.getTen());
	            insertStmt.setDate(3, kh.getNgaySinh());
	            insertStmt.setString(4, kh.getEmail());
	            insertStmt.setString(5, kh.getSdt());
	            insertStmt.setString(6, kh.getDiaChi());
	            insertStmt.executeUpdate();
	            insertStmt.close();
	            System.out.println("Khách hàng mới đã được thêm.");
	        }

	        // Đóng PreparedStatement và ResultSet
	        checkStmt.close();
	        rs.close();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	}

}
