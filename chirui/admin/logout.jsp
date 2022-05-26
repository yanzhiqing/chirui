<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
  <html:base/>
<title>
logout
</title>
</head>
<body bgcolor="#ffffff">
<h1>
<%
session.invalidate();
%>
<script  language="javaScript">
   top.location = "<%=request.getContextPath()%>/admin/login.jsp";
</script>
</h1>
</body>
</html>
