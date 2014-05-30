<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<%
	String user_id=null,pwd=null,que;
	int wanne = 0;
	ResultSet rs;
	if(request.getParameter("user_id")!=null){
		user_id=request.getParameter("user_id").toString();
		pwd=request.getParameter("password").toString();
	}
	if(user_id!=null){
		try {
			que="select * from users where user_id='"+user_id+"' and password='"+pwd+"'";
			rs = conn.executeQuery(que);
			if(rs.next()){
				session.setAttribute("login", user_id);
				rs.close();
			}
			else {
				rs.close();
				out.print("<script type='text/javascript'>alert('login failed!');history.go(-1)</script>");
				return ;
			}
			int privilege=0;
			rs=conn.executeQuery("select privilege from users where user_id='"+user_id+"'");
			while(rs.next()) {
				privilege=rs.getInt("privilege");
			}
			rs.close();
			if(privilege>=6)session.setAttribute("admin", user_id);
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		session.setAttribute("login", user_id);
	}
	
	response.sendRedirect("../index.jsp");
%>