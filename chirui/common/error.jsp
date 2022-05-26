<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>

<%
/**
 * 错误信息页面
 * <p>Title: admin/system/user/look.jsp </p>
 * <p>Description: 2006-06-04</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author eqzhou
 * @version 1.0
 */
%>


<%
String message = (String)request.getAttribute("meg");
if(message == null){
  message = "";
}
message = message.replaceAll("crjd.springUtils.MyDataAccessException:","");
message = message.replaceAll("java.lang.Exception:","");
message = message.replaceAll("org.hibernate.HibernateException:","");
message = message.replaceAll("org.hibernate.exception.GenericJDBCException:","");
%>


<html>
<head>
  <html:base/>
<meta http-equive="Cache-Control" content="no-cache"/>
<title>错误信息</title>
<style type="text/css">
<!--
.style1 {
	font-family: "宋体";
	font-size: 12px;
	font-weight: bold;
	color: #476884;
}
.ziti {
	font-family: "宋体";
	font-size: 12px;
}
td {
	font-family: "宋体";
	font-size: 12px;
}
-->
</style>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" height="110">
  <tr>
    <td >&nbsp;</td>
  </tr>
</table>
<table width="40%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" height="20" class="wudi">
  <tr>
    <td height="20" colspan="2" background="<%=request.getContextPath()%>/images/di.jpg"><div align="left">&nbsp;<span class="style1">错误信息</span></div></td>
  </tr>
</table>
<table width="40%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" height="80">
  <tr>
    <td  width="23%" class="right">&nbsp;<img src="<%=request.getContextPath()%>/images/err.gif"></td>
    <td  width="77%" class="left">&nbsp;<%=message%></td>
  </tr>
 </table>
 <table width="40%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" height="20" class="wushang">
  <tr>
    <td height="20" colspan="2" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
      <input name="Submit" type="button" class="ziti" value="返回" onClick="javascript:history.go(-1); ">
    </div></td>
  </tr>
</table>
</body>
</html>
