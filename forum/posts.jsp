<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<div class="w" id="xbody">
<%
	int post_id=0;
	String lz_user_id="", lz_date="", lz_time="";
	String title="",text="";
	if (request.getParameter("id")!=null) post_id=Integer.parseInt(request.getParameter("id"));
	else {
		out.print("<script type='text/javascript'>alert('Post Not Found!');window.location.href='/forum.jsp'; </script>");
		return;
	}
	String que="select user_id, topic,body,time from forumdata where forum_id="+post_id+" order by data_id";
	ResultSet rs = conn.executeQuery(que);
	if (rs.next()) {
		lz_user_id = rs.getString("user_id");
		lz_date = rs.getDate("time").toString();
		lz_time = rs.getTime("time").toString();
		title = rs.getString("topic");
		text = rs.getString("body");
	}
	String topicdate=lz_date+" "+lz_time;
%>
<fieldset>
	<div>
		<legend id="onetopic" tid="1261">论坛</legend>
	</div>
	<div class="content">
		<div class="topic_box">
			<div class="header">
				<a href="/forum/topics.jsp">论坛主页</a>>>话题详情
			</div>
			<div class="inner_topic">
				<h3>
					<a class="user" href="">
						<img class="img_m topic_img" title="" alt='<%=lz_user_id%>' src="/img/acm.jpeg"/>
					</a>
					<%=title%>
				</h3>
				<hr />
				<%=text%>
				<hr />
				<span class="user-gray"><%=topicdate%></span> 
			</div>
		</div>
	</div>

</fieldset>

</div>
<%@include file="/htmlfooter.jsp"%>