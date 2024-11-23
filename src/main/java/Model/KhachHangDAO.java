package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		
 
}
