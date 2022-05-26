<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<html:html>
<head>
  <html:base/>
<title>操作员信息查看</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/userInfoAction.do?actionType=0");
}
</script>
</head>

<body >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：系统维护 → 用户维护 → 操作员信息查看</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="43">&nbsp;</td>
  </tr>
</table>

<table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">操作员信息查看</span></div></td>
      </tr>

      <logic:present name="object" scope="request">

      <tr>
        <td width="20%"  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;操作员ID</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="userId"/></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;操作员姓名</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="userName"/></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;密码</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="userPassword"/></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;所在机构</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="userDepId"/></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;电子邮件</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="userEmail"/></td>
        <td width="33%" class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;状态</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="userState"/></td>
        <td width="33%" class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;注册日期</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="userRegDate"/></td>
        <td width="33%" class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;备注</td>
        <td colspan="2" class="right" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="userRemark"/></td>
      </tr>

      </logic:present>

      <tr >
        <td height="24" colspan="3" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <input name="Submit3" type="button" class="ziti" value="返回" onclick="return RZback();">
        </div></td>
      </tr>
</table>

<p>　</p>
</body>
</html:html>
