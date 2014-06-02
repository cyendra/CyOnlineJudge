<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="/htmlheader.jsp"%>
<%
	int proId = 1;
	if (request.getParameter("id")!=null) {
		proId = Integer.parseInt(request.getParameter("id"));
	}
%>
<div class="w" id="xbody">
<fieldset>
	<div class="form-horizontal">
    <div><legend>代码提交</legend></div>
    <div class="control-group">
		<label class="control-label" for="pid">Problem:</label>
		<div class="controls">
			<input type="search" class="input-mini" id="pid" value="<%=proId%>" >
			<span class="help-inline error-text" id="error"></span>
		</div>
    </div>
	<div class="control-group">
		<label class="control-label" for="lang">Language:</label>
		<div class="controls">
			<select class="input-small" id="lang">
				<option value='1' >C</option>
				<option value='2' selected="selected">C++</option>
			</select>
		</div>
    </div>
    <div class="control-group">
		<label class="control-label" for="code">Source Code:</label>
		<div class="controls">
			<textarea rows="25" class="span7" id="code"></textarea>
		</div>
    </div>
    <div class="form-actions">
		<a id="submit" class="uibtn" href="">Submit</a>
    </div>
	</div>
<fieldset>
</div>
<%@include file="/htmlfooter.jsp"%>