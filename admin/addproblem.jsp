<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>

<div class="w" id="xbody">

<fieldset>
	<div><legend>添加题目</legend></div>
</fieldset>
<center>
<form enctype='multipart/form-data' action='' method='post'>
	<table style='width:80%'>
		<tr>
			<td>title: <input type=text name='title'></td>
		</tr>
		<tr>
			<td>time_limit: <input type=text name='time_limit' value='1000'> MS</td>
		</tr>
		<tr>
			<td>memory_limit: <input type=text name='memory_limit' value='65536'> K</td>
		</tr>
		<tr>
			<td>description :</td>
		</tr>
		<tr>
			<td><textarea style= 'width:530px' rows='5' name='description'></textarea></td>
		</tr>
		<tr>
			<td>input :</td>
		</tr>
		<tr>
			<td><textarea style= 'width:530px' rows='5' name='input'></textarea></td>
		</tr>
		<tr>
			<td>output :</td>
		</tr>
		<tr>
			<td><textarea style= 'width:530px' rows='5' name='output'></textarea></td>
		</tr>
		<tr>
			<td>sample_input :</td>
		</tr>
		<tr>
			<td><textarea style= 'width:530px' rows='3' name='sample_input'></textarea></td>
		</tr>
		<tr>
			<td>sample_output :</td>
		</tr>
		<tr>
			<td><textarea style= 'width:530px' rows='3' name='sample_output'></textarea></td>
		</tr>
		<tr>
			<td>hint :</td>
		</tr>
		<tr>
			<td><textarea style= 'width:530px' rows='2' name='hint'></textarea></td>
		</tr>
		<tr>
			<td>source :</td>
		</tr>
		<tr>
			<td><textarea style= 'width:530px' rows='2' name='source'></textarea></td>
		</tr>
		<tr>
            <td width=30%>
				upload datain&nbsp&nbsp:<input type='file' name='file1' id='file1' size='20'maxlength='20'>
			</td>
		</tr>
		<tr>
			<td width=30%>
				upload dataout :<input type='file' name='file2' id='file2' size='20'maxlength='20'>
			</td>						    	
		</tr>	
		<tr>
			<td>
				<center><input type=submit value='submit'> <input type=reset value='reset'></center>
			</td>
		</tr>
	</table>
</form>
</center>

</div>

<%@include file="/htmlfooter.jsp"%>