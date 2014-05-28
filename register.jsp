<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.*"%>
<%@include file="htmlheader.jsp"%>
<div class="w" id="xbody">
	<center><form action='common/getRegister.jsp' method='post' onsubmit='return check_p(this)' >
		<table style='width:70%'>
			<tr>
				<td style='width:30%'>User :</td>
				<td style='width:70%'><input type='text' name='user_id' /></td>
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
				<td><input type='text' name='nick' size='50' /></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><input type='text' name='email' size='40' /></td>
			</tr>
			<tr>
				<td>School :</td>
				<td><input type='text' name='school' size='40' /></td>
			</tr>
			<tr>
				<td><img id='pic' border=0 src='Num.jsp' onclick='return chk_image();' alt='30'></td>
				<td><input type='text' name='checknum'>看不清点击图片</td>
			</tr>
			<tr>
				<td colspan='2' >
					<center>
						<input type='submit' value='submit'  />
						<input type='reset' value=reset />
					</center>
				</td>
			</tr>
		</table>
	</form></center>
</div>

<%@include file="htmlfooter.jsp"%>