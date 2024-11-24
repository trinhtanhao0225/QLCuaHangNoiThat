package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DoNoiThatDAO {
	private static Connection conn = DBConnection.Database.getConnection();

	public static List<DoNoiThat> getALLDoNoiThat() {
	    List<DoNoiThat> list = new ArrayList<DoNoiThat>();
	    String sqlString = "SELECT DoNoiThat.id, DoNoiThat.ten, DoNoiThat.gia, DoNoiThat.mauSac, " +
	                        "DoNoiThat.soLuong, DoNoiThat.moTa, DoNoiThat.hinhAnh, " +
	                        "DoNoiThat.maDanhMuc, DanhMuc.ten AS tenDanhMuc " +
	                        "FROM DoNoiThat " +
	                        "JOIN DanhMuc ON DoNoiThat.maDanhMuc = DanhMuc.id";

	    try {
	        PreparedStatement ps = conn.prepareStatement(sqlString);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            DoNoiThat dnt = new DoNoiThat(rs.getInt("id"),rs.getString("ten"),rs.getFloat("gia"),rs.getString("mauSac"),rs.getInt("soLuong"),rs.getString("moTa"),rs.getString("hinhAnh"),new DanhMuc(rs.getInt("maDanhMuc"),rs.getString("tenDanhMuc")));  
	            list.add(dnt);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return list;
	}

	public static List<DoNoiThat> getALLDoNoiThat1(){
		List<DoNoiThat> list =new ArrayList<DoNoiThat>();
		String sqlString="SELECT * from DoNoiThat";
	    try {
	        PreparedStatement ps = conn.prepareStatement(sqlString);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            DoNoiThat dnt = new DoNoiThat(rs.getInt("id"),rs.getString("ten"),rs.getFloat("gia"),rs.getString("mauSac"),rs.getInt("soLuong"),rs.getString("hinhAnh"));
	            list.add(dnt);
	            
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return list;
	}
	/*
	public DoNoiThat getProductById(int id) {
	    String query = "SELECT * FROM DoNoiThat WHERE id = ?";
	    try (Connection conn = DBConnection.Database.getConnection();
	         PreparedStatement statement = conn.prepareStatement(query)) {
	        statement.setInt(1, id);
	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            return new DoNoiThat(
	                resultSet.getInt("id"),
	                resultSet.getString("ten"),
	                resultSet.getFloat("gia"),
	                resultSet.getString("mauSac"),	               	            
	                resultSet.getString("hinhAnh")
	            );
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}*/
	public static boolean reduceQuantity(int productId, int quantity) {
	    String sql = "UPDATE DoNoiThat SET soLuong = soLuong - ? WHERE id = ? AND soLuong >= ?";
	    try (Connection conn = DBConnection.Database.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, quantity);
	        stmt.setInt(2, productId);
	        stmt.setInt(3, quantity); // Chỉ giảm nếu số lượng trong kho đủ
	        int rowsUpdated = stmt.executeUpdate();
	        return rowsUpdated > 0; // Trả về true nếu cập nhật thành công
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false; // Trả về false nếu có lỗi hoặc không đủ số lượng
	}



	public static void themCapNhatDoNoiThat(DoNoiThat dnt) {
	    String sqlCheck = "SELECT COUNT(*) FROM DoNoiThat WHERE id = ?";
	    String sqlInsert = "INSERT INTO DoNoiThat (ten, gia, mauSac, soLuong, moTa, hinhAnh,maDanhMuc) VALUES (?, ?, ?, ?, ?, ?, ?)";
	    String sqlUpdate = "UPDATE DoNoiThat SET ten = ?, gia = ?, mauSac = ?, soLuong = ?, moTa = ?, hinhAnh = ?, maDanhMuc= ? WHERE id = ?";
	    
	    try {
	        // Kiểm tra sự tồn tại của id
	        PreparedStatement psCheck = conn.prepareStatement(sqlCheck);
	        psCheck.setInt(1, dnt.getId());
	        ResultSet rs = psCheck.executeQuery();
	        
	        if (rs.next() && rs.getInt(1) > 0) {
	            // Nếu đã tồn tại, thực hiện cập nhật
	            PreparedStatement psUpdate = conn.prepareStatement(sqlUpdate);
	            psUpdate.setString(1, dnt.getTen());
	            psUpdate.setFloat(2, dnt.getGia());
	            psUpdate.setString(3, dnt.getMauSac());
	            psUpdate.setInt(4, dnt.getSoLuong());
	            psUpdate.setString(5, dnt.getMoTa());
	            psUpdate.setString(6, dnt.getHinhAnh());
	            psUpdate.setInt(7, dnt.getDanhMuc().getId());
	            psUpdate.setInt(8, dnt.getId());
	            psUpdate.executeUpdate();
	        } else {
	            // Nếu không tồn tại, thực hiện thêm mới
	            PreparedStatement psInsert = conn.prepareStatement(sqlInsert);
	            psInsert.setString(1, dnt.getTen());
	            psInsert.setFloat(2, dnt.getGia());
	            psInsert.setString(3, dnt.getMauSac());
	            psInsert.setInt(4, dnt.getSoLuong());
	            psInsert.setString(5, dnt.getMoTa());
	            psInsert.setString(6, dnt.getHinhAnh());
	            psInsert.setInt(7, dnt.getDanhMuc().getId());
	            psInsert.executeUpdate();
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	}

	
}
