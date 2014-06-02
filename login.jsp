<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="htmlheader.jsp"%>
	<div class="w" id="xbody">
		<center>
			<form action='common/getLogin.jsp' method='post'>
				<table style='width:70%'>
					<tr>
						<td style='width:30%'>User Name </td>
						<td style='width:70%'><input type=text name=user_id></td>
					</tr>
					<tr>
						<td>Password </td>
						<td><input type=password name=password></td>
					</tr>
					<tr>
						<td colspan='2' >
							<center>
								<input type=submit value="Login">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</center>
	</div>
<%@include file="htmlfooter.jsp"%>


<html>
	<head>
		<title>login</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	</head>
	<body>

	</body>
</html>