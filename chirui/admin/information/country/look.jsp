<%
/** 国家详细信息页面
 * <p>Title: admin/information/country/look.jsp </p>
 * <p>Description: 2006-11-08</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author 李永祥
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
<title>国家信息</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function RZback(){
  //（李永祥20060924add 目的：解决记住查询条件问题）
  var conditionString = document.all["conditionString"].value;

  window.location.replace("<%=request.getContextPath()%>/countryInfoAction.do?actionType=7"+conditionString );
}
</script>
<html:base/>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：信息维护 → 国家信息 → 国家信息查看</td>
  </tr>
</table>
<p>　</p>

<html:form action="/countryInfoAction.do" method="post">
<%
String conditionString = Toolkit.dealNull(request.getParameter("conditionString"));
%>
<!-- 李永祥20060924add 目的：解决记住查询条件问题 -->
<html:hidden property="conditionString" value="<%=conditionString%>"/>
	<table width="80%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
     <tr>
        <td height="24" colspan="6" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">国家信息查看</span></div></td>
      </tr>
      <tr>
        <td width="18%"  bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;洲区号</td>
        <td width="22%" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="continentCode"/>
          </td>
        <td width="18%" bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;洲</td>
        <td width="22%" bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="continent"/>
          </td>
      </tr>
      <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;洲英文名</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="continentEn"/>
          </td>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;国家代号</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="countryNo"/>
          </td>
      </tr>
	   <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;国家或地区</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="country"/>
          </td>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;国家或地区英文名</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="countryEn"/>
          </td>
      </tr>
	   <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;地名代码</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="countryCode"/>
          </td>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;邮政编码</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="postalCode"/>
          </td>
      </tr>
	   <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;货币中文名称</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="curchNam"/>
          </td>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;货币英文名称</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="curenNam"/>
          </td>
      </tr>
	  <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;货币原有符号</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="oldSign"/>
          </td>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;货币标准符号</td>
        <td bgcolor="#FFFFEC">&nbsp;<bean:write name="object" property="staSign"/>
          </td>
      </tr>
	   <tr>
        <td bgcolor="#ECFBFF" class="ziti">&nbsp;&nbsp;是否上架</td>
		<td bgcolor="#FFFFEC">&nbsp;
		     <logic:equal value="0" name="object" property="hiddenFlag">下架</logic:equal>
			 <logic:equal value="1" name="object" property="hiddenFlag">上架</logic:equal>
		</td>
				<td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;</td>
        <td bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr >
        <td colspan="4" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <html:button styleClass="ziti" value="返回" property="Submit3" onclick="return RZback();"/>
        </div></td>
      </tr>
</table>
</html:form>
<p>　</p>
</body>
</html:html>