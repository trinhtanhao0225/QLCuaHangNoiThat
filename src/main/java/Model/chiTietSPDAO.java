package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class chiTietSPDAO {
	// Lấy sản phẩm cùng danh mục
    public List<chiTietSP> getRelatedProducts(int maDanhMuc, int excludeId) {
        List<chiTietSP> relatedProducts = new ArrayList<>();
        String sql = "SELECT * FROM DoNoiThat WHERE maDanhMuc = ? AND id != ?";

        try (Connection conn = DBConnection.Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, maDanhMuc); // Danh mục của sản phẩm
            stmt.setInt(2, excludeId); // Loại trừ sản phẩm hiện tại
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                chiTietSP product = new chiTietSP(
                    rs.getInt("id"),
                    rs.getString("ten"),
                    rs.getFloat("gia"),
                    rs.getString("mauSac"),
                    rs.getInt("soLuong"),
                    rs.getString("moTa"),
                    rs.getString("hinhAnh"),
                    rs.getInt("maDanhMuc")
                );
                relatedProducts.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return relatedProducts;
    }
	
	public chiTietSP getProductById(int id) {
	    String query = "SELECT * FROM DoNoiThat WHERE id = ?";
	    try (Connection conn = DBConnection.Database.getConnection();
	         PreparedStatement statement = conn.prepareStatement(query)) {
	        statement.setInt(1, id);
	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            return new chiTietSP(
	                resultSet.getInt("id"),
	                resultSet.getString("ten"),
	                resultSet.getFloat("gia"),
	                resultSet.getString("mauSac"),
	                resultSet.getInt("soLuong"),
	                resultSet.getString("moTa"),
	                resultSet.getString("hinhAnh"),
	                resultSet.getInt("maDanhMuc")
	            );
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}
}
