<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<div class="w"  id="xbody">
<fieldset>
	<div>
		<legend id="contest">比赛</legend>
	</div>
	<div class="tablebg">
		<div id="pager">
			<div id="list" class="pagination pagination-small fl">
				<ul>
					<li class="disabled">
						<a id="1" href="/contest/contest.jsp?list=0">&lt;&lt;</a>
					</li>
					<%
					int listid=0,totalnub=0;
					if (request.getParameter("list")!=null) listid=Integer.parseInt(request.getParameter("list"));
					//ResultSet rs = conn.executeQuery("select count(*) from contests");
					//while(rs.next()) totalnub=Integer.parseInt(rs.getString(1));
					for(int i=0;i<=totalnub/20;i++){
						if (i!=listid) out.println("<li><a id="+(i+1)+" href='/contest/contest.jsp?list="+i+"'>"+(i+1)+"</a></li>");
						else out.println("<li class='active'><a id="+(i+1)+" href='/contest/contest.jsp?list="+i+"'>"+(i+1)+"</a></li>");
					}
					out.println("<li><a id="+(totalnub/20+1)+" href='/contest/contest.jsp?list="+totalnub/20+"'>"+"&gt;&gt;"+"</a></li>");
					%>
				</ul>
			</div>
			<%
				if (session.getAttribute("admin")!=null) {
					out.println("<div class='fr' id='filter'><div><a class='uibtn uibtn-mini' href='/admin/addcontest.jsp' id='fil'>Add Contest</a></div></div>");
				}
			%>
		</div>
    </div>
    <div id="tablediv">
		<table class="table table-cf" id="contest">
			<thead>
				<tr>
					<th style="width:65px;">#</th>
					<th>Title</th>
					<th style="width:180px;">Start Time</th>
					<th style="width:100px;">Duration</th>
					<th style="width:100px;">Type</th>
					<th style="width:100px;"></th>
				</tr>
			</thead>
			<tbody>
				<%
					String que;
					que = "select * from contests order by contest_id desc limit "+(listid*20)+",20";
					//rs = conn.executeQuery(que);
					int line=1;
					/*
					while(rs.next()){
						if (line%2==1) out.println("<tr class='odd'>");
						else out.println("<tr class='even'>");

						out.println("</tr>");
						line++;
					}
					rs.close();
					*/
				%>
			</tbody>
		</table>
	</div>
</fieldset>
</div>

<%@include file="/htmlfooter.jsp"%>