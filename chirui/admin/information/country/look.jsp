<%
/** ������ϸ��Ϣҳ��
 * <p>Title: admin/information/country/look.jsp </p>
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
<%@ page import="crjd.common.Toolkit" %>
<%@ page contentType="text/html; charset=GBK" %>
<html:html>
<head>
  <html:base/>
<meta http-equive="Cache-Control" content="no-cache"/>
<title>������Ϣ</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function RZback(){
  //��������20060924add Ŀ�ģ������ס��ѯ�������⣩
  var conditionString = document.all["conditionString"].value;

  window.location.replace("<%=request.getContextPath()%>/countryInfoAction.do?actionType=7"+conditionString );
}
</script>
<html:base/>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;�����ڵ�λ�ã���Ϣά�� �� ������Ϣ �� ������Ϣ�鿴</td>
  </tr>
</table>
<p>��</p>

<html:form action="/countryInfoAction.do" method="post">
<%
String conditionString = Toolkit.dealNull(request.getParameter("conditionString"));
%>
<!-- ������20060924add Ŀ�ģ������ס��ѯ�������� -->
<html:hidden property="conditionString" value="<%=conditionString%>"/>
	<table width="80%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
     <tr>
        <td height="24" colspan="6" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">������Ϣ�鿴</span></div></td>
      </tr>
      <tr>
        <td width="18%"  bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;������</td>
        <td width="22%" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="continentCode"/>
          </td>
        <td width="18%" bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;��</td>
        <td width="22%" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="continent"/>
          </td>
      </tr>
      <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;��Ӣ����</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="continentEn"/>
          </td>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;���Ҵ���</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="countryNo"/>
          </td>
      </tr>
	   <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;���һ����</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="country"/>
          </td>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;���һ����Ӣ����</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="countryEn"/>
          </td>
      </tr>
	   <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;��������</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="countryCode"/>
          </td>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;��������</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="postalCode"/>
          </td>
      </tr>
	   <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;������������</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="curchNam"/>
          </td>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;����Ӣ������</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="curenNam"/>
          </td>
      </tr>
	  <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;����ԭ�з���</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="oldSign"/>
          </td>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;���ұ�׼����</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="staSign"/>
          </td>
      </tr>
	   <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;�Ƿ��ϼ�</td>
		<td bgcolor="#FFFFEC">&nbsp;
		     <logic:equal value="0" name="object" property="hiddenFlag">�¼�</logic:equal>
			 <logic:equal value="1" name="object" property="hiddenFlag">�ϼ�</logic:equal>
		</td>
				<td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;</td>
        <td bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr >
        <td colspan="4" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <html:button styleClass="ziti" value="����" property="Submit3" onclick="return RZback();"/>
        </div></td>
      </tr>
</table>
</html:form>
<p>��</p>
</body>
</html:html>