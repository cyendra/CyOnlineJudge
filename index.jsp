<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.*"%>
<%@include file="htmlheader.jsp"%>
<%@page import="java.sql.*"%>
	<div class="w" id="xbody">
	
	<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
	<% 
		ResultSet rs = conn.executeQuery("select * from temp");
		while (rs.next())
		{
			out.println(rs.getString("id"));
			out.println(rs.getString("value"));
		}

	%>

	</div>
<%@include file="htmlfooter.jsp"%>