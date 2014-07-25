<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<%
String title="", datepicker="", hour="", min="", dd="", hh="", mm="", psw="", desc="";
int num = 0;
if (request.getParameter("num")!=null){
	num = Integer.parseInt(request.getParameter("num"));
}
if (request.getParameter("title")!=null){
	title = request.getParameter("title");
}
if (request.getParameter("datepicker")!=null){
	datepicker = request.getParameter("datepicker");
}
if (request.getParameter("hour")!=null){
	hour = request.getParameter("hour");
}
if (request.getParameter("min")!=null){
	min = request.getParameter("min");
}
if (request.getParameter("dd")!=null){
	dd = request.getParameter("dd");
}
if (request.getParameter("hh")!=null){
	hh = request.getParameter("hh");
}
if (request.getParameter("mm")!=null){
	mm = request.getParameter("mm");
}
if (request.getParameter("desc")!=null){
	desc = request.getParameter("desc");
}
if (request.getParameter("desc")!=null){
	desc = request.getParameter("desc");
}
out.println(num);

String que="insert into contests (name, password, description, num) values('"+title+"' ,'"+psw+"', '"+desc+"', "+num+")";
out.println(que);
conn.executeUpdate(que);

for (int i=1;i<=num;i++) {
	String tt = "p"+i;
	String v = request.getParameter(tt);
	out.println(v);
	
}
response.sendRedirect("/contest/contest.jsp");
%>