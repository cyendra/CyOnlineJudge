<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>

<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("login")==null) {
		out.print("<script type='text/javascript'>alert('please login!');window.location.href='/login.jsp'; </script>");
		return;
	}
	boolean istopic = true;
	String title="",text="";
	String user_id=session.getAttribute("login").toString();
	int topic_id = 0;
	if (request.getParameter("id")!=null) {
		istopic = false;
		topic_id = Integer.parseInt(request.getParameter("id"));
	}
	if(request.getParameter("title")!=null){
		title = request.getParameter("title");
	}
	if(request.getParameter("content")!=null){
		text = request.getParameter("content");
	}
	//out.println(text);
	
	java.util.Date utilDate=new java.util.Date();
	SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String dateTime=f.format(utilDate);
	String que="";
	//String qqqq="insert into forumdata (forum_id, user_id, topic, body, time) values("+topic_id+", '"+user_id+"', '"+title+"', '"+text+"', '"+dateTime+"')";
	//out.println(qqqq);

	
	if (istopic) {
		que="insert into forumtopics (user_id, topic, last_time) values('"+user_id+"' ,'"+title+"', '"+dateTime+"')";
		conn.executeUpdate(que);
		ResultSet rs = conn.executeQuery("select forum_id from forumtopics where user_id='"+user_id+"' and topic='"+title+"' and last_time='"+dateTime+"'");
		while (rs.next()){
			topic_id = Integer.parseInt(rs.getString(1));
		}
		rs.close();
	}
	else{
		conn.executeUpdate("update forumtopics set last_time='"+dateTime+"', number=number+1 where forum_id="+topic_id);
	}
	que="insert into forumdata (forum_id, user_id, topic, body, time) values("+topic_id+", '"+user_id+"', '"+title+"', '"+text+"', '"+dateTime+"')";
	conn.executeUpdate(que);
	//out.println(que);
	if (istopic) response.sendRedirect("/forum/topics.jsp");
	else response.sendRedirect("/forum/posts.jsp?id="+topic_id);
%>