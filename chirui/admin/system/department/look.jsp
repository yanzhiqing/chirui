<%
/**
 * ������ϸ��Ϣҳ��
 * <p>Title: admin/system/user/look.jsp </p>
 * <p>Description: 2006-06-03</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author eqzhou
 * @version 1.0
 */
%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<html:html>
<head>
  <html:base/>
<meta http-equive="Cache-Control" content="no-cache"/>
<title>������Ϣ�鿴</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/departmentAction.do?actionType=0");
}
</script>
</head>

<body >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;�����ڵ�λ�ã�ϵͳά�� �� �������� �� ������Ϣ�鿴</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="43"></td>
  </tr>
</table>

<table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">������Ϣ�鿴</span></div></td>
      </tr>

      <logic:present name="object" scope="request">

      <tr>
        <td  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��������</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="depId"/></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��������</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="depName"/></td>
      </tr>
      <!-- 
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;�ϼ�����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="depUpId"/></td>
      </tr>
       -->
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="depMaster"/></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��ַ</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="depAddress"/></td>
        <td width="33%" class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��ϵ�绰</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="depPhone"/></td>
        <td width="33%" class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��ע</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="depRemark"/></td>
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
