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
<title>������������豸���޹�˾</title>
<style type="text/css">
<!--
*{border:0; margin:0 auto; padding:0;}
body {
	background-color:#D6D6D6;
	font-family:"΢���ź�";
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
�Գ����������ͽ���Ч��rigorCheckValue()����Զ���λ
����args1��������������磺document.form1.name.value
����args2�����Ƿ�Ϊ��:0����� 1����ǿ�
����args3�����������:1����"������< > ��string" �� 2����"number"�� 3����"float"�� 4����"date"����5����"ֻ�������ֺ���ĸ�����"
����args4�����ַ������ȣ�0����������
����args5��������С����λ��������float������Ч����0����������
����args6���������ʵ�����壬�Ա���׼ȷ֪ͨ�û���
*/
   if(!rigorCheckValue(document.all["userId"],1,1,8,0,"����ԱID")){
     return false;
   }else if(!rigorCheckValue(document.all["password"],0,1,30,0,"����")){
     return false;
   }else if(!rigorCheckValue(document.all["randnum"],1,2,4,0,"��֤��")){
     return false;
   }
   return true;
}
/*===================================================
���ܣ�ʹ����֤�루randnum��������������ǵ��ַ�
���룺
�����
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
    setTimeout("<%=(request.getAttribute("timeoutIsTure")!=null)?"alert('������ʱ�������µ�¼��')":""%>",500);
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
    <td width="50">��¼����</td>
    <td width="180" height="20"><input name="userId" type="text" class="textwith" /></td>
    <td ></td>
    <td ></td>
  </tr>
  <tr>
     <td ></td>
    <td width="50">�ܡ��룺</td>
    <td width="180" height="20"><input name="password" type="password" class="textwith" /></td>
      <td ></td>
      <td ></td>
  </tr>
    <tr>
    <td ></td>
    <td width="50">��֤�룺</td>
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
