function check_time(obj){
	var c;
	var success=1;
	var i;
	var letter="1234567890-: "
	for(i=0;i<obj.length;i++){
		c=obj.charAt(i);
		if(letter.indexOf(c)<0)return false;
		
	}
	return true;

}

function check_num(obj){
	var c;
	var success=1;
	var i;
	var letter="1234567890"
	if(obj.length==0){
		alert("Can not be null!!");
		return false;	
	}
	for(i=0;i<obj.length;i++){
		c=obj.charAt(i);
		if(letter.indexOf(c)<0){
			alert("Format error!");
			return false;
		}
		
	}
	return true;
}

function check(obj){
	var success=1;
	if(obj.title.value.length==0){
		success=0;
	}
	if(obj.num.value.length==0){
		success=0;
	}
	if(success==0){
		alert("Can not be null!");
		return false;
	}
	string=obj.num.value;
	if(check_num(string)==false){
		alert("format error!");
		return false;
	}
	var string_1=obj.start_year.value+"-"+obj.start_month.value+"-"+obj.start_day.value+" "+obj.start_hour.value+":"+obj.start_min.value+":"+obj.start_sec.value;
	obj.start_time.value=string_1;
	var string_2=obj.end_year.value+"-"+obj.end_month.value+"-"+obj.end_day.value+" "+obj.end_hour.value+":"+obj.end_min.value+":"+obj.end_sec.value;
	obj.end_time.value=string_2;
	if(string_1>=string_2)
	{
		alert("start time must eariler than end time");
		return false;
	}
	
	return true;
}

function check_01(obj){
	
	var string=obj.value;
	if(check_num(string)==false){
		success=0;
		obj.value="";
		obj.focus();
		return false;
	}
	return true;
}

function chk_image(){ 
var img = document.getElementById("pic"); 
img.src = "Num.jsp?" + Math.random(); 
} 

function check_user(obj){
if(obj.user_id.value.length==0){
		alert("input can not be null!");
		obj.user_id.focus();
		return false;
	}
	if(obj.user_id.value.length<4){
		alert("user id must more than 6!");
		obj.user_id.focus();
		return false;
	}
	var letter="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_";
	var letter_char="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	var c,suc=0;
	for(i=0;i<obj.user_id.value.length;i++){
		c=obj.user_id.value.charAt(i);
		if(letter.indexOf(c)<0){
			alert("user id format error! use A~Z,a~z,0~9");
			obj.user_id.focus();
			return false;
		}
		if(letter_char.indexOf(c)>=0){
			suc=1;
		}
	}
	if(suc==0){
		alert("user id format error! use A~Z,a~z,0~9");
		obj.user_id.focus();
		return false;
	}
	return true;
}

function check_p(obj){
	if(check_user(obj)==false){
		return false;
	}
	/*
	for(i=0;i<obj.password.value.length;i++){
		c=obj.password.value.charAt(i);
		if(letter.indexOf(c)<0){
			alert("password format error! use A~Z,a~z,0~9");
			return false;
		}
	}
	*/
	if(obj.password.value!=obj.repassword.value){
		alert("password error!");
		obj.password.value="";
		obj.repassword.value="";
		obj.password.focus();
		return false;
	}
	else if(obj.password.value.length<6){
		alert("password length must longer than 6!");
		obj.password.focus();
		return false;
	}
	if(obj.checknum.value.length<=0){
		alert("input can not be null!");
		obj.checknum.focus();
		return false;
	}
	return true;
	
}

function check_login(obj){
	if(check_user(obj)==false){
		return false;
	}
	
	if(obj.password.value.length<6){
		alert("password length must longer than 6!");
		obj.password.value="";
		obj.password.focus();
		return false;
	}
	return true;
}