<%
/**
 * ϵͳ����  �޸��û�����ҳ��
 * <p>Title: /admin/system/changepwd/changepwd.jsp </p>
 * <p>Description: 2006-10-17</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author ��Ӧ��
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
<title>�޸��û�����</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<script  language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script language="JavaScript" type="text/javascript">
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
  if(document.all["oldpassword"].value==""){
     alert("�����벻��Ϊ��!");
	 document.all["oldpassword"].focus();
	 return false;
  }
  if(document.all["newpassword"].value==""){
     alert("�����벻��Ϊ��!");
	 document.all["newpassword"].focus();
	 return false;
  }
  if(document.all["newpassword"].value!=document.all["renewpassword"].value){
     alert("�������ȷ�����벻ƥ��!");
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
    <td class="wudi">&nbsp;�����ڵ�λ�ã�ϵͳά�� �� �����޸�</td>
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
  out.println("���Ĳ����Ѿ���ʱ�������µ�¼ϵͳ��");
}else if(newpassword == null || newpassword.equals("")){
%>
    <form name="frm_changepwd" method="post" action="" onSubmit="return oncheck();">
<table width="60%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
  <td height="23" colspan="2" class="ziti"  background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">�û������޸�</span></div></td>
  <tr>
    <td width="16%" align="right"  bgcolor="#ECFBFF"><span class="ziti">�û���¼ID��&nbsp;</span></td>
    <td width="34%" bgcolor="#FFFFEC">&nbsp;&nbsp;<%=sc.getUserID()%>
      <input name="Userid" type="hidden" value="<%=sc.getUserID()%>"></td>
  </tr>
  <tr>
    <td width="16%" align="right"  bgcolor="#ECFBFF"><span class="ziti">����������룺&nbsp;</span></td>
    <td width="34%" bgcolor="#FFFFEC">&nbsp;
        <input name="oldpassword" type="password" class="shuru" id="oldpassword" size="20" maxlength="15">&nbsp;<span class="style1">*</span></td>
  </tr>
  <tr>
    <td width="16%" align="right"  bgcolor="#ECFBFF"><span class="ziti">�����������룺&nbsp;</span></td>
    <td width="34%" bgcolor="#FFFFEC">&nbsp;
        <input name="newpassword" type="password" class="shuru" id="newpassword" size="20" maxlength="15">&nbsp;<span class="style1">*</span></td>
  </tr>
  <tr>
    <td width="16%" align="right"  bgcolor="#ECFBFF"><span class="ziti">ȷ�������룺&nbsp;</span></td>
    <td bgcolor="#FFFFEC">&nbsp;
        <input name="renewpassword" type="password" class="shuru" id="renewpassword" size="20" maxlength="15">&nbsp;<span class="style1">*</span></td>
  </tr>
   <tr>
  <td height="22" colspan="2"  background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
    <input type="submit" name="Submit" value="��  ��">&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
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
      <p><%=validateOldpwd?"<font color=green>���������޸ĳɹ������ס�����룡</font>":"<font color=red>�ɵ������������������޸�ʧ�ܣ�</font>"%>
      </p>
      <p></p>
      <p><a href="changepwd.jsp">����</a></p>
      <p>&nbsp;</p></td>
</table>

<%
}
%>

  </body>
</html:html>
