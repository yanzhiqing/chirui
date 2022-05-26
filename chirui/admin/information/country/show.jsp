<%/**
 * չʾ������Ϣ�б�ҳ��
 * <p>Title:admin/information/country/show.jsp</p>
 * <p>Description: 2006-11-08</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author ������
 * @version 1.0
 */%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/user-tag.tld" prefix="user-tag" %>
<!-- ������20060924add Ŀ�ģ������ס��ѯ�������� -->
<%@ page import="crjd.model.admin.information.country.CountryInfoVO" %>
<%@ page import="crjd.common.Toolkit" %>
<%@ page contentType="text/html; charset=GBK" %>
<%
	String conditionString = Toolkit.dealNull(request.getParameter("conditionString"));
String conditionStringFlag = "";
String sucFlag = Toolkit.dealNull(request.getParameter("sucFlag"));


int conditionStringLen = conditionString.length();

if(conditionStringLen > 4) {
    conditionStringFlag = conditionString.substring(0,4);
}
////"0101"��ʾ�������ӡ���ɾ�������޸ġ����أ�������20060924 Ŀ�ģ������ס��ѯ�������⣩
if(conditionStringFlag.equals("0101")) {
    conditionString = conditionString.substring(4,conditionStringLen);
}
if(conditionStringFlag.equals("0101") && !(sucFlag.equals("1") || sucFlag.equals("0"))) {
%>
<script language="JavaScript" type="text/JavaScript">
//��������20060924add Ŀ�ģ������ס��ѯ�������⣩
var conditionString = "&conditionString=<%=conditionString%>";

window.location.replace("<%=request.getContextPath()%>/countryInfoAction.do?actionType=7"+conditionString);
</script>
<%
	}
