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
}
