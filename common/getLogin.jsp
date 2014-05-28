<%
	String user_id=null,pwd=null,que;
	int wanne = 0;


	if(request.getParameter("user_id")!=null){
		user_id=request.getParameter("user_id").toString();
		pwd=request.getParameter("password").toString();
	}
	/*	
	Connection conn=null;
	Statement stat=null;
	ResultSet res=null;
	*/	
	if(user_id!=null){
		/*
		try {
			conn=connPool.getConnection();
			stat=conn.createStatement();

			que="select * from users where user_id='"+user_id+"' and password='"+pwd+"'";
			res=stat.executeQuery(que);
			if(res.next()){
				//out.print("user_id==="+res.getString("user_id")+"   password==="+res.getString("password"));
				session.putValue("login", user_id);
				res.close();
			}
			else {
				res.close();
				stat.close();
				connPool.returnConnection(conn);
				out.print("<script type='text/javascript'>alert('login failed!');history.go(-1)</script>");
				return ;
			}
			int privilege=0;
			res=stat.executeQuery("select privilege from users where user_id='"+user_id+"'");
			while(res.next()) {
				privilege=res.getInt("privilege");
			}
			res.close();
			stat.close();
			connPool.returnConnection(conn);
					
			if(privilege>=6)session.putValue("admin", user_id);
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		session.setAttribute("login", user_id);
	}
	
	response.sendRedirect("../index.jsp");
%>