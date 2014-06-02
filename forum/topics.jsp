<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<div class="w" id="xbody">

<fieldset>
	<div>
		<legend id="topic">论坛</legend>
	</div>
	<div class="tablebg">
		<div id="pager">
			<div id="list" class="pagination pagination-small fl">
				<ul>
				    <li class="disabled"><a id="1" href="/forum/topics.jsp?list=0">&lt;&lt;</a></li>					
				<%
					int listid=0,totalnub=0;
					if (request.getParameter("list")!=null) listid=Integer.parseInt(request.getParameter("list"));
					ResultSet rs = conn.executeQuery("select count(*) from forumtopics");
					while(rs.next()){
						totalnub=Integer.parseInt(rs.getString(1));
					}
					for(int i=0;i<=totalnub/20;i++){
						if (i!=listid) out.println("<li><a id="+(i+1)+" href='/forum/topics.jsp?list="+i+"'>"+(i+1)+"</a></li>");
						else out.println("<li class='active'><a id="+(i+1)+" href='/forum/topics.jsp?list="+i+"'>"+(i+1)+"</a></li>");
					}
					out.println("<li><a id="+(totalnub/20+1)+" href='/forum/topics.jsp?list="+totalnub/20+"'>"+"&gt;&gt;"+"</a></li>");
				%>
					
				</ul>
			</div>
			<div class="fr" id="filter">
				<div>
					<a href="/forum/addtopic.jsp" class="uibtn uibtn-mini checklogin" id="addtopic">发布话题</a>
				</div>
			</div>
		</div>
		<div id="tablediv">
			<table class="table" style="table-layout:fixed;" id="contest">
				<thead>
					<tr>
						<th style="width:60px;"></th>
						<th style="width:100px;">回复</th>
						<th style="text-align:left;">标题</th>
						<th style="text-align:right;width:160px"></th>
					</tr>
				</thead>
				<tbody>
				<%
					String que;
					que = "select forum_id,user_id,topic,last_time,number from forumtopics order by forum_id limit "+(listid*20)+",20";
					rs = conn.executeQuery(que);
					int line=1;
					while(rs.next()){
						out.println("<tr>");
						out.println("<td><a href=''><img class='img_s topic_img' title='"+rs.getString("user_id")+"' alt='"+rs.getString("user_id")+"' src='/img/acm.jpeg' /></a></td>");
						out.println("<td><span class='user-green'>"+rs.getInt("number")+"</td>");
						out.println("<td style='text-align:left;' class='ellipsis'><a href='/forum/posts.jsp?id="+rs.getInt("forum_id")+"'>"+rs.getString("topic")+"</a></td>");
						out.println("<td><span>"+rs.getDate("last_time")+"  "+rs.getTime("last_time")+"</span></td>");
						out.println("</tr>");
					}
					rs.close();
				%>

				</tbody>
			</table>
		</div>
	</div>
</fieldset>
  

</div>
<%@include file="/htmlfooter.jsp"%>