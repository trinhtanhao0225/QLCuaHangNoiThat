package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
	private static final String DB_ServerName = "DESKTOP-Q1R3HVB";
	private static final String DB_login = "sa";
	private static final String DB_password = "Trinhtanhao0225@";
	private static final String DB_databaseName = "QLMuaBanNoiThat";
	
	public static Connection getConnection () {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String DB_URL = "jdbc:sqlserver://" + DB_ServerName + ":1433;" + 
	                 "databaseName=" + DB_databaseName + ";" + 
	                 "encrypt=true;" + 
	                 "trustServerCertificate=true;";

			
				return DriverManager.getConnection(DB_URL,DB_login,DB_password);
			}catch (SQLException e) {
				e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		
		return null;
	}
	public static void main(String[] args) {
		Connection connection = getConnection();
		if (connection != null) {
			System.out.println("Kết nối cơ sở dữ liệu thành công!");
		} else {
			System.out.println("Kết nối cơ sở dữ liệu thất bại!");
		}
	}
}
