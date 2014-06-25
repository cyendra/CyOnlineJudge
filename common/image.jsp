<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<div class="w" id="xbody">
<center>

<form action="/ImgServlet" encType='multipart/form-data' method=post > 
<input type="file" name="image" style="width: 330px; height: 23px; font-size: 16px"> 
<input type="submit" name="upload" id="upload" value="上传" style="width: 70px; height: 25px"> 
</form> 
</center>

</div>
<%@include file="/htmlfooter.jsp"%>