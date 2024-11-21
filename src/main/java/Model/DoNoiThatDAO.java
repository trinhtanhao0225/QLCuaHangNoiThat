package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DoNoiThatDAO {
	private static Connection conn =DBConnection.Database.getConnection();
	public static List<DoNoiThat> getALLDoNoiThat(){
		List<DoNoiThat> list =new ArrayList<DoNoiThat>();
		String sqlString="SELECT * from DoNoiThat";
	    try {
	        PreparedStatement ps = conn.prepareStatement(sqlString);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            DoNoiThat dnt = new DoNoiThat(rs.getInt("id"),rs.getString("ten"),rs.getFloat("gia"),rs.getString("mauSac"),rs.getInt("soLuong"),rs.getString("moTa"),rs.getString("hinhAnh"));
	            list.add(dnt);
	            
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return list;
	}
	
	public static void themCapNhatDoNoiThat(DoNoiThat dnt) {
	    String sqlCheck = "SELECT COUNT(*) FROM DoNoiThat WHERE id = ?";
	    String sqlInsert = "INSERT INTO DoNoiThat (ten, gia, mauSac, soLuong, moTa, hinhAnh) VALUES (?, ?, ?, ?, ?, ?)";
	    String sqlUpdate = "UPDATE DoNoiThat SET ten = ?, gia = ?, mauSac = ?, soLuong = ?, moTa = ?, hinhAnh = ? WHERE id = ?";
	    
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
	            psUpdate.setInt(7, dnt.getId());
	            psUpdate.executeUpdate();
	        } else {
	            // Nếu không tồn tại, thực hiện thêm mới
	            PreparedStatement psInsert = conn.prepareStatement(sqlInsert);
	            psInsert.setInt(1, dnt.getId());
	            psInsert.setString(2, dnt.getTen());
	            psInsert.setFloat(3, dnt.getGia());
	            psInsert.setString(4, dnt.getMauSac());
	            psInsert.setInt(5, dnt.getSoLuong());
	            psInsert.setString(6, dnt.getMoTa());
	            psInsert.setString(7, dnt.getHinhAnh());
	            psInsert.executeUpdate();
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	}

	
}
