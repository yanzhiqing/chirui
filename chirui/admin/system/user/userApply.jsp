<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/user-tag.tld" prefix="user-tag" %>
<%@ page contentType="text/html; charset=GBK" %>

<html:html>
<head>
  <html:base/>
<title>����Ա��Ϣ���</title>
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
�Գ����������ͽ���Ч��rigorCheckValue()����Զ���λ
����args1��������������磺document.form1.name.value
����args2�����Ƿ�Ϊ��:0����� 1����ǿ�
����args3�����������:1����"������< > ��string" �� 2����"number"�� 3����"float"�� 4����"date"����5����"ֻ�������ֺ���ĸ�����"
����args4�����ַ������ȣ�0����������
����args5��������С����λ��������float������Ч����0����������
����args6���������ʵ�����壬�Ա���׼ȷ֪ͨ�û���
*/

   var passwd1 =  document.all["userInfoVO.userPassword"].value;
   var passwd2 =  document.all["userPassword2"].value;

   if(!rigorCheckValue(document.all["userInfoVO.userId"],1,1,32,0,"����ԱID")){
     return false;
   }else if(!rigorCheckValue(document.all["userInfoVO.userName"],1,1,20,0,"����Ա����")){
     return false;
   }else if(passwd1 != passwd2|| passwd1.length < 6){
        if(passwd1.length < 6){
   			alert("���볤������Ϊ6λ");
   			document.all["userInfoVO.userPassword"].focus();
   			return false;
   		}
   		
   		if(passwd1 != passwd2){
    	alert("������������벻һ�£����������룡");
   		document.all["userInfoVO.userPassword"].value="";
   		document.all["userPassword2"].value="";
        document.all["userInfoVO.userPassword"].focus();
        return false;
       }
   }else if(!rigorCheckValue(document.all["userInfoVO.userDepId"],1,1,8,0,"���ڻ���")){
     return false;
   }else if(document.all["userInfoVO.userEmail"].value.length > 0){
     if(!isEmailAlt(document.all["userInfoVO.userEmail"].value,"�����ʼ�")){
     	return false;
     }
   }else if(!rigorCheckValue(document.all["userInfoVO.userState"],1,1,5,0,"״̬")){
     return false;
   }else if(!rigorCheckValue(document.all["userInfoVO.userRemark"],0,1,1000,0,"��ע")){
     return false;
   }
   return true;
}
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/userInfoAction.do?actionType=0");
}

/*===================================================
���ܣ�ʹ����ע��roleInfoVO.roleRemark���������ֻ������
      ��󳤶�Ϊmaxlen����Ϣ
���룺 
�����
���ߣ�������
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
    <td class="wudi">&nbsp;�����ڵ�λ�ã�ϵͳά�� �� �û�ά�� �� ����Ա��Ϣ���</td>
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
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">����Ա��Ϣ���</span></div></td>
      </tr>
      <tr>
        <td width="30%"  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;����ԱID</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="32" property="userInfoVO.userId" value=""/>
          <span class="style1">*</span>&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;����Ա����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="20" property="userInfoVO.userName" value=""/>
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:password styleClass="shuru" maxlength="32" property="userInfoVO.userPassword" value=""/>
          <span class="style1"></span></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;ȷ������</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <input type="password" class="shuru" maxlength="32" name="userPassword2"/>
          <span class="style1"></span></td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;���ڻ���</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <user-tag:department property="userInfoVO.userDepId" upDepartmentId="" value="" styleClass="shuru" />
          <!--html:text styleClass="shuru" maxlength="8" property="userInfoVO.userDepId" value=""/-->
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;�����ʼ�</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="50" property="userInfoVO.userEmail" value=""/>
          <span class="style1"></span></td>
        <td class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;״̬</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
          <html:select styleClass="shuru" property="userInfoVO.userState" value="" style="width:100pt ">
            <html:option value="">--��ѡ��--</html:option>
            <html:option value="0">����</html:option>
            <html:option value="1">����</html:option>
          </html:select>
          <span class="style1">*</span></td>
        <td class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;��ע</td>
        <td class="right" bgcolor="#FFFFEC">&nbsp;
          <html:textarea cols="60" styleClass="shuru" rows="3" property="userInfoVO.userRemark" value="" onkeyup ="javascript:checkUserRemark();"></html:textarea></td>
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
