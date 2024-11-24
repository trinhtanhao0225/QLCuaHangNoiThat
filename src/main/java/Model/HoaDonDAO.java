package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 
}
