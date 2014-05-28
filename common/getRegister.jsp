<%
	String user_id = null,password = null,nick = null,email = null,school = null;
	int checknum=0;
	if(request.getParameter("checknum")!=null){
		checknum=Integer.parseInt(request.getParameter("checknum").toString());
		if(checknum!=Integer.parseInt(session.getAttribute("checknum").toString())){
			out.print("<script type='text/javascript'>alert('ÑéÖ¤Âë´íÎó!');history.go(-1);</script>");
			return ;
		}
	}
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
	/*
	conn=connPool.getConnection();
	stat=conn.createStatement();
	res=stat.executeQuery("select user_id from users where user_id='"+user_id+"';");
	if(res.next()){
		res.close();
		stat.close();
		connPool.returnConnection(conn);	
		out.print("<script type='text/javascript'>alert('user exist!');history.go(-1)</script>");
		return ;
	}
	res.close();

	stat.executeUpdate("insert into users(user_id,password,nick,email,school) values('"+user_id+"','"+password+"','"+nick+"','"+email+"','"+school+"')");
	stat.close();
	connPool.returnConnection(conn);
	*/
	session.setAttribute("login", user_id);
	
	response.sendRedirect("../index.jsp");

%>