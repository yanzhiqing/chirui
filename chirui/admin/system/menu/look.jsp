<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<html:html>
<head>
  <html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>菜单信息查看</title>
<link href="../../../css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/menuAction.do?actionType=0");
}
</script>
</head>

<body >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：系统维护 → 菜单维护 → 菜单信息查看</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="height:50"></td>
  </tr>
</table>
<table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">菜单信息查看</span></div></td>
      </tr>

      <logic:present name="object" scope="request">

      <tr>
        <td  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;菜单编码</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="menuId"/></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;菜单名称</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="menuName"/></td>
      </tr>

      <tr>
        <td  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;菜单URL</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="menuUrl"/></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;上级菜单</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="menuUpId"/></td>
      </tr>

      <tr>
        <td  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;菜单模块</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="menuCol1"/></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;备注</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="menuRemark"/></td>
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
