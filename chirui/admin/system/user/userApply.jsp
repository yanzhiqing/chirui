<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/user-tag.tld" prefix="user-tag" %>
<%@ page contentType="text/html; charset=GBK" %>

<html:html>
<head>
  <html:base/>
<title>操作员信息添加</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>

<script  language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script  language="javascript" src="<%=request.getContextPath()%>/script/message.js"></script>
<script language="JavaScript" type="text/JavaScript">
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

   var passwd1 =  document.all["userInfoVO.userPassword"].value;
   var passwd2 =  document.all["userPassword2"].value;

   if(!rigorCheckValue(document.all["userInfoVO.userId"],1,1,32,0,"操作员ID")){
     return false;
   }else if(!rigorCheckValue(document.all["userInfoVO.userName"],1,1,20,0,"操作员姓名")){
     return false;
   }else if(passwd1 != passwd2|| passwd1.length < 6){
        if(passwd1.length < 6){
   			alert("密码长度至少为6位");
   			document.all["userInfoVO.userPassword"].focus();
   			return false;
   		}
   		
   		if(passwd1 != passwd2){
    	alert("两次输入的密码不一致，请重新输入！");
   		document.all["userInfoVO.userPassword"].value="";
   		document.all["userPassword2"].value="";
        document.all["userInfoVO.userPassword"].focus();
        return false;
       }
   }else if(!rigorCheckValue(document.all["userInfoVO.userDepId"],1,1,8,0,"所在机构")){
     return false;
   }else if(document.all["userInfoVO.userEmail"].value.length > 0){
     if(!isEmailAlt(document.all["userInfoVO.userEmail"].value,"电子邮件")){
     	return false;
     }
   }else if(!rigorCheckValue(document.all["userInfoVO.userState"],1,1,5,0,"状态")){
     return false;
   }else if(!rigorCheckValue(document.all["userInfoVO.userRemark"],0,1,1000,0,"备注")){
     return false;
   }
   return true;
}
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/userInfoAction.do?actionType=0");
}

/*===================================================
功能：使【备注（roleInfoVO.roleRemark）】输入框只能输入
      最大长度为maxlen的信息
输入： 
输出：
作者：李永祥
===================================================*/
function checkUserRemark() {
	var maxlen = 150;
	var obj = document.all["userInfoVO.userRemark"];

	checkMaxlen(obj,maxlen);

	return;
}
</script>

</head>

<body >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：系统维护 → 用户维护 → 操作员信息添加</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="43">&nbsp;</td>
  </tr>
</table>

<html:form action="/userInfoAction.do" method="post" focus="userInfoVO.userId">

  <input type="hidden" name="actionType" value="1"/>

<table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">操作员信息添加</span></div></td>
      </tr>
      <tr>
        <td width="30%"  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;操作员ID</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="32" property="userInfoVO.userId" value=""/>
          <span class="style1">*</span>&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;操作员姓名</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="20" property="userInfoVO.userName" value=""/>
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;密码</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:password styleClass="shuru" maxlength="32" property="userInfoVO.userPassword" value=""/>
          <span class="style1"></span></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;确认密码</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <input type="password" class="shuru" maxlength="32" name="userPassword2"/>
          <span class="style1"></span></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;所在机构</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <user-tag:department property="userInfoVO.userDepId" upDepartmentId="" value="" styleClass="shuru" />
          <!--html:text styleClass="shuru" maxlength="8" property="userInfoVO.userDepId" value=""/-->
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;电子邮件</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="50" property="userInfoVO.userEmail" value=""/>
          <span class="style1"></span></td>
        <td class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;状态</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
          <html:select styleClass="shuru" property="userInfoVO.userState" value="" style="width:100pt ">
            <html:option value="">--请选择--</html:option>
            <html:option value="0">正常</html:option>
            <html:option value="1">挂起</html:option>
          </html:select>
          <span class="style1">*</span></td>
        <td class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;备注</td>
        <td class="right" bgcolor="#FFFFEC">&nbsp;
          <html:textarea cols="60" styleClass="shuru" rows="3" property="userInfoVO.userRemark" value="" onkeyup ="javascript:checkUserRemark();"></html:textarea></td>
        <td width="33%" class="left" bgcolor="#FFFFEC">&nbsp;&nbsp; 限字 150</td>
      </tr>
      <tr bgcolor="#ECFBFF">
        <td height="27" colspan="3">&nbsp;<span class="ziti">加 <span class="style1">*</span> 的内容必须填写</span></td>
      </tr>
      <tr >
        <td height="24" colspan="3" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <html:submit styleClass="ziti" value="确定" onclick="return oncheck();"/>
            <!-- &nbsp;
            <html:reset styleClass="ziti" value="重置"/> -->
            &nbsp;
            <html:button styleClass="ziti" value="取消" property="Submit3" onclick="return RZback();"/>
        </div></td>
      </tr>
</table>

</html:form>
<p>　</p>
</body>
</html:html>
