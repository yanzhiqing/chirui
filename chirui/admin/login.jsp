<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/user-tag.tld" prefix="user-tag" %>
<%@ page contentType="text/html; charset=GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html:html>
<%
request.getSession().setAttribute("randNumimg", "6941");
%>
<head>
  <html:base/>
<meta http-equive="Cache-Control" content="no-cache"/>
<title>西安驰瑞机电设备有限公司</title>
<style type="text/css">
<!--
*{border:0; margin:0 auto; padding:0;}
body {
	background-color:#D6D6D6;
	font-family:"微软雅黑";
	 font-size:12px;
	 color:#0A76B0; 
	background-image:url(<%=request.getContextPath()%>/images/home/login/bg2.jpg);
	margin:60px auto;
	overflow:hidden;
}
.cenbg{ background-image:url(<%=request.getContextPath()%>/images/home/login/bg3.jpg); background-repeat:repeat-x}
.textwith{width:150px; height:20px; line-height:20px; box-shadow:inset 0 0 5px #06C;}
.textRandum{width:60px; height:20px; line-height:20px; box-shadow:inset 0 0 5px #06C;}
.wh{width:380px}
.wh1{width:450px}  
-->
</style>
<script  language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script  language="javascript" src="<%=request.getContextPath()%>/script/message.js"></script>
<script language="JavaScript" type="text/JavaScript">
function getRandnum(){
  document.all["randnum"].value="";
  document.all["imgRandnum"].src= "<%=request.getContextPath()%>/images/randimgload.gif";
  document.all["imgRandnum"].src= "<%=request.getContextPath()%>/getrandimage?time=" + Date();
}
function oncheck(){
/*
对常见数据类型进行效验rigorCheckValue()光标自动定位
参数args1代表参数对象，例如：document.form1.name.value
参数args2代表是否为空:0代表空 1代表非空
参数args3代表参数类型:1代表"不可有< > 的string" ， 2代表"number"， 3代表"float"， 4代表"date"代表，5代表"只能是数字和字母的组合"
参数args4代表字符串长度：0：代表不限制
参数args5代表数字小数点位数（仅对float类型有效）：0：代表不限制
参数args6代表参数的实际意义，以便能准确通知用户。
*/
   if(!rigorCheckValue(document.all["userId"],1,1,8,0,"操作员ID")){
     return false;
   }else if(!rigorCheckValue(document.all["password"],0,1,30,0,"密码")){
     return false;
   }else if(!rigorCheckValue(document.all["randnum"],1,2,4,0,"验证码")){
     return false;
   }
   return true;
}
/*===================================================
功能：使【验证码（randnum）】输入框输入半角的字符
输入：
输出：
===================================================*/
function checkRandnum() {
	DBCOnly(document.all["randnum"]);
}

</script>
</head>
<!--[if IE 6]>
<style type="text/css">
.wh{ width:580px; }
.wh1{ width:650px; }
.wh2{ width:580px; }
</style>
<![endif]-->
<body>
<SCRIPT LANGUAGE=JAVASCRIPT>
  if (top.location != self.location){
    top.location=self.location;
  }else{
    setTimeout("<%=(request.getAttribute("timeoutIsTure")!=null)?"alert('操作超时，请重新登录！')":""%>",500);
  }
</SCRIPT>
<html:form action="/loginAction.do" method="post" focus="userId">
<table width="100%" border="0" cellpadding="0" cellspacing="0"  class="cenbg"  >
  <tr>
<td align="center"  background="<%=request.getContextPath()%>/images/home/login/bg.jpg" width="1000"  height="626" style="background-repeat:no-repeat; background-position:center;"  >
<table width="1000" align="center"    >
  <tr>
    <td class="wh"  align="center" ></td>
    <td height="45"></td>
    <td height="45"></td>
     <td ></td>
     <td  >&nbsp;</td>
  </tr>
  <tr>
    <td ></td>
    <td width="50">登录名：</td>
    <td width="180" height="20"><input name="userId" type="text" class="textwith" /></td>
    <td ></td>
    <td ></td>
  </tr>
  <tr>
     <td ></td>
    <td width="50">密　码：</td>
    <td width="180" height="20"><input name="password" type="password" class="textwith" /></td>
      <td ></td>
      <td ></td>
  </tr>
    <tr>
    <td ></td>
    <td width="50">验证码：</td>
    <td width="180" height="20">
    	<input name="randnum" type="text" class="textRandum" onkeyup ="javascript:checkRandnum();"/>
		<img id="imgRandnum" src="<%=request.getContextPath()%>/servlet/getrandimage?time=<%=new Date()%>" width="80px;" height="20px;"/>
    </td>
    <td width="48"></td>
    <td>&nbsp;</td>
    </tr>

  <tr>
     <td ></td>
      <td ></td>
    <td height="10"></td>
    <td height="10"></td>
      <td >&nbsp;</td>
  </tr>
</table>
<table width="1000" align="center"  >
  <tr>
    <td class=" wh1" ></td>
    <td width="60">
    <input src="<%=request.getContextPath()%>/images/home/login/bot1.png"  type="image" tabindex="5" name="enter"  border="0" onclick="return oncheck();"/>
    </td>
    <td width="5"></td>
    <td width="60"><img src="<%=request.getContextPath()%>/images/home/login/bot2.png" border="0" usemap="#Map2" /></td>
    <td >&nbsp;</td>
  </tr>
</table>  
</td>
  </tr>
</table>
</html:form>
</body>
</html:html>
