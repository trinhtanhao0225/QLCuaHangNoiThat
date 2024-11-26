package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class HoaDonDAO {
	static Connection conn =DBConnection.Database.getConnection();
	public static List<HoaDon> getALLHoaDon() {
	    List<HoaDon> list = new ArrayList<HoaDon>();
	    String sqlString = "SELECT * FROM HoaDon";

	    try {
	        PreparedStatement ps = conn.prepareStatement(sqlString);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            HoaDon hd = new HoaDon(rs.getInt("id"),rs.getFloat("tongTien"),rs.getString("cccd"),rs.getString("ten"),rs.getDate("ngayDatHang"));  
	            list.add(hd);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return list;
	}	
	public static void themHoaDon(HoaDon hd, List<DoNoiThat> cart) {
		String insertHoaDon = "INSERT INTO HoaDon (cccd, ten, ngayDatHang, tongTien) VALUES (?, ?, ?, ?)";
		String insertChiTietHoaDon = "INSERT INTO ChiTietHoaDon (idHoaDon, idDoNoiThat, soLuong, gia) VALUES (?, ?, ?, ?)";
		System.out.println(1);
		// Thực thi câu lệnh chèn hóa đơn và lấy idHoaDon vừa thêm
		try (Connection conn = DBConnection.Database.getConnection()) {
		    // Chèn dữ liệu vào bảng HoaDon và lấy idHoaDon vừa thêm
		    try (PreparedStatement stmtHoaDon = conn.prepareStatement(insertHoaDon, Statement.RETURN_GENERATED_KEYS)) {
		        stmtHoaDon.setString(1, hd.getCccd());
		        stmtHoaDon.setString(2, hd.getTen());
		        stmtHoaDon.setDate(3, hd.getThoiGianDatHang());
		        stmtHoaDon.setFloat(4, hd.getTongTien());
		        stmtHoaDon.executeUpdate();

		        // Lấy idHoaDon vừa được thêm vào
		        try (ResultSet generatedKeys = stmtHoaDon.getGeneratedKeys()) {
		            if (generatedKeys.next()) {
		                int idHoaDon = generatedKeys.getInt(1);  // Lấy idHoaDon vừa thêm
		                System.out.println("ID Hóa đơn vừa thêm: " + idHoaDon);

		                // Chèn chi tiết hóa đơn vào bảng ChiTietHoaDon
		                try (PreparedStatement stmtChiTietHoaDon = conn.prepareStatement(insertChiTietHoaDon)) {
		                    for (DoNoiThat product : cart) {
		                        stmtChiTietHoaDon.setInt(1, idHoaDon);
		                        stmtChiTietHoaDon.setInt(2, product.getId());
		                        stmtChiTietHoaDon.setInt(3, product.getSoLuong());
		                        stmtChiTietHoaDon.setFloat(4, product.getTotalPrice());
		                        stmtChiTietHoaDon.addBatch();
		                    }
		                    stmtChiTietHoaDon.executeBatch();
		                }
		            }
		        }
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		}

	}
 
}
