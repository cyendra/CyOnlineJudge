<%
	session.removeAttribute("login");
	session.removeAttribute("admin");
	response.sendRedirect("../index.jsp");
%>