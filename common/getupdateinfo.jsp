<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<%
	String user_id = null,password = null,nick = null,email = null,school = null;
	if(request.getParameter("user_id")!=null){
		user_id=request.getParameter("user_id");
	}
	if(request.getParameter("password")!=null){
		password=request.getParameter("password");
	}
	if(request.getParameter("nick")!=null){
		nick=request.getParameter("nick");
	}
	if(request.getParameter("email")!=null){
		email=request.getParameter("email");
	}
	if(request.getParameter("school")!=null){
		school=request.getParameter("school");
	}
	conn.executeUpdate("update users set password='"+password+"', nick='"+nick+"', email='"+email+"', school='"+school+"' where user_id='"+user_id+"'");
	response.sendRedirect("/index.jsp");
%>