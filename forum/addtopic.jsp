<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<div class="w" id="xbody">
<fieldset>
	<div>
		<legend id="addtopic" >
			Add Topic
		</legend>
	</div>
	<div class="alert alert-info" style="padding:30px;display:none;">
		<h1 align="center">Add Topic</h1>
	</div>
	<center>
	<%
		String url_1="/forum/gettopic.jsp";
		String url_2="";
		if (request.getParameter("id")!=null) {
			url_2="?id="+Integer.parseInt(request.getParameter("id"));
		}
		String url=url_1+url_2;
	%>
	<form action='<%=url%>' method=post>
	<table>
		<tr>
			<td>���⣺<input type=text name=title id="Title" class="input-xxlarge" placeholder="���ڴ��������"></td>				
		</tr>
		<tr>
			<td>���ݣ�<textarea style= 'width:530px;height:220px '  name=content></textarea></td>
		</tr>
		<tr>
			<td><center><input type=submit value="����"></center></td>
		</tr>
	</table>
	</form>
	</center>
</fieldset>

</div>
<%@include file="/htmlfooter.jsp"%>