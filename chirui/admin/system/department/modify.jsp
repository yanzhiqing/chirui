<%
/**
 * �޸Ļ�����Ϣҳ��
 * <p>Title: admin/system/user/show.jsp </p>
 * <p>Description: 2006-06-01</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author eqzhou
 * @version 1.0
 */
%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/user-tag.tld" prefix="user-tag" %>
<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.model.admin.system.department.DepartmentVO,crjd.common.SessionContainer" %>
<html:html>
<head>
  <html:base/>
<meta http-equive="Cache-Control" content="no-cache"/>
<title>������Ϣ�޸�</title>
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

   if(!rigorCheckValue(document.all["departmentVO.depId"],1,1,8,0,"��������")){
     return false;
   }else if(!rigorCheckValue(document.all["departmentVO.depName"],1,1,20,0,"��������")){
     return false;
   }
   /*
   else if(!rigorCheckValue(document.all["departmentVO.depUpId"],1,1,8,0,"�ϼ�����")){
     return false;
   }
   */
   return true;
}
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/departmentAction.do?actionType=0");
}
</script>
</head>

<%
DepartmentVO departmentVO = (DepartmentVO)request.getAttribute("object");
if( departmentVO == null){
  departmentVO = new DepartmentVO();
}
%>

<body >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;�����ڵ�λ�ã�ϵͳά�� �� �������� �� ������Ϣ�޸�</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="43">&nbsp;</td>
  </tr>
</table>

<html:form action="/departmentAction.do" method="post" focus="departmentVO.depName">

  <input type="hidden" name="actionType" value="5"/>

<table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">������Ϣ�޸�</span></div></td>
      </tr>

      <html:hidden property="departmentVO.depRowId" value="<%=departmentVO.getDepRowId()%>"/>

      <tr>
        <td  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��������</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <%=departmentVO.getDepId()%>
          <html:hidden property="departmentVO.depId" value="<%=departmentVO.getDepId()%>" onkeyup ="javascript:checkDepId();"/>
          <span class="style1"></span>&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��������</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="20" property="departmentVO.depName" value="<%=departmentVO.getDepName()%>"/>
          <span class="style1">*</span></td>
      </tr>
      <!--  
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;�ϼ�����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <user-tag:department property="departmentVO.depUpId" upDepartmentId="" style="width=133px;"  value="<%//=departmentVO.getDepUpId()%>" styleClass="shuru" />
          <span class="style1">*</span></td>
      </tr>
      -->
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="30" property="departmentVO.depMaster" value="<%=departmentVO.getDepMaster()%>"/>
          <span class="style1"></span></td>
      </tr>
      <tr>
       <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;��ϵ�绰</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="50" property="departmentVO.depPhone" onkeyup ="javascript:checkDepPhone();" value="<%=departmentVO.getDepPhone()%>"/>
          <span class="style1"></span></td>
        <td class="left" bgcolor="#FFFFEC">&nbsp;</td> 
      </tr>
      <tr>
		<td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��ַ</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="200" style="width:286pt" property="departmentVO.depAddress" value="<%=departmentVO.getDepAddress()%>"/>
          <span class="style1"></span></td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;��ע</td>
        <td class="right" bgcolor="#FFFFEC">&nbsp;
          <html:textarea cols="60" styleClass="shuru" rows="3" property="departmentVO.depRemark" value="<%=departmentVO.getDepRemark()%>" onkeyup ="javascript:checkDepRemark();"></html:textarea></td>
        <td width="33%" class="left" bgcolor="#FFFFEC">&nbsp;&nbsp; ���� 150</td>
      </tr>
      <tr bgcolor="#ECFBFF">
        <td height="27" colspan="3">&nbsp;<span class="ziti">�� <span class="style1">*</span> �����ݲ���Ϊ��</span></td>
      </tr>
      <tr >
        <td height="24" colspan="3" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <input name="Submit" type="submit" class="ziti" value="ȷ��" onclick="return oncheck();">
            &nbsp;
            <input name="Submit3" type="button" class="ziti" value="ȡ��" onclick="return RZback();">
        </div></td>
      </tr>
</table>

</html:form>
<p>��</p>
</body>
</html:html>
