package db;
import java.sql.*;
public class dbConn {
    private String jdbcDriver = "com.mysql.jdbc.Driver"; // 数据库驱动  
    private String dbUrl = "jdbc:mysql://localhost:3306/my_db?useUnicode=true&characterEncoding=utf8"; // 数据 URL  
    private String dbUsername = "root"; // 数据库用户名    
    private String dbPassword = "myroot"; // 数据库用户密码  
	public Connection conn = null;
	public ResultSet rs = null;
	public dbConn(){
		try {
			Class.forName(jdbcDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public ResultSet executeQuery(String sql) {//public ResultSet executeQuery(String sql) {
		try {
			conn = DriverManager.getConnection(dbUrl,dbUsername,dbPassword);
			Statement stmt = conn.createStatement();
			String ns = new String(sql.getBytes("ISO-8859-1"),"ISO-8859-1");
			rs = stmt.executeQuery(ns);
		}
		catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return rs;
	}
	public int executeUpdate(String sql) {
		int result = 0;
		try {
			conn = DriverManager.getConnection(dbUrl,dbUsername,dbPassword);
			Statement stmt = conn.createStatement();
			String ns = new String(sql.getBytes("ISO-8859-1"),"ISO-8859-1");
			result = stmt.executeUpdate(ns);
		}
		catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return result;
	}
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
