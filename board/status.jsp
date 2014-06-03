<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<div class="w"  id="xbody">

<fieldset>
	<div><legend>状态</legend></div>
	<div class="tablebg" >
		<div id="pager">
			<div id="list" class="pagination pagination-small fl">
				<ul>
					<li class="disabled"><a id="1" href="/board/status.jsp?list=0">&lt;&lt;</a></li>
				<%
					int listid=0,totalnub=0;
					if (request.getParameter("list")!=null) listid=Integer.parseInt(request.getParameter("list"));
					ResultSet rs = conn.executeQuery("select count(*) from statusdata");
					while(rs.next()){
						totalnub=Integer.parseInt(rs.getString(1));
					}
					for(int i=0;i<=totalnub/20;i++){
						if (i!=listid) out.println("<li><a id="+(i+1)+" href='/board/status.jsp?list="+i+"'>"+(i+1)+"</a></li>");
						else out.println("<li class='active'><a id="+(i+1)+" href='/board/status.jsp?list="+i+"'>"+(i+1)+"</a></li>");
					}
					out.println("<li><a id="+(totalnub/20+1)+" href='/board/status.jsp?list="+totalnub/20+"'>"+"&gt;&gt;"+"</a></li>");
				%>
				</ul>
			</div>
			<div id="tablediv">
				<table class="table table-cf" id="statustable">
					<thead>
						<tr>
							<th style="width:7%;">RunID</th>
							<th style="width:14%;">User</th>
							<th style="width:10%;">Problem</th>
							<th>Verdict</th>
							<th style="width:9%;">Time</th>
							<th style="width:9%;">Memory</th>
							<th style="width:8%;">Lang</th>
							<th style="width:8%;">Length</th>
							<th style="width:15%;">Submit Time</th>
						</tr>
					</thead>
					<tbody>
					<%
					String que;
					que = "select run_id,user_id,problem_id,verdict,time,memory,lang,length,submittime from statusdata order by run_id desc limit "+(listid*20)+",20";
					rs = conn.executeQuery(que);
					int line=1;
					while(rs.next()){
						if (line%2==1) out.println("<tr class='odd'>");
						else out.println("<tr class='even'>");
						out.println("<td>"+rs.getInt("run_id")+"</td>");
						out.println("<td><a class='user user-unrated' title='"+rs.getString("user_id")+"' href=''>"+rs.getString("user_id")+"</a></td>");
						out.println("<td><a href='/problem/problemshow.jsp?id="+rs.getInt("problem_id")+"'>"+rs.getInt("problem_id")+"</a></td>");
						String ver = rs.getString("verdict");
						String clstp = "";
						if (ver.equals("Accepted")) clstp = "bold  accept-text";
						else if (ver.equals("Compilation Error") || ver.equals("System Error")) clstp = "bold  special-text";
						else clstp = "bold  wrong-text";
						out.println("<td class='"+clstp+"' rid=''>"+ver+"</td>");
						out.println("<td>"+rs.getInt("time")+" MS</td>");
						out.println("<td>"+rs.getInt("memory")+" KB</td>");
						out.println("<td><a href=''>"+rs.getString("lang")+"</a></td>");
						out.println("<td>"+rs.getInt("length")+" B</td>");
						out.println("<td>"+rs.getDate("submittime").toString()+" "+rs.getTime("submittime").toString()+"</td>");
						out.println("</tr>");
						line++;
					}
					rs.close();
					conn.close();
					//out.println(line);
					%>
				
					
					</tbody>
				</table>
			</div>
		</div>
	</div>
</fieldset>
</div>
<%@include file="/htmlfooter.jsp"%>