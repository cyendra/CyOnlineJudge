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
			<div class="span6">
				<table id="addprob" class="table table-condensed tdcenter">
				<tr>
					<th style="width:5%;">
						<input type="button" href="" value="Add"/>
					</th>
					<th style="width:20%;">ProbNum</th>
					<th style="width:30%;">Alias</th>
					<th style="width:5%;"></th>
					<th style="text-align:left;">Title</th>
				</tr>
				<tr>
					<td>
						<input type="button" href="" value="Delete"/>
					</td>
					<td><input type="text" class="probnum input-mini" value=""  /></td>
					<td><input type="text" class="alias input-medium" value="" /></td>
					<td class="bold p_index">A</td>
					<td class="error-text title" style="text-align:left;"></td>
				</tr>
        
				</table>
			</div>
		</div>
		<div class="form-actions">
			<a style="margin-left:50%;" class="uibtn" href="javascript:;" id="submit">Submit</a>
			<span id="err" class="error-text"></span>
		</div>
	</div>
	
</fieldset>
</div>
<%@include file="/htmlfooter.jsp"%>