package db;
import java.sql.*;
public class dbConn {
	String sDBDriver = "com.mysql.jdbc.Driver";
	String sConnStr = "jdbc:mysql://localhost:3306/my_db";// /sample_db?user=root&password=your_password"
	Connection conn = null;
	ResultSet rs = null;
	public dbConn(){
		try {
			Class.forName(sDBDriver);
		}
		catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
	public ResultSet executeQuery(String sql) {
		try {
			conn = DriverManager.getConnection(sConnStr,"root","myroot");
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		}
		catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return rs;
	}
	public int executeUpdate(String sql) {
		int result = 0;
		try {
			conn = DriverManager.getConnection(sConnStr,"root","myroot");
			Statement stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		}
		catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return result;
	}
}
