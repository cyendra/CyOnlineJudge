<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="/htmlheader.jsp"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="db.dbConn" scope="page"/>
<div class="w"  id="xbody">
<fieldset>
	<div>
		<legend id="addcontest">Add Contes</legend>
	</div>
	<div class="form-horizontal" id="form">
		<div class="row-fluid" style="min-height:460px;">
			<div class="span6">
				<table class="table table-bordered thright" style="background:#f9f9f9;">
					<tr>
						<th>Title: </th>
						<td><input id="Title" type="text" class="input-xlarge"></td>
					</tr>
					<tr>
						<th>Begin Time: </th>
						<td>
							<input id="datepicker" type="text" class="input-small" value="">
							<input id="hour" maxlength="2" type="text" class="input-mini" value="0"> :
							<input id="min" maxlength="2" type="text" class="input-mini" value="0"> : 00
						</td>
					</tr>
					<tr>
						<th>Length: </th>
						<td>
							<input id="dd" maxlength="2" type="text" class="input-mini" value="0"> 天
							<input id="hh" maxlength="2" type="text" class="input-mini" value="5"> :
							<input id="mm" maxlength="2" type="text" class="input-mini" value="0"> : 00
						</td>
					</tr>
					<tr>
						<th>Password: </th>
						<td>
							<input id="psw" type="password" class="input-large" ><br/>
							<span class="text-info">&nbsp;Leave blank to make it Public.</span>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<textarea id="desc" type="text" rows="5" class="input-xlarge"></textarea>
						</td>
					</tr>
					<tr>
						<th>Announcement: </th>
						<td>
							<textarea id="anc" type="text" rows="4" class="input-xlarge"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<% String test="asdf"; %>
<script type="text/javascript">
var num = 1
function delRow(obj) {
	var row = obj.parentNode.parentNode;
	var tb = row.parentNode; //当前表格
	var rowIndex = row.rowIndex; //A标签所在行下标
    tb.deleteRow(rowIndex); //删除当前行
	num-=1
	//alert(num);
	for (var i=1; i<num; i++) {
		var x=document.getElementById('addprob').rows[i]
		//alert(x.innerHTML);
		var cl = x.cells[3];
		//alert(cl.innerHTML);
		cl.innerHTML=i
	}
}
function insRow() {
	var x=document.getElementById('addprob').insertRow(num)
	var y0=x.insertCell(0)
	var y1=x.insertCell(1)
	var y2=x.insertCell(2)
	var y3=x.insertCell(3)
	var y4=x.insertCell(4)
	y0.innerHTML="<input type='button' href='' value='Delete' onclick='delRow(this)'/>"
	y1.innerHTML="<input type='text' class='probnum input-mini' value=''/>"
	y2.innerHTML="<input type='text' class='alias input-medium' value=''/>"
	y3.innerHTML=num
	y4.innerHTML="<%=test%>"
	num=num+1
}

</script>
			<div class="span6">
				<table id="addprob" class="table table-condensed tdcenter">
				<tr>
					<th style="width:5%;">
						<input type="button" href="" value="  Add  " onclick="insRow()"/>
					</th>
					<th style="width:20%;">ProbNum</th>
					<th style="width:30%;">Alias</th>
					<th style="width:5%;"></th>
					<th style="text-align:left;">Title</th>
				</tr>
				</table>
			</div>
		</div>
		<div class="form-actions">
			<a style="margin-left:50%;" class="uibtn" href="" id="submit">Submit</a>
			<span id="err" class="error-text"></span>
		</div>
	</div>
	
</fieldset>
</div>
<%@include file="/htmlfooter.jsp"%>