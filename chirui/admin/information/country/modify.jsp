<%
/**
 * �޸Ĺ�����Ϣҳ��
 * <p>Title: admin/information/country/modify.jsp </p>
 * <p>Description: 2006-11-08</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author ������
 * @version 1.0
 */
%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="crjd.model.admin.information.country.CountryInfoVO,crjd.common.SessionContainer" %>
<%@ taglib uri="/WEB-INF/user-tag.tld" prefix="user-tag" %>
<%@page import="java.util.Vector,java.sql.*,java.text.*" %>

<!-- ������20060925add Ŀ�ģ������ס��ѯ�������� -->
<%@ page import="crjd.common.Toolkit" %>
<%@ page contentType="text/html; charset=GBK" %>
<html:html>
<head>
    <html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>������Ϣ</title>
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
    if(checkall()) {
	    //"0101"��ʾ�������ӡ���ɾ�������޸ġ����أ�������20060924add Ŀ�ģ������ס��ѯ�������⣩
		document.all["conditionString"].value = "0101" +  document.all["conditionString"].value;
		return true;
	}
	else {
		return false;
	}
}
function RZback(){
  //��������20060924add Ŀ�ģ������ס��ѯ�������⣩
  var conditionString = document.all["conditionString"].value;

  window.location.replace("<%=request.getContextPath()%>/countryInfoAction.do?actionType=7"+conditionString);
}
</script>
</head>
<%
CountryInfoVO countryInfoVO = (CountryInfoVO)request.getAttribute("object");
if( countryInfoVO == null){
  countryInfoVO = new CountryInfoVO();
}
%>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;�����ڵ�λ�ã���Ϣά�� �� ������Ϣ �� ������Ϣ�޸�</td>
  </tr>
</table>
<p>��</p>

<html:form action="/countryInfoAction.do" method="post" focus="countryInfoVO.continentCode">
 <%
String conditionString = Toolkit.dealNull(request.getParameter("conditionString"));
%>
<!-- ������20060924 Ŀ�ģ������ס��ѯ�������� -->
<html:hidden property="conditionString" value="<%=conditionString%>"/>
 <input type="hidden" name="actionType" value="5"/>

  <html:hidden property="countryInfoVO.couRowId" value="<%=countryInfoVO.getCouRowId()%>"/>


	<table width="80%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
       <tr>
        <td height="24" colspan="6" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">������Ϣ�޸�</span></div></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;������</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.continentCode" value="<%=countryInfoVO.getContinentCode()%>" size="30" maxlength="30"/>
        </td>
        <td width="20%" height="24" bgcolor="#ECFBFF" class="ziti">&nbsp;��</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.continent" value="<%=countryInfoVO.getContinent()%>" size="30" maxlength="100"/>
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;��Ӣ����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.continentEn" value="<%=countryInfoVO.getContinentEn()%>" size="30" maxlength="100"
		  onkeyup ="javascript:checkContinentEn();"/>
          </td>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;���Ҵ���</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.countryNo" value="<%=countryInfoVO.getCountryNo()%>" size="30" maxlength="10"/>
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;���һ����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.country" value="<%=countryInfoVO.getCountry()%>" size="30" maxlength="100"/>
          <span class="style1">*</span></td>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;���һ����Ӣ����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.countryEn" size="30" value="<%=countryInfoVO.getCountryEn()%>" maxlength="100" onkeyup ="javascript:checkCountryEn();"/>
         </td>
      </tr>
	   <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;��������</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.countryCode" size="30" value="<%=countryInfoVO.getCountryCode()%>" maxlength="10"/>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;��������</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.postalCode" size="30" value="<%=countryInfoVO.getPostalCode()%>" maxlength="10"/>
         </td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;������������</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.curchNam" size="30" value="<%=countryInfoVO.getCurchNam()%>" maxlength="100"/>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;����Ӣ������</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.curenNam" size="30" value="<%=countryInfoVO.getCurenNam()%>" maxlength="100"/>
         </td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;����ԭ�з���</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.oldSign" size="30" value="<%=countryInfoVO.getOldSign()%>" maxlength="100"/>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;���ұ�׼����</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.staSign" size="30" value="<%=countryInfoVO.getStaSign()%>" maxlength="100"/>
         </td>
      </tr>
	   <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;�Ƿ��ϼ�</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
           <html:select styleClass="shuru" property="countryInfoVO.hiddenFlag" value="<%=countryInfoVO.getHiddenFlag()%>" style="width:110pt " size="1">
            <html:option value="0">�¼�</html:option>
            <html:option value="1">�ϼ�</html:option>
			</html:select>
		</td>
		<td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;</td>
        <td bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr bgcolor="#ECFBFF">
        <td height="27" colspan="6">&nbsp;<span class="ziti">�� <span class="style1">*</span> �����ݲ���Ϊ��</span></td>
      </tr>
      <tr >
        <td height="24" colspan="6" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <html:submit styleClass="ziti" value="ȷ��" onclick="return oncheck();"/>
            &nbsp;
            <html:button styleClass="ziti" value="ȡ��" property="Submit3" onclick="return RZback();"/>
        </div></td>
      </tr>
</table>
</html:form>
<p>��</p>
</body>
</html:html>
