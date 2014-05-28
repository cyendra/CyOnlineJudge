<%
	session.removeAttribute("login");
	response.sendRedirect("../index.jsp");
%>