else {
%>
<html>
<head>
  <html:base/>
<meta http-equive="Cache-Control" content="no-cache"/>
<title>������Ϣ</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {font-size: 10px};
-->
</style>

<script language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/script/message.js"></script>
<script  language="javascript" src="common.js"></script>
<script language="JavaScript" type="text/JavaScript">
 function RZdel2() {

    var conditionString = getConditionString();

    //"0101"��ʾ�������ӡ���ɾ�������޸ġ����أ�������20060925add  Ŀ�ģ������ס��ѯ�������⣩
	document.all["conditionString"].value = "0101" +  conditionString ;
  
	if(!RZdel()) {
	    document.all["conditionString"].value = conditionString;
	};
}

/*===================================================
���ܣ��ڲ�ѯҳ��������ӡ����������¼�
===================================================*/
function RZadd(){
    var conditionString = getConditionString();
	//alert(conditionString);

	window.location.replace("<%=request.getContextPath()%>/admin/information/country/apply.jsp?"
	+ conditionString );
}


/*===================================================
���ܣ����롰��ϸ�����޸ġ�ҳ��
===================================================*/
function goLookOrEdit(actionType,key){
	document.all["actionType"].value = actionType;
    document.all["key"].value = key;
    document.all["conditionString"].value = getConditionString();

	document.forms[0].action="<%=request.getContextPath()%>/countryInfoAction.do";
	document.forms[0].submit();
}

</script>
</head>

<jsp:include page="../../../common/buttonPage.jsp"/>
<body onLoad="return onlaoding();">

  <html:form action="/countryInfoAction.do" method="post" focus="countryInfoVO.continentCode">

<html:hidden property="actionType" value="0"/>
<!-- ������20060925add  Ŀ�ģ������ס��ѯ�������� -->
  <html:hidden property="conditionString" value=""/>
  <html:hidden property="key" value=""/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;�����ڵ�λ�ã���Ϣά�� �� ������Ϣ</td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="20"></td>
  </tr>
</table>
<table width="100%" height="27"  border="0" cellpadding="0" cellspacing="0" bordercolor="#B7DBFF" style="border-collapse: collapse"  background="<%=request.getContextPath()%>/images/di.jpg">
  <tr> 
<%
 	//�ϴ��ύ�Ĳ�ѯ������������20060924add Ŀ�ģ������ס��ѯ�������⣩
 String continentCode = Toolkit.dealNull(request.getParameter("countryInfoVO.continentCode"));
 String continent = Toolkit.dealNull(request.getParameter("countryInfoVO.continent"));
 String countryNo = Toolkit.dealNull(request.getParameter("countryInfoVO.countryNo"));
 String country = Toolkit.dealNull(request.getParameter("countryInfoVO.country"));
 String hiddenFlag = Toolkit.dealNull(request.getParameter("countryInfoVO.hiddenFlag"));
 %>
    <td width="9%" ><div align="right"><span class="ziti">������&nbsp;</span></div></td>
    <td width="9%" bordercolor="#B7DBFF"><span class="ziti">&nbsp;
    <html:text styleClass="shuru" maxlength="30" property="countryInfoVO.continentCode" size="7" value="<%=continentCode%>"/>
    </span>
	</td>
    <td width="4%"><div align="right"><span class="ziti">&nbsp;��&nbsp;</span></div></td>
    <td width="9%"><span class="ziti">
    <html:text styleClass="shuru" maxlength="100" property="countryInfoVO.continent" size="8" value="<%=continent%>"/>
    </span></td>
    <td width="9%"><div align="right"><span class="ziti">&nbsp;���Ҵ���&nbsp;</span></div></td>
    <td width="10%"><span class="ziti">
    <html:text styleClass="shuru" maxlength="10" property="countryInfoVO.countryNo" size="10" value="<%=countryNo%>"/>
    </span></td>
    <td width="10%" ><div align="right" ><span class="ziti">&nbsp;���һ����</span></div></td>
    <td width="16%"><span class="ziti">&nbsp;
    <user-tag:countryTag styleClass="shuru" property="countryInfoVO.country" style="width:150px;" value="<%=country%>"/>
    <!-- <html:text styleClass="shuru" maxlength="10" property="countryInfoVO.country" size="15" value="<%=country%>"/> -->
    </span></td>
	<td width="8%">&nbsp;�Ƿ��ϼ�</td>
    <td width="">&nbsp;
	    <html:select styleClass="shuru" property="countryInfoVO.hiddenFlag" value="<%=hiddenFlag%>">
		        <html:option value="">-��ѡ��-</html:option>
                <html:option value="0" >�¼�</html:option>
                <html:option value="1" >�ϼ�</html:option>
          </html:select>
    <td width="11%">&nbsp;&nbsp;
	  <html:submit styleClass="ziti" value="��ѯ" property="Submit4" onclick="return RZquery();"/>
    </td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="20"></td>
  </tr>
</table>
<table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
  <tr align="center" bgcolor="#B7DBFF">
    <td width="6%" height="20"><input type="checkbox" name="delkeys" onClick="return RZchose();"/></td>
    <td width="10%"><div align="center" class="ziti"> ������</div></td>
    <td width="18%"><span class="ziti">��</span>&nbsp;</td>
	<td width="14%"><span class="ziti">���Ҵ���</span>&nbsp;</td>
	<td width="22%"><span class="ziti">���һ����</span>&nbsp;</td>
    <td width="10%"><div align="center" class="ziti">����</div></td>
  </tr>
  <logic:present name="list" scope="request">
    <logic:iterate id="bean" name="list" scope="request" type="crjd.model.admin.information.country.CountryInfoVO" indexId="ind">
<%
String bgcol = "#FFFFEC";

if( (ind.intValue()%2) != 0){
    bgcol = "#ECFBFF";
}
%>
  		<tr bgcolor="#E2FAFE">
    			<td height="21" bgcolor="<%=bgcol%>"><div align="center">
      				<input type="checkbox" name="keys" value="<bean:write name="bean" property="couRowId"/>"/>
    			</div></td>
                <td bgcolor="<%=bgcol%>"><div align="center" class="ziti">&nbsp;<bean:write name="bean" property="continentCode"/></div></td>
    			<td bgcolor="<%=bgcol%>"><div align="center" class="ziti">&nbsp;<bean:write name="bean" property="continent"/></div></td>
    			<td bgcolor="<%=bgcol%>"><div align="center">&nbsp;<bean:write name="bean" property="countryNo"/></div></td>
				<td bgcolor="<%=bgcol%>"><div align="center">&nbsp;<bean:write name="bean" property="country"/></div></td>
    			<td bgcolor="<%=bgcol%>">
				  <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
				   <td>
		                        <div align="center" id="RZlook" style="display:none">
					 <a href="javascript:goLookOrEdit('4','<bean:write name='bean' property='couRowId'/>')">��ϸ</a>
				        </div>
                                  </td>
                                  <td>
	                            <div align="center" id="RZedit" style="display:none">
				    <a href="javascript:goLookOrEdit('3','<bean:write name='bean' property='couRowId'/>')">�޸�</a>
	                           </div>
	                       </td>
            <td id="RZlook"></td>
            <td id="RZedit"></td>
				  </table>
				</td>
  		</tr>

    </logic:iterate>
  </logic:present>
</table>
<table width="100%" height="33"  border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
  <tr>
    <td height="30" class="wushang" width="100%" valign="middle">
      <table width="15%" border="0">
        <tr>
            <td valign="middle" width="30" id="RZdel" style="display:none">
               <html:button styleClass="ziti"  value="ɾ��"   property="del2" onclick="return RZdel2();"/></td>  
               <td valign="middle" width="30" style="display:none" id="RZadd">
			   <html:button  styleClass="ziti" value="���"   property="add13" onclick="return RZadd();"/></td>
               <!-- <td valign="middle" width="30" style="display:none" id="RZsearch"><html:button styleClass="ziti"  value="��ϸ��ѯ"  property="add132" onclick="return RZsearch();"/> -->
           
            <td id="RZadd"></td>
            <td id="RZdel"></td>
        </tr>
      </table>
     </td>
  </tr>
</table>
<input type="hidden" name="popmun" value=""/>
<jsp:include page="../../../common/splitPage.jsp"/>
<jsp:include page="../../../common/resultMessage.jsp"/>
 </html:form>
</body>
</html>
<%
}
%>
