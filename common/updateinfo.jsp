<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<%
	String nick="null",email="null",school="null";
	String user_id=session.getAttribute("login").toString();
	String Q = "select nick,email,school from users where user_id='"+user_id+"'";
	if (user_id==null)  response.sendRedirect("/index.jsp");
	ResultSet rs = conn.executeQuery(Q);
	if (rs==null) out.println("user not found");
	else
	while (rs.next()) {
		nick=rs.getString("nick");
		email=rs.getString("email");
		school=rs.getString("school");
	}
%>
<div class="w" id="xbody">
<center>
<form action='getupdateinfo.jsp' method='post' onsubmit='return check_p(this)' >
	<table style='width:70%'>
		<tr>
			<td style='width:30%'>User :</td>
			<td style='width:70%'><input type='text' name='user_id' value="<%=user_id%>" readonly /></td>
		</tr>
		<tr>
			<td>Password :</td>
			<td><input type='password' name='password' /></td>
		</tr>
		<tr>
			<td>Re_Password :</td>
			<td><input type='password' name='repassword' /></td>
		</tr>
		<tr>
			<td>Nickname :</td>
			<td><input type='text' name='nick' value='<%=nick%>' size='40' /></td>
		</tr>
		<tr>
			<td>Email :</td>
			<td><input type='text' name='email' value='<%=email%>' size='40' /></td>
		</tr>
		<tr>
			<td>School :</td>
			<td><input type='text' name='school' value='<%=school%>' size='40' /></td>
		</tr>
		<tr>
			<td colspan='2' >
				<center>
					<input type='submit' value='submit'/>
					<input type='reset' value=reset />
				</center>
			</td>
		</tr>
	</table>
</form>
</center>

</div>
<%@include file="/htmlfooter.jsp"%>