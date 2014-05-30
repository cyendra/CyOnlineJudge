<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.*"%>
<%@include file="../htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<div class="w"  id="xbody">

<fieldset>
	<div><legend>题库</legend></div>
	
	<div class="tablebg">
		<div id="pager">
			<div id="list" class="pagination pagination-small fl">
				<ul>
					<li class="disabled"><a id="1" href="problemlist.jsp?list=0">&lt;&lt;</a></li>
				<%

					int listid=0,totalnub=0;
					if (request.getParameter("list")!=null) listid=Integer.parseInt(request.getParameter("list"));
					ResultSet rs = conn.executeQuery("select count(*) from problem");
					
					while(rs.next()){
						totalnub=Integer.parseInt(rs.getString(1));
					}
					//out.println("totalnub="+totalnub);
					for(int i=0;i<=totalnub/20;i++){
						if (i!=listid) out.println("<li><a id="+(i+1)+" href='problemlist.jsp?list="+i+"'>"+(i+1)+"</a></li>");
						else out.println("<li class='active'><a id="+(i+1)+" href='problemlist.jsp?list="+i+"'>"+(i+1)+"</a></li>");
					}
					out.println("<li><a id="+(totalnub/20+1)+" href='problemlist.jsp?list="+totalnub/20+"'>"+"&gt;&gt;"+"</a></li>");
				%>
				</ul>
			</div>
		    <div class="fr" id="filter">
			
				<div class="input-prepend">
					<span class="add-on"><i class="icon-search"></i></span>
					<input type="text" id="search" style="width:160px;"  title="Title or Tag or Source" placeholder=" title or tag or source">
				</div>
				
				<div>
					<a class="uibtn uibtn-mini" href="" id="fil">Filter</a>
				</div>
				<div>
					<a class="uibtn uibtn-mini" href="" id="reset">Reset</a>
				</div>
				
			</div>
			
			<div id="tablediv">
			
				<table class="table table-cf" style="table-layout:fixed;" id="problemset">
				
				<thead>
					<tr>
						<th style="width:65px;">#</th>
						<th style="width:100px;">easy?</th>
						<th>Title</th>
						<th style="width:70px;"></th>
						<th style="width:150px;">Source</th>
						<th style="width:150px;">Ratio(AC/submit)</th>
					</tr>
				</thead>
				<tbody>
				<%
					String que;
					que = "select problem_id,title,accepted,submit,sourse,diff from problem order by problem_id limit "+(listid*20)+",20";
					rs = conn.executeQuery(que);
					int line=1;
					while(rs.next()){
						if (line%2==1) out.println("<tr class='odd'>");
						else out.println("<tr class='even'>");
						out.println("<td class='center undefined'>"+rs.getInt("problem_id")+"</td>");
						out.println("<td><div title='' class='bgstar mc'><span title='' class='star' style='width:80px;'>"+rs.getInt("diff")+"</span></div></td>");
						out.println("<td><a href=''>"+rs.getString("title")+"</a></td>");
						out.println("<td><span class='act-item'><a id='' class='checklogin' href='' pid=''><img src='/img/submit.png' title='Submit' alt='submit'/></a></span></td>");
						out.println("<td class='ellipsis'><a href='' style='font-size:12px;' class='tag' title=''>"+rs.getString("sourse")+"</a></td>");
						int ac=rs.getInt("accepted");
						int sb=rs.getInt("submit");
						double acl = 0;
						if (sb!=0) acl=1.0*ac/sb;
						out.println("<td class='center'>"+acl*100.0+"%(<a href=''>"+ac+"</a>/<a href=''>"+sb+"</a>)</td>");
						out.println("</tr>");
						line++;
					}
					rs.close();
					//out.println(line);
				%>
				<!--
					<tr class='odd'>
					<td class='center undefined'>1000</td>
					<td><div title='水题' class='bgstar mc'><span title='水题' class='star' style='width:80px;'></span></div></td>
					<td><a href=''>A + B Problem</a></td>
					<td><span class='act-item'><a id='' class='checklogin' href='' pid='1000'><img src='/img/submit.png' title='Submit' alt='submit'/></a></span></td>
					<td class='ellipsis'><a href='' style='font-size:12px;' class='tag' title=''>ACdream</a></td>
					<td class='center'>60.42%(<a href=''>261</a>/<a href=''>432</a>)</td>
					</tr>
        					-->
				</tbody>
				
				</table>
			</div>
			
		</div>
	</div>
	
</fieldset>

</div>

<%@include file="../htmlfooter.jsp"%>