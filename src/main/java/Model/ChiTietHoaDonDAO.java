package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ChiTietHoaDonDAO {
	static Connection conn =DBConnection.Database.getConnection();
	public static List<ChiTietHoaDon> getAllChiTietHD() {
	    String sqlString = "SELECT * FROM ChiTietHoaDon"; 
	    List<ChiTietHoaDon> list =new ArrayList<ChiTietHoaDon>();
	    try {
	        PreparedStatement ps = conn.prepareStatement(sqlString);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            ChiTietHoaDon chiTietHoaDon=new ChiTietHoaDon(rs.getInt("idHoaDon"),rs.getInt("idDoNoiThat"),rs.getInt("soLuong"),rs.getFloat("gia"));
	            list.add(chiTietHoaDon);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return list;
	}
}
