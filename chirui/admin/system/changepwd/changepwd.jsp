<%
/**
 * 系统管理  修改用户密码页面
 * <p>Title: /admin/system/changepwd/changepwd.jsp </p>
 * <p>Description: 2006-10-17</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author 陈应祥
 * @version 1.0
 */
%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="crjd.model.admin.system.changepwd.ChangePWD" %>
<%@ page import="crjd.common.SessionContainer" %>
<%@ page contentType="text/html; charset=GBK" %>
<html:html>
<head>
<html:base/>
<title>修改用户密码</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<script  language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script language="JavaScript" type="text/javascript">
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
  if(document.all["oldpassword"].value==""){
     alert("旧密码不能为空!");
	 document.all["oldpassword"].focus();
	 return false;
  }
  if(document.all["newpassword"].value==""){
     alert("新密码不能为空!");
	 document.all["newpassword"].focus();
	 return false;
  }
  if(document.all["newpassword"].value!=document.all["renewpassword"].value){
     alert("新密码和确认密码不匹配!");
	 document.all["renewpassword"].focus();
	 return false;
  }
   return true;
}
</script>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：系统维护 → 密码修改</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<br><br><br></td>
  </tr>
</table>
<%
SessionContainer sc = (SessionContainer)session.getAttribute("sessionContainer");
String oldpassword=request.getParameter("oldpassword");
String newpassword=request.getParameter("newpassword");
String Userid = request.getParameter("Userid");
if(sc==null){
  out.println("您的操作已经超时，请重新登录系统！");
}else if(newpassword == null || newpassword.equals("")){
%>
    <form name="frm_changepwd" method="post" action="" onSubmit="return oncheck();">
<table width="60%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
  <td height="23" colspan="2" class="ziti"  background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">用户密码修改</span></div></td>
  <tr>
    <td width="16%" align="right"  bgcolor="#ECFBFF"><span class="ziti">用户登录ID：&nbsp;</span></td>
    <td width="34%" bgcolor="#FFFFEC">&nbsp;&nbsp;<%=sc.getUserID()%>
      <input name="Userid" type="hidden" value="<%=sc.getUserID()%>"></td>
  </tr>
  <tr>
    <td width="16%" align="right"  bgcolor="#ECFBFF"><span class="ziti">请输入旧密码：&nbsp;</span></td>
    <td width="34%" bgcolor="#FFFFEC">&nbsp;
        <input name="oldpassword" type="password" class="shuru" id="oldpassword" size="20" maxlength="15">&nbsp;<span class="style1">*</span></td>
  </tr>
  <tr>
    <td width="16%" align="right"  bgcolor="#ECFBFF"><span class="ziti">请输入新密码：&nbsp;</span></td>
    <td width="34%" bgcolor="#FFFFEC">&nbsp;
        <input name="newpassword" type="password" class="shuru" id="newpassword" size="20" maxlength="15">&nbsp;<span class="style1">*</span></td>
  </tr>
  <tr>
    <td width="16%" align="right"  bgcolor="#ECFBFF"><span class="ziti">确认新密码：&nbsp;</span></td>
    <td bgcolor="#FFFFEC">&nbsp;
        <input name="renewpassword" type="password" class="shuru" id="renewpassword" size="20" maxlength="15">&nbsp;<span class="style1">*</span></td>
  </tr>
   <tr>
  <td height="22" colspan="2"  background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
    <input type="submit" name="Submit" value="提  交">&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
   </tr>
   </table>
  </form>
<%
}else{
ChangePWD changePwd = new ChangePWD(application);
boolean validateOldpwd = changePwd.validateOldpwd(oldpassword,Userid);
if(validateOldpwd){
  changePwd.setNewpwd(newpassword,Userid);
}
%>
<table width="60%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
  <tr>
    <td width="16%" height="50" align="center"  bgcolor="#ECFBFF"><p>&nbsp;</p>
      <p>&nbsp;</p>
      <p><%=validateOldpwd?"<font color=green>您的密码修改成功，请记住新密码！</font>":"<font color=red>旧的密码输入有误，密码修改失败！</font>"%>
      </p>
      <p></p>
      <p><a href="changepwd.jsp">返回</a></p>
      <p>&nbsp;</p></td>
</table>

<%
}
%>

  </body>
</html:html>
