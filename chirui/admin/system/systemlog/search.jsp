<%
/**
 * ��ѯϵͳ��־��Ϣҳ��
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
<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.model.admin.system.user.UserInfoVO,crjd.common.SessionContainer" %>

<html:html>
<head>
  <html:base/>
<meta http-equive="Cache-Control" content="no-cache"/>
<title>ϵͳ��־��ѯ</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>

<script  language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script  language="javascript" src="<%=request.getContextPath()%>/script/message.js"></script>
<script  language="javascript" src="<%=request.getContextPath()%>/script/calendar.js"></script>
<script language="JavaScript" type="text/JavaScript">
function riqi(para){
  inputDate(para);
}
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/systemLogAction.do?actionType=0");
}
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

   if(!rigorCheckValue(document.all["systemLogVO.startTime"],0,4,0,0,"��ѯ��ʼʱ��")){
     return false;
   }else if(!rigorCheckValue(document.all["systemLogVO.endTime"],0,4,0,0,"��ѯ����ʱ��")){
     return false;
   }
   return true;
}
/*===================================================
���ܣ�ʹ����ѯ��ʼʱ�䣨systemLogVO.startTime���������ֻ����������
���룺
�����
���ߣ�������
===================================================*/
function checkStartTime() {
	var num = document.all["systemLogVO.startTime"];

	checkNum(num);

	return;
}

/*===================================================
���ܣ�ʹ����ѯ����ʱ�䣨systemLogVO.endTime���������ֻ����������
���룺
�����
���ߣ�������
===================================================*/
function checkEndTime() {
	var num = document.all["systemLogVO.endTime"];

	checkNum(num);

	return;
}
</script>

</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;�����ڵ�λ�ã�ϵͳά��  �� ϵͳ��־ �� ϵͳ��־��ѯ</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="43">&nbsp;</td>
  </tr>
</table>

<html:form action="/systemLogAction.do" method="post">

  <input type="hidden" name="actionType" value="7"/>

<table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">ϵͳ��־��ѯ</span></div></td>
      </tr>
      <tr>
        <td  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��ѯ��ʼʱ��</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="systemLogVO.startTime"  size="20" maxlength="12"/>&nbsp;
          <img alt="��ѡ������" style="cursor: hand;" src="<%=request.getContextPath()%>/images/timer.gif" onClick="setday(this,document.all['systemLogVO.startTime']);"/>
		  </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;��ѯ����ʱ��</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="systemLogVO.endTime"  size="20" maxlength="12"/>&nbsp;
          <img alt="��ѡ������" style="cursor: hand;" src="<%=request.getContextPath()%>/images/timer.gif" onClick="setday(this,document.all['systemLogVO.endTime']);"/>
          </td>
      </tr>

      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;������Ա</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="systemLogVO.operationUser" size="20" maxlength="30"/>
          <span class="style1"></span></td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;��������</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="systemLogVO.operationContent" size="20" maxlength="200"/>
          <span class="style1"></span></td>
        <td class="left" bgcolor="#FFFFEC"> &nbsp;</td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;��������</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
    <html:select property="systemLogVO.operationType" style="width=133px;">
      <html:option value="">--��ѡ��--</html:option>
      <html:option value="���">���</html:option>
      <html:option value="�޸�">�޸�</html:option>
      <html:option value="ɾ��">ɾ��</html:option>
    </html:select>
          <span class="style1"></span></td>
        <td class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;��־����</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
    <html:select property="systemLogVO.operatorRole" style="width=133px;">
      <html:option value="">--��ѡ��--</html:option>
      <html:option value="ϵͳ������־">ϵͳ������־</html:option>
      <html:option value="ϵͳ������־">ϵͳ������־</html:option>
    </html:select>
          <span class="style1"></span></td>
        <td class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr >
        <td height="24" colspan="3" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <html:submit styleClass="ziti" value="��ѯ"  onclick="return oncheck()"/>
             &nbsp;
            <html:reset styleClass="ziti" value="����"/>
            &nbsp;
            <html:button styleClass="ziti" value="ȡ��" property="Submit3" onclick="return RZback();"/>
        </div></td>
      </tr>
</table>
</html:form>
<p>��</p>
</body>
</html:html>
