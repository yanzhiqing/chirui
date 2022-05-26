<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
  <html:base/>
<title>
menu
</title>
</head>
<%
String modcode=request.getParameter("modcode");
//if(modcode==null){
//  modcode=1;
//  }
%>

<frameset rows="*,80" >
  <frame src="<%=request.getContextPath()%>/menuListAction.do?modcode=<%=modcode%>" name="lefttopFrame" frameborder="no" scrolling="no" marginwidth="0" marginheight="0" >
  <frame src="<%=request.getContextPath()%>/frame/sysinfo.jsp" name="leftflootFrame" frameborder="no" scrolling="NO" noresize marginwidth="0" marginheight="0"/>
</frameset>
<noframes><body>
</body></noframes>
</html>

