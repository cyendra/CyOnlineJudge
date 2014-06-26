<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<div class="w" id="xbody">
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
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

	String que3 = "select * from photo where user_id='"+lz_user_id+"'";
	dbConn conn3 = new dbConn();
	ResultSet rs3 = conn3.executeQuery(que3);
	String pic3;
	if (rs3.next()) {
		pic3 = "/img/avatar/"+rs3.getString("name");
	}
	else {
		pic3 = "/img/acm.jpeg";
	}
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
						<img class="img_m topic_img" title="" alt='<%=lz_user_id%>' src='<%=pic3%>'/>
					</a>
					<%=title%>
				</h3>
				<hr />
				<pre><%=text%></pre>
				<hr />
				<span class="user-gray"><%=topicdate%></span> 
			</div>
		</div>
		
		<%
			int line = 1;
			while (rs.next()) {
				String name = rs.getString("user_id");
				String ldate = rs.getDate("time").toString() + " " +rs.getTime("time").toString();
				String retopic = rs.getString("topic");
				//String retext = new String(rs.getString("body").getBytes("ISO-8859-1"),"UTF-8");
				String retext = rs.getString("body");
				
				String que4 = "select * from photo where user_id='"+name+"'";
				dbConn conn4 = new dbConn();
				ResultSet rs4 = conn4.executeQuery(que4);
				String pic4;
				if (rs4.next()) {		
					pic4 = "/img/avatar/"+rs4.getString("name");
				}
				else {
					pic4 = "/img/acm.jpeg";
				}
				
				out.println("<div class='reply_area'>");
				out.println("<div class='reply_avatar'><a href=''><img class='img_s topic_img' title='' alt='' src='"+pic4+"' /></a></div>");
				out.println("<div class='reply_right'>");
				out.println("<div><a href='' title='Expert' class='user user-blue'>"+name+"</a><span class='user-gray fr'>#"+line+"</span></div>");
				out.println("<div class='reply_content'><pre>"+retext+"</pre></div>");
				out.println("<div class='reply_foot'><span class='user-gray'>"+ldate+"</span></div>");
				out.println("</div>");
				out.println("</div>");
				line++;
			}
		%>
		
		<div class="topic_box form-horizontal" style="min-height:400px;">
			<div class="header">添加回复</div>
			<div class="inner_topic">
			<%
				String url_1="/forum/gettopic.jsp";
				String url_2="";
				if (request.getParameter("id")!=null) {
					url_2="?id="+Integer.parseInt(request.getParameter("id"));
				}
				String url=url_1+url_2;
			%>
			<form action='<%=url%>' method=post>
				<textarea name=content style= 'width:530px;height:220px '></textarea>
				<div><input type=submit value="回复"></div>
			</form>
			</div>
		</div>
		
	</div>
</fieldset>

</div>
<%@include file="/htmlfooter.jsp"%>