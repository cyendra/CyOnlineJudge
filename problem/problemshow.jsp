<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="../htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<%
int proId = 1;
if (request.getParameter("id")!=null) {
	proId = Integer.parseInt(request.getParameter("id"));
}
String path="data/"+proId+"/"+proId+"_";
String Data_1=path+"1.jsp";
String Data_2=path+"2.jsp";
String Data_3=path+"3.jsp";
String Data_4=path+"4.jsp";
String Data_5=path+"5.jsp";
pageContext.setAttribute("url_1",Data_1);
pageContext.setAttribute("url_2",Data_2);
pageContext.setAttribute("url_3",Data_3);
pageContext.setAttribute("url_4",Data_4);
pageContext.setAttribute("url_5",Data_5);
String title="NULL";
String sourse="root";
int diff=5;
int timelimit=1000;
int memorylimit=64000;
int submit=0;
int accepted=0;
ResultSet rs = conn.executeQuery("select title,timelimit,memorylimit,sourse,diff,submit,accepted from problem where problem_id="+proId);
while(rs.next()){
	title=rs.getString("title");
	timelimit=rs.getInt("timelimit");
	memorylimit=rs.getInt("memorylimit");
	sourse=rs.getString("sourse");
	diff=rs.getInt("diff");
	submit=rs.getInt("submit");
	accepted=rs.getInt("accepted");
}
rs.close();
%>
<div class="w"  id="xbody">
<fieldset>
	<div><legend>内容</legend></div>
	<div class="thumbnail" style="padding:1em;"> 
		<div id="sidebar" pid="">
			<div class="sidebox">
				<div class="side-header">→ Information</div>
					<ul class="info">
					<li><span class="user user-gray">How Easy ?</span></li>
					<li>
						<%=diff%>
					</li>
					<li>
						<span class="user user-gray">Solved Number:</span>
						<a href=""><%=accepted%></a>
					</li>
					<li>
						<span class="user user-gray">Submit Number:</span>
						<a href=""><%=submit%></a>
					</li>
					</ul>
			</div>
   
      
		</div>
		<div class="istyle" style="padding-left:1em;margin-left:20em;border-left:1px solid #ddd">
			
			<h3 class="problem-header"><%=title%></h3>
			<div class="prob-info">
				<span class="user user-black">Time Limit: </span>
				<%=timelimit%> MS
				<span class="user user-black">Memory Limit: </span>
				<%=memorylimit%> KB 
			</div>
			
			<h4>Problem Description</h4>
			<div class="accordion-inner ">
				<jsp:include page="${url_1}"/>
			</div>
			
			<h4>Input</h4>
			<div class="accordion-inner ">
				<jsp:include page="${url_2}"/>
			</div>
		
			<h4>Output</h4>
			<div class="accordion-inner ">
				<jsp:include page="${url_3}"/>
			</div>
		
			<h4>Sample Input</h4>
			<div class="accordion-inner ">
				<pre class="sample"><jsp:include page="${url_4}"/></pre>
			</div>
  
			<h4>Sample Output</h4>
			<div class="accordion-inner ">
				<pre class="sample"><jsp:include page="${url_5}"/></pre>
      
			</div>
  
			<h4>Source</h4>
			<div class="accordion-inner "><%=sourse%></div>
	
			<div align="center" style="padding-bottom: 20px;">
				<% String suburl="'/problem/submit.jsp?id="+proId+"'"; %>
				<a class="uibtn checklogin" href=<%=suburl%> pid="" id="gotosubmit">Submit</a><a class="uibtn" href="/">Statistic</a>
			</div>
		</div>
	</div>
</fieldset>
</div>
<%@include file="../htmlfooter.jsp"%>