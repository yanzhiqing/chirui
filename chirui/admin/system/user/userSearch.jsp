<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.model.admin.system.user.UserInfoVO,crjd.common.SessionContainer" %>

<html:html>
<head>
  <html:base/>
<title>操作员信息查询</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>

<script  language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script  language="javascript" src="<%=request.getContextPath()%>/script/message.js"></script>
<script language="JavaScript" type="text/JavaScript">
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
    <td class="wudi">&nbsp;您现在的位置：系统维护 → 用户维护 → 操作员信息查询</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="43">&nbsp;</td>
  </tr>
</table>

<html:form action="/userInfoAction.do" method="post" focus="userInfoVO.userId">

  <input type="hidden" name="actionType" value="7"/>

<table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">操作员信息查询</span></div></td>
      </tr>
      <tr>
        <td width="30%"  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;操作员ID</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="8" property="userInfoVO.userId" value=""/>
          <span class="style1"></span>&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;操作员姓名</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="userInfoVO.userName" value="" maxlength="30"/>
          <span class="style1"></span></td>
      </tr>

      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;所在机构</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="8" property="userInfoVO.userDepId" value="" maxlength="30"/>
          <span class="style1"></span></td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;状态</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
          <html:select styleClass="shuru" property="userInfoVO.userState" value="" style="width:100pt ">
            <html:option value="">请选择</html:option>
            <html:option value="0">正常</html:option>
            <html:option value="1">挂起</html:option>
          </html:select>
          <span class="style1"></span></td>
        <td class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;备注</td>
        <td class="right" bgcolor="#FFFFEC">&nbsp;
          <html:textarea cols="60" styleClass="shuru" rows="3" property="userInfoVO.userRemark" value="" onkeyup ="javascript:checkUserRemark();"></html:textarea></td>
        <td width="33%" class="left" bgcolor="#FFFFEC">&nbsp;&nbsp; 限字 150</td>
      </tr>

      <tr >
        <td height="24" colspan="3" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <html:submit styleClass="ziti" value="查询"/>
            &nbsp;
            <html:reset styleClass="ziti" value="重置"/>
            &nbsp;
            <html:button styleClass="ziti" value="取消" property="Submit3" onclick="return RZback();"/>
        </div></td>
      </tr>
</table>

</html:form>
<p>　</p>
</body>
</html:html>
