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

	public static List<DoNoiThat> searchProductsByName(String name) {
	    List<DoNoiThat> products = new ArrayList<>();
	    try (Connection conn = DBConnection.Database.getConnection()) {
	        String sql = "SELECT * FROM DoNoiThat WHERE ten LIKE ?";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setString(1, "%" + name + "%");
	        ResultSet resultSet = stmt.executeQuery();
	        while (resultSet.next()) {
	            products.add(new DoNoiThat(
	            		resultSet.getInt("id"),
	 	                resultSet.getString("ten"),
	 	                resultSet.getFloat("gia"),
	 	                resultSet.getString("mauSac"),
	 	                resultSet.getInt("soLuong"), 	               
	 	                resultSet.getString("hinhAnh")
	 	              
	            ));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return products;
	}
	public static boolean checkQuantity(int id, int quantityToReduce) {
	    String checkQuery = "SELECT soLuong FROM DoNoiThat WHERE id = ?";
	    try {
	    	PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
	    	checkStmt.setInt(1, id);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt("soLuong") < quantityToReduce) {
                return false; // Không đủ số lượng
            }
	    }catch (Exception e) {
		}
	   return true;
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

    public static List<DoNoiThat> getRelatedProducts(int maDanhMuc, int excludeId) {
        List<DoNoiThat> relatedProducts = new ArrayList<>();
	    String sqlString = "SELECT DoNoiThat.id, DoNoiThat.ten, DoNoiThat.gia, DoNoiThat.mauSac, " +
                "DoNoiThat.soLuong, DoNoiThat.moTa, DoNoiThat.hinhAnh, " +
                "DoNoiThat.maDanhMuc, DanhMuc.ten AS tenDanhMuc " +
                "FROM DoNoiThat " +
                "JOIN DanhMuc ON DoNoiThat.maDanhMuc = DanhMuc.id WHERE DoNoiThat.maDanhMuc = ? AND DoNoiThat.id != ?";
        try (Connection conn = DBConnection.Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sqlString)) {
            stmt.setInt(1, maDanhMuc); // Danh mục của sản phẩm
            stmt.setInt(2, excludeId); // Loại trừ sản phẩm hiện tại
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	DoNoiThat product = new DoNoiThat(
                    rs.getInt("id"),
                    rs.getString("ten"),
                    rs.getFloat("gia"),
                    rs.getString("mauSac"),
                    rs.getInt("soLuong"),
                    rs.getString("moTa"),
                    rs.getString("hinhAnh"),
                    new DanhMuc(rs.getInt("maDanhMuc"),rs.getString("tenDanhMuc"))
                );
                relatedProducts.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return relatedProducts;
    }
	
	public static DoNoiThat getProductById(int id) {
	    String sqlString = "SELECT DoNoiThat.id, DoNoiThat.ten, DoNoiThat.gia, DoNoiThat.mauSac, " +
			                "DoNoiThat.soLuong, DoNoiThat.moTa, DoNoiThat.hinhAnh, " +
			                "DoNoiThat.maDanhMuc, DanhMuc.ten AS tenDanhMuc " +
			                "FROM DoNoiThat " +
			                "JOIN DanhMuc ON DoNoiThat.maDanhMuc = DanhMuc.id where DoNoiThat.id = ?";

	    try (Connection conn = DBConnection.Database.getConnection();
	         PreparedStatement statement = conn.prepareStatement(sqlString)) {
	        statement.setInt(1, id);
	        ResultSet rs = statement.executeQuery();
	        if (rs.next()) {
            	 DoNoiThat product = new DoNoiThat(
                        rs.getInt("id"),
                        rs.getString("ten"),
                        rs.getFloat("gia"),
                        rs.getString("mauSac"),
                        rs.getInt("soLuong"),
                        rs.getString("moTa"),
                        rs.getString("hinhAnh"),
                        new DanhMuc(rs.getInt("maDanhMuc"),rs.getString("tenDanhMuc")));
            	 return product;    
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}
}
