<%@page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<title>Cyendra Online Judge</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link href="/stylesheets/bootstrap.css" rel="stylesheet" type="text/css"/>
		<link href="/stylesheets/style.css" rel="stylesheet" type="text/css"/>
	</head>
	<script  src='/js/check_form.js'></script>
	<body id="wrapper">
		<div class="w">
			<marquee style="float:left:width:50%;" id="marquee"onmouseout="this.start()" onmouseover="this.stop()" scrollamount="2" scrolldelay="1" behavior="alternate">
				<span class="user user-green">cyendra 在线评测系统</span>
			</marquee>
			<ul class='navigation'>
<%	    
	if(session.getAttribute("login")==null) {
		out.print("<li><a href='/register.jsp' id='reg'>Register</a></li><li><span class='user-gray'>|</span></li><li><a href='/login.jsp' id='login'>Enter</a></li>");
	}	
	else {
		out.print("<li><a href='/common/logout.jsp' id='logout'>Logout</a></li><li><span class='user-gray'>|</span></li><li><a href='/common/updateinfo.jsp'>"+session.getAttribute("login").toString()+"</a></li>");
	}	
%>
			</ul></div><div class='w' id='preload_logo'>
<%
	if(session.getAttribute("login")==null) {
		out.print("<a class='fr' target='_blank' href='https://github.com/cyendra/CyOnlineJudge' style='margin-top:5px;'>");
		out.print("<img class='img_m topic_img' title='Fork me on Github.' alt='Fork me on Github.' src='/img/git.png' />");
		out.print("</a>");
	}
	else {
		out.print("<a class='fr' href='/avatar' style='margin-top:5px;'>");
		out.print("<img class='img_m topic_img' title='change picture' alt='change picture' src='/img/acm.jpeg' />");
		out.print("</a>");
	}
%>
			<a class='logo' href='/' title='Cyendra Online Judge'>
				<img src='/img/logo.jpg' alt='Cyendra Online Judge' />
			</a>
		</div>
		<div class="w">
			<div class="fr">
				<input type="text" style="padding:2px;margin:0;font-size:12px;" class="input-small" placeholder=" Problem ID" title="Problem ID">
				<a id="Go" class="uibtn" href="javascript:;">Go</a>
			</div>
			<ul class="navigation menu">
				<li><a href="/">Home</a></li>       	 
				<li><a href="/problem/problemlist.jsp">Problemset</a></li>        
				<li><a href="/">Status</a></li>        
				<li><a href="/board/ranklist.jsp">Ranklist</a></li>        
				<li><a href="/">Contest</a></li>
				<li><a href="/board/faq.jsp">FAQ</a></li>
				<li><a href="/forum/topics.jsp">Forum</a></li>
			</ul>
		</div>