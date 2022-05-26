<%@ page contentType="text/html; charset=GBK" %>
<%
org.apache.struts.util.TokenProcessor.getInstance().saveToken(request);
%>
<input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="<%=session.getAttribute("org.apache.struts.action.TOKEN")%>" />		
<input type="hidden" name="tokenValidate" value="true" />		

