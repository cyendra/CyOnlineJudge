<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<div class="w" id="xbody">
	<fieldset>
		<div>
			<legend>主页</legend>
		</div>
		<div class="row-fluid">
			<div class="span6 publish_box">
				<div class="publish_header">
					<a href="" title="更多" class="fr more"></a>
					<div>公告</div>
				</div>
				<div class="inner_topic">
					<ul class="publish_list">
						<li>
							<img class="icon" src="/img/arrow.png"/>		
							<span class="fr user-gray">05-29 13:01</span>
							<a href="">
<% 
	ResultSet rs = conn.executeQuery("select * from temp");
	while (rs.next())
	{
		out.println("Test database already");
		out.println(rs.getString("id"));
		out.println(rs.getString("value"));
	}
%>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</fieldset>
		



</div>
<%@include file="/htmlfooter.jsp"%>