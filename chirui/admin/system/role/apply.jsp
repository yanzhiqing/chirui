<%
/**
 * �����û���Ϣҳ��
 * <p>Title: admin/system/user/show.jsp </p>
 * <p>Description: 2006-06-08</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author ������
 * @version 1.0
 */
%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.model.admin.system.role.RoleInfoVO,crjd.common.SessionContainer" %>

<html:html>
<head>
  <html:base/>
<meta http-equiv="pragma" content="no-cache">
<title>��ɫ��Ϣ���</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
<script  language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script  language="javascript" src="<%=request.getContextPath()%>/script/message.js"></script>
<script  language="javascript" src="common.js"></script>
<script language="JavaScript" type="text/JavaScript">
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
   if(!rigorCheckValue(document.all["roleInfoVO.roleId"],1,1,8,0,"��ɫ����")){
     return false;
   }else if(!rigorCheckValue(document.all["roleInfoVO.roleName"],1,1,20,0,"��ɫ����")){
     return false;
   }
   return true;
}
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/roleInfoAction.do?actionType=0");
}
</script>

</head>

<body >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;�����ڵ�λ�ã�ϵͳά�� ����ɫά�� �� ��ɫ��Ϣ���</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="43">&nbsp;</td>
  </tr>
</table>

<html:form action="/roleInfoAction.do" method="post" focus="roleInfoVO.roleId">

  <input type="hidden" name="actionType" value="1"/>
  <table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">��ɫ��Ϣ���</span></div></td>
      </tr>
      <tr>
        <td width="25%" height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��ɫ����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="8" property="roleInfoVO.roleId" value="" onkeyup ="javascript:checkRoleId();"/>
          <span class="style1">*</span>&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��ɫ����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="20" property="roleInfoVO.roleName" value=""/>
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;��ע</td>
        <td class="right" bgcolor="#FFFFEC">&nbsp;
          <html:textarea cols="60" styleClass="shuru" rows="3" property="roleInfoVO.roleRemark" value="" onkeyup ="javascript:checkRoleRemark();"></html:textarea></td>
        <td width="33%" class="left" bgcolor="#FFFFEC">&nbsp;&nbsp; ���� 150</td>
      </tr>
      <tr bgcolor="#ECFBFF">
        <td height="27" colspan="3">&nbsp;<span class="ziti">�� <span class="style1">*</span> �����ݱ�����д</span></td>
      </tr>
      <tr >
        <td height="24" colspan="3" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <html:submit styleClass="ziti" value="ȷ��" onclick="return oncheck();"/>
            <!-- &nbsp;
            <html:reset styleClass="ziti" value="����"/> -->
            &nbsp;
            <html:button styleClass="ziti" value="ȡ��" property="Submit3" onclick="return RZback();"/>
        </div></td>
      </tr>
</table>

</html:form>
<p>��</p>
</body>
</html:html>
