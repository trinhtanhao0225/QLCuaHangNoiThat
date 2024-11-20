package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
	private static final String DB_ServerName = "DESKTOP-NGD50VQ";
	private static final String DB_login = "sa";
	private static final String DB_password = "123";
	private static final String DB_databaseName = "QLCuaHangNoiThat";
	
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
	
}
