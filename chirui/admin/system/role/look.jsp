<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<html:html>
<head>
  <html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��ɫ��Ϣ�鿴</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/roleInfoAction.do?actionType=0");
}
</script>
</head>

<body >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;�����ڵ�λ�ã�ϵͳά�� ����ɫά�� �� ��ɫ��Ϣ�鿴</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="height:50"></td>
  </tr>
</table>

<table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">��ɫ��Ϣ�鿴</span></div></td>
      </tr>

      <logic:present name="object" scope="request">

      <tr>
        <td width="25%"  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��ɫ����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="roleId"/></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��ɫ����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="roleName"/></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��ע</td>
        <td colspan="2" class="right" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="roleRemark"/></td>
      </tr>

      </logic:present>

      <tr >
        <td height="24" colspan="3" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <input name="Submit3" type="button" class="ziti" value="����" onclick="return RZback();">
        </div></td>
      </tr>
</table>

<p>��</p>
</body>
</html:html>
