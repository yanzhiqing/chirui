//trim spaces with regular expression
String.prototype.trim = function()
{
	return this.replace(/(^\s*)|(\s*$)/g, "");
}

//Count string byte number, return integer
String.prototype.ByteCount = function()
{
	txt = this.replace(/(<.*?>)/ig,"");
	txt = txt.replace(/([\u0391-\uFFE5])/ig, "11");
	var count = txt.length;
	return count;
}

//filter keywords
function check_durty_words(thisinput)
{
	var durty_words = new Array("系统","管理","佳缘","master","版主","斑竹","龙女","客服","root","颁奖","活动","提示","兑奖","通知");
	for(i=0;i<durty_words.length;i++)
	{
		if (thisinput.indexOf(durty_words[i])	>=	0)
		{
			return durty_words[i];
		}
	}
	return false;
}

//mouse onclick the email box
function click_email_input(thisinput)
{
	regemailinfo.className = "show exactness";
	regemailinfo.innerHTML = "填写常用邮箱名，用于登陆";
}

//mouse lost the email box
function check_email_input(thisinput)
{
	var re = /^[_a-zA-Z0-9\-\.]+@([\-_a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,3}$/;
	if ( (thisinput.value.trim() == "") ) {
		regemailinfo.className = "show null";
		regemailinfo.innerHTML = "系统未检测到您的输入";
	}
	else if (!thisinput.value.match(re))
	{
		regemailinfo.className = "show err";
		regemailinfo.innerHTML = "输入不符合规范";
	}
	else
	{
		xajax_processFormEmail(xajax.getFormValues("Form1"));
	}
}

//mouse onclick the password box
function click_password_input(thisinput)
{
	regpassinfo.className = "show exactness";
	regpassinfo.innerHTML = "填写6～20位的密码";
}

//mouse lost the password box
function check_password_input(thisinput)
{
	var count = thisinput.value.trim().ByteCount();

	if (thisinput.value.trim() == "") {
		regpassinfo.className="show null";
		regpassinfo.innerHTML="系统未检测到您的输入";
	}
	else if (count < 6 || count > 20)
	{
		regpassinfo.className = "show err";
		regpassinfo.innerHTML = "输入不符合规范";
	}
	else
	{
		regpassinfo.className = "show exactness";
		regpassinfo.innerHTML = "内容符合规范，可以使用";
	}
}

//mouse onclick the chkpass box
function click_chkpass_input(thisinput)
{
	var oPass = Form1.password.value;
	if( oPass == "")
	{
		Form1.password.focus();
	}else{
		regpass2info.className="show exactness";
		regpass2info.innerHTML="请输入确认密码";
	}
}

//mouse lost the chkpass box
function check_chkpass_input(thisinput)
{
	var oPass = Form1.password.value;
	if(thisinput.value.trim() == "")
	{
		regpass2info.className="show null";
		regpass2info.innerHTML = "系统未检测到您的输入";
	}
	else if(thisinput.value != oPass)
	{
		regpass2info.className="show err";
		regpass2info.innerHTML = "确认密码与密码不一致";
	}
	else
	{
		regpass2info.className = "show exactness";
		regpass2info.innerHTML = "密码确认通过";
	}
}

//mouse onclick the nickname box
function click_nickname_input(thisinput)
{
	regnicknameinfo.className="show exactness";
	regnicknameinfo.innerHTML="昵称限制在10个汉字以内";
}

//mouse lost the nickname box
function check_nickname_input(thisinput)
{
	var filter = check_durty_words(thisinput.value.trim());
	var count = thisinput.value.trim().ByteCount();
	if( count == 0 )
	{
		regnicknameinfo.className="show null";
		regnicknameinfo.innerHTML="系统未检测到您的输入";
	}
	else if ((thisinput.value.trim() != "") && (count < 2 || count > 20)) {
		regnicknameinfo.className="show err";
		regnicknameinfo.innerHTML="输入不符合规范";
	}
	else if (filter)
	{
		regnicknameinfo.className = "show err";
		regnicknameinfo.innerHTML = "“"+filter+"”不能在昵称中使用";
	}
	else
	{
		regnicknameinfo.className = "show exactness";
		regnicknameinfo.innerHTML = "内容符合规范，可以使用";
	}
	/*else
	{
		xajax_processFormNickName(xajax.getFormValues("Form1"));
	}*/
}

//mouse onclick the height box
function click_height_input(thisinput)
{
	regheightinfo.className="show exactness";
	regheightinfo.innerHTML="请认真填写，注册后不可改";
}

//mouse lost the height box
function check_height_input(thisinput)
{
	var count = thisinput.value.trim().ByteCount();
	var rs = /^[0-9]{3}$/;

	if( count == 0 )
	{
		regheightinfo.className="show null";
		regheightinfo.innerHTML="系统未检测到您的输入";
	}
	else if((!thisinput.value.match(rs)) || (thisinput.value < 130 || thisinput.value > 260))
	{
		regheightinfo.className="show err";
		regheightinfo.innerHTML="输入不符合规范";
	}
	else
	{
		regheightinfo.className = "show exactness";
		regheightinfo.innerHTML = "内容符合规范，可以使用";
		
		if(document.getElementById('sexm').checked)
		{
			document.getElementById('needheight_max').value	=	thisinput.value-5;
		}
		if(document.getElementById('sexf').checked)
		{
			document.getElementById('needheight_min').value	=	parseInt(thisinput.value)+5;			
		}
	}
}

function check_age_input()
{
	var year	=	document.getElementById('year').value;
	var date = new Date();
	var now  = date.getYear();
	var age  = now - year;
	if(document.getElementById('sexm').checked)
	{
		document.getElementById('needage_min').value	=	age-7;
		if(document.getElementById('needage_min').value	<	18)
		{
			document.getElementById('needage_min').value	=	18;
		}
		document.getElementById('needage_max').value	=	age;
	}
	if(document.getElementById('sexf').checked)
	{
		document.getElementById('needage_min').value	=	age;
		document.getElementById('needage_max').value	=	parseInt(age)+7;
		if(document.getElementById('needage_max').value	>	99)
		{
			document.getElementById('needage_max').value	=	99;
		}
	}
}

//mouse onclick the workprovince box
function click_workprovince_input(thisinput)
{
	regworkareainfo.className="show exactness";
	regworkareainfo.innerHTML="请选择您所在的省份";
}

//mouse lost the workprovince box
function check_workprovince_input(thisinput)
{
	if( thisinput.value.trim() == 0 )
	{
		regworkareainfo.className="show null";
		regworkareainfo.innerHTML="系统未检测到您的输入";
	}
	else
	{
		regworkareainfo.className = "show null";
		regworkareainfo.innerHTML = "请选择您所在的城市";
	}
}

//mouse onclick the workcity box
function click_workcity_input(thisinput)
{
	regworkareainfo.className="show exactness";
	regworkareainfo.innerHTML="请选择您所在的城市";
}

//mouse lost the workcity box
function check_workcity_input(thisinput)
{
	if( thisinput.value.trim() == 0 )
	{
		regworkareainfo.className="show null";
		regworkareainfo.innerHTML="系统未检测到您的输入";
	}
	else
	{
		regworkareainfo.className = "show exactness";
		regworkareainfo.innerHTML = "内容符合规范，可以使用";
	}
}

/*
mouse onclick the checkcode box
function click_checkcode_input(thisinput)
{
	regcheckcodeinfo.className="show exactness";
	regcheckcodeinfo.innerHTML="请填写图片中的数字";
}
*/

//mouse lost the checkcode box
function check_checkcode_input(thisinput)
{
	if(thisinput	==	'force')
	{
		regcheckcodeinfo.className="show null";
		regcheckcodeinfo.innerHTML="请重新输入验证码";	
		return;	
	}


	var count = thisinput.value.trim().ByteCount();
	var rc = /^[0-9]{5}$/;


	if (count == 0)
	{
		regcheckcodeinfo.className="show null";
		regcheckcodeinfo.innerHTML="系统未检测到您的输入";
	}
	else if (!thisinput.value.match(rc))
	{
		regcheckcodeinfo.className="show err";
		regcheckcodeinfo.innerHTML="输入不符合规范";
	}
	else
	{
		regcheckcodeinfo.className = "show exactness";
		regcheckcodeinfo.innerHTML = "内容符合规范，可以使用";
	}
}

//mouse onclick the note textarea
function click_note_input(thisinput)
{
	regnoteinfo.className="show exactness";
	regnoteinfo.innerHTML="限20字到1000字之间";
}

//mouse lost the note textarea
function check_note_input(thisinput)
{
	if( thisinput.value.length == 0 )
	{
		regnoteinfo.className="show null";
		regnoteinfo.innerHTML="系统未检测到您的输入";
	}
	else if((thisinput.value != "") && (thisinput.value.length < 20 || thisinput.value.length > 1000))
	{
		regnoteinfo.className="show err";
		regnoteinfo.innerHTML="输入不符合规范";
	}
	else
	{
		regnoteinfo.className = "show exactness";
		regnoteinfo.innerHTML = "内容符合规范，可以使用";
	}
}

function check_mobile()
{
	var mobile	=	document.getElementById('mobile').value;
	if(mobile	==	'')
	{
		return true;
	}
	var div_obj		=	document.getElementById('mobile_div');
	var reg1=/^13\d{9}$/gi;
	var reg2=/^15\d{9}$/gi;

	if (reg1.test(mobile)==false	&&	reg2.test(mobile)==false)
	{
		div_obj.className	=	'show err';
		div_obj.innerHTML	=	'输入不符合规范';
		return false;
	}
	else
	{
		div_obj.className	=	'show exactness';
		div_obj.innerHTML	=	'内容符合规范，可以使用';
		return true;
	}
}

function check_needage()
{
	var neagemin	=	document.getElementById('needage_min').value;
	var neagemax	=	document.getElementById('needage_max').value;
	
	if(neagemin	==	''	&&	neagemax	==	'')
	{
		return true;
	}
	
	if(neagemin	==	'')
	{
		neagemin	=	0;
	}
	if(neagemax	==	'')
	{
		neagemax	=	0;
	}
	
	var div_obj		=	document.getElementById('needage_div');

	neagemin	=	parseInt(neagemin);
	neagemax	=	parseInt(neagemax);

	if((neagemin	<	18	&&	neagemin	!=	0)	||	neagemax	> 99)
	{
		div_obj.className	=	'show err';
		div_obj.innerHTML	=	'输入不符合规范';
		return false;
	}

	if(neagemin	!=	0	&&	neagemax	!=	0)
	{
		if(neagemax	<	neagemin)
		{
			div_obj.className	=	'show err';
			div_obj.innerHTML	=	'输入不符合规范';
			return false;
		}
	}
	div_obj.className	=	'show exactness';
	div_obj.innerHTML	=	'内容符合规范，可以使用';
	return true;
}

function check_needheight()
{
	var neheimin	=	document.getElementById('needheight_min').value;
	var neheimax	=	document.getElementById('needheight_max').value;
	
	if(neheimin	==	''	&&	neheimax	==	'')
	{
		return true;
	}
	
	if(neheimin	==	'')
	{
		neheimin	=	0;
	}
	if(neheimax	==	'')
	{
		neheimax	=	0;
	}
	
	var div_obj		=	document.getElementById('needheight_div');

	neheimin	=	parseInt(neheimin);
	neheimax	=	parseInt(neheimax);

	if((neheimin	<	130	&&	neheimin	!=	0)	||	neheimax	> 260)
	{
		div_obj.className	=	'show err';
		div_obj.innerHTML	=	'输入不符合规范';
		return false;
	}

	if(neheimin	!=	0	&&	neheimax	!=	0)
	{
		if(neheimax	<	neheimin)
		{
			div_obj.className	=	'show err';
			div_obj.innerHTML	=	'输入不符合规范';
			return false;
		}
	}
	div_obj.className	=	'show exactness';
	div_obj.innerHTML	=	'内容符合规范，可以使用';
	return true;
}

//Check submit form error
function chkForm_new(objForm){
	var objForm;
	var re = /^[_a-zA-Z0-9\-\.]+@([\-_a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,3}$/;
	//var rs = /^[0-9]{3}$/;
	var rs = /^[0-9]{2,3}$/;
	var rc = /^[0-9]{4}$/;

	var email		 = objForm.hyemail.value;
	var password	 = objForm.password.value;
	var nickname	 = objForm.nc.value;
	//var csny         = objForm.csny.value;
	var year		 = objForm.year.value;
	var month		 = objForm.month.value; 
	var day		     = objForm.day.value; 
	var height	     = objForm.sg.value;
	var marriage	 = objForm.hyzk.value;
	var degree	     = objForm.xl.value;
	var income	     = objForm.yx.value;
	var province	 = objForm.szdq.value;
	var city		 = objForm.szdqs.value;
	var checkcode	 = objForm.yzm.value;
	var note		 = objForm.nxdb.value;
	
	var date = new Date();
	var now  = date.getYear();
	var age  = now - year;
	var filter = check_durty_words(objForm.nc.value);
	

 	for(var i=0;i<email.length;i++)
 	{   
 	   strCode=email.charCodeAt(i);   
 	   if((strCode>65248)||(strCode==12288)){   
 	             alert("【注册邮箱】含全角字符，请切换输入法，输入半角字符");
 	             objForm.hyemail.focus();
 	           return false;
 	   } 
 	}  
 	
	if (email == "" || (!email.match(re)))
	{
		alert("【注册邮箱】不能为空或格式不符合规范\n");
		objForm.hyemail.focus();
		return false;
	}

 


	if (password == "" || (password.length < 6 || password.length > 20))
	{
		alert("【聚缘密码】不能为空或长度不符合规范\n");
		objForm.password.focus();
		return false;
	}

	if (objForm.password.value != objForm.repassword.value)
	{
		alert("【确认密码】与密码不一致\n");
		objForm.repassword.focus();
		return false;
	}

	if (nickname == "" || (nickname.trim().ByteCount()<2 || nickname.trim().ByteCount()>12))
	{
		alert("【会员昵称】不能为空或格式不符合规范\n");
		objForm.nc.focus();
		return false;
	}

	if (filter)
	{
		alert("“"+filter+"”不能在昵称中使用\n");
		objForm.nc.focus();
		return false;
	}

	if(!(document.getElementById("sexf").checked || document.getElementById("sexm").checked))
	{
		//regsexinfo.className="show err";
		//regsexinfo.innerHTML="性别、生日、身高不能修改，请认真填写。";
		alert("请选择您的【性别】<性别、生日、身高注册后不能修改>\n");
		return false;
	}
	if (marriage == 0)
	{
		objForm.hyzk.focus();
		alert("请选择【婚姻状况】\n");
		return false;
	}
	if (province == 0)
	{
		alert("请选择【所在地区】 - 省份\n");
		objForm.szdq.focus();
		return false;
	}

	if (city == 0)
	{
		alert("请选择【所在地区】 - 城市\n");
		objForm.szdqs.focus();
		return false;
	}
	
	if (year == 0)
	{
		alert("请选择【出生年月】 - 年\n");
		objForm.year.focus();
		return false;
	}

	if (month == 0) 
	{
		alert("请选择【出生年月】 - 月\n");
		objForm.month.focus();
		return false;
	}

	if (day == 0)
	{
		alert("请选择【出生年月】 - 日\n");
		objForm.day.focus();
		return false;
	}

	if (height == "" || (!height.match(rs))  || (height < 60 || height > 260))
	{
		alert("【我的身高】不能为空或数值不符合规范\n");
		objForm.sg.focus();
		return false;
	}



	if (degree == 0)
	{
		alert("请选择【学历】\n");
		objForm.xl.focus();
		return false;
	}

	if (income == 0)
	{
		alert("请选择【月薪】\n");
		objForm.yx.focus();
		return false;
	}

	if (age <= 19)
	{
		if(income >= 40)
		{
			alert("【出生年月】对应的【月薪】不符合实际情况\n");
			objForm.yx.focus();
			return false;
		}
		if (degree >= 50)
		{
			alert("【出生年月】对应的【学历】不符合实际情况\n");
			objForm.xl.focus();
			return false;
		}		
		if (document.getElementById("sexf").checked && marriage >= 2)
		{
			alert("【出生年月】对应的【婚姻状况】不符合实际情况\n");
			objForm.year.focus();
			return false;
		}
		if (document.getElementById("sexm").checked && marriage >= 2)
		{
			alert("【出生年月】对应的【婚姻状况】不符合实际情况\n");
			objForm.year.focus();
			return false;
		}
	}
	else if (age <= 20)
	{
		if(income >= 40)
		{
			alert("【出生年月】对应的【月薪】不符合实际情况\n");
			objForm.yx.focus();
			return false;
		}
		if (degree >= 50)
		{
			alert("【出生年月】对应的【学历】不符合实际情况\n");
			objForm.xl.focus();
			return false;
		}		
		if (document.getElementById("sexf").checked && marriage >= 2)
		{
			alert("【出生年月】对应的【婚姻状况】不符合实际情况\n");
			objForm.year.focus();
			return false;
		}
		if (document.getElementById("sexm").checked && marriage >= 2)
		{
			alert("【出生年月】对应的【婚姻状况】不符合实际情况\n");
			objForm.year.focus();
			return false;
		}
	}
	/*else if (age <= 21)
	{
		if (degree >= 60 && income >= 40)
		{
			alert("【出生年月】对应的【学历】【月薪】都不符合实际情况\n");
			objForm.degree.focus();
			return false;
		}
		if (degree >= 60)
		{
			alert("【出生年月】对应的【学历】不符合实际情况\n");
			objForm.degree.focus();
			return false;
		}
		if (income >= 40)
		{
			alert("【出生年月】对应的【月薪】不符合实际情况\n");
			objForm.income.focus();
			return false;
		}
		if (document.getElementById("sexm").checked && marriage >= 2)
		{
			alert("【出生年月】对应的【婚姻状况】不符合实际情况\n");
			objForm.year.focus();
			return false;
		}
	}
	else if (age <= 22)
	{
		if (document.getElementById("sexm").checked && marriage >= 2)
		{
			alert("【出生年月】对应的【婚姻状况】不符合实际情况\n");
			objForm.year.focus();
			return false;
		}
		if (income >= 50)
		{
			alert("【出生年月】对应的【月薪】不符合实际情况\n");
			objForm.income.focus();
			return false;
		}
	}
	else if (age <= 23 && (degree >= 70))
	{
		alert("【出生年月】对应的【学历】不符合实际情况\n");
		objForm.degree.focus();
		return false;
	}
	else if (age <= 26 && income >= 70)
	{
		alert("【出生年月】对应的【月薪】不符合实际情况\n");
		objForm.income.focus();
		return false;
	}
	else
	{
		//虚假用户判断完毕
	}*/



	if (checkcode == "" || (!checkcode.match(rc)))
	{
		alert("【验证码】不能为空或字符不符合规范\n");
		objForm.yzm.focus();
		return false;
	}

	if (note != "" && (note.length < 30 || note.length >500))
	{
		alert("【内心独白】长度不符合规范\n");
		objForm.nxdb.focus();
		return false;
	}

	if (note == "")
	{
		alert("请您补充【内心独白】，打动有缘人\n");
		objForm.nxdb.focus();
		return false;
	}
	/*if(!check_mobile())
	{
		document.getElementById('mobile').focus();
		alert("请填写正确的手机号");
		return false;
	}*/

	if(!document.getElementById("readme").checked)
	{
		//regreadmeinfo.className="show err xianding";
		//regreadmeinfo.innerHTML="必须同意本条款才能注册";
		alert("您必须同意【聚缘会员服务条款】才能完成注册\n");
		return false;
	}

	return true;
}

function default_focus(objName)
{
	eval("document.Form1."+objName+".focus();");
}
