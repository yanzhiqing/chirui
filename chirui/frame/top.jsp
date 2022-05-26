<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
  <html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>西安驰瑞机电设备有限公司</title>  
<link href="boder.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.tupian {
	background-attachment: fixed;
	background-image: url(../images/logoback.gif);
	background-repeat: no-repeat;
}
-->
</style>
</head>
<script language="javaScript">
function tuichu(){
  	 top.location.replace("<%=request.getContextPath()%>/admin/logout.jsp");
}
</script>
<body>
<table width="97%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="52%"  height="67"><img src="<%=request.getContextPath()%>/images/home/logobg.gif" width="550"></td>
        </tr> 
        <tr height="27">
         <td background="<%=request.getContextPath()%>/images/botbg.gif">&nbsp;</td>
          <td background="<%=request.getContextPath()%>/images/botbg.gif"><img src="<%=request.getContextPath()%>/images/4.gif" width="24" height="27">&nbsp;</td>
		  <td height="27" background="<%=request.getContextPath()%>/images/botbg.gif"><a href="default1.jsp?upid=1" target="mainFrame">网站管理</a></td>
		  <td background="<%=request.getContextPath()%>/images/botbg.gif"><img src="<%=request.getContextPath()%>/images/4.gif" width="24" height="27">&nbsp;</td>
		  <td background="<%=request.getContextPath()%>/images/botbg.gif"><a href="default1.jsp?upid=3" target="mainFrame">系统维护</a></td>
		  <td background="<%=request.getContextPath()%>/images/botbg.gif"><img src="<%=request.getContextPath()%>/images/4.gif" width="24" height="27">&nbsp;</td>
		  <td width="12%" background="<%=request.getContextPath()%>/images/botbg.gif"><u><span onClick="return tuichu();" style="cursor:hand">退出系统</span></u></td>
        </tr>
  </table>
</body>
</html>

