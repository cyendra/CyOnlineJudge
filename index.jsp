<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.*"%>
<%@include file="htmlheader.jsp"%>
	<div class="w" id="xbody">
<%@page import="java.sql.*"%>

<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(Exception e) {
			out.println("error 1");
			out.println(e.getMessage());
			out.println(e.toString());
		}
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_db","root","super430");
			stmt = conn.createStatement();
			rs=stmt.executeQuery("select * from temp");
			while (rs.next()) {
				out.println(rs.getString("id"));
				out.println(rs.getString("value"));
			}
		} catch(Exception e) {
			out.println("error 2");
			out.println(e.getMessage());
		}
%>
	</div>
<%@include file="htmlfooter.jsp"%>