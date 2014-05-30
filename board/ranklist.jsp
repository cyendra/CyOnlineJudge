<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<div class="w" id="xbody">

<fieldset id="ranklist" >
	<div><legend>ÅÅÃû</legend></div>
		<div class="tablebg">
			<div id="pager">
				<div id="list" class="pagination pagination-small fl">
					<ul>
						<li class="disabled"><a id="1" href="/board/ranklist.jsp?list=0">&lt;&lt;</a></li> 
				<%
					int listid=0,totalnub=0;
					if (request.getParameter("list")!=null) listid=Integer.parseInt(request.getParameter("list"));
					ResultSet rs = conn.executeQuery("select count(*) from users");
					while(rs.next()){
						totalnub=Integer.parseInt(rs.getString(1));
					}
					for(int i=0;i<=totalnub/20;i++){
						if (i!=listid) out.println("<li><a id="+(i+1)+" href='/board/ranklist.jsp?list="+i+"'>"+(i+1)+"</a></li>");
						else out.println("<li class='active'><a id="+(i+1)+" href='/board/ranklist.jsp?list="+i+"'>"+(i+1)+"</a></li>");
					}
					out.println("<li><a id="+(totalnub/20+1)+" href='/board/ranklist.jsp?list="+totalnub/20+"'>"+"&gt;&gt;"+"</a></li>");
				%>
					</ul>
				</div>
			</div>
		</div>
		<div id="tablediv">
			<table class="table table-cf tdcenter" style="table-layout:fixed;" id="rank">
				<thead>
					<tr>
						<th style="width:60px;">Rank</th>
						<th style="width:150px;">User</th>
						<th style="width:150px;">Nickname</th>
						<th>Email</th>
						<th>School</th>
						<th style="width:70px;">Solved</th>
						<th style="width:70px;">Submit</th>
					</tr>
				</thead>
				<tbody>
				<%
					String que;
					que = "select user_id,nick,accepted,submit,email,school from users order by accepted desc,submit  limit "+(listid*20)+",20";
					rs = conn.executeQuery(que);
					int line=1;
					while(rs.next()){
						if (line%2==1) out.println("<tr class='odd'>");
						else out.println("<tr class='even'>");
						out.println("<td>"+(listid*20+line)+"</td>");
						out.println("<td>"+rs.getString("user_id")+"</td>");
						out.println("<td>"+rs.getString("nick")+"</td>");
						out.println("<td>"+rs.getString("email")+"</td>");
						out.println("<td>"+rs.getString("school")+"</td>");
						out.println("<td>"+rs.getString("accepted")+"</td>");
						out.println("<td>"+rs.getString("submit")+"</td>");
						out.println("</tr>");
						line++;
					}
					rs.close();
				%>
				</tbody>
			</table>
		</div>
	</div>
</fieldset>
<%@include file="/htmlfooter.jsp"%>