<%@page import="crjd.model.admin.sommanage.onLineBm.OnlineBmExcleUtil" %>
<%@page import="crjd.model.admin.sommanage.onLineBm.OnlineBmExcle" %>
<%@page import="java.util.ArrayList" %>

<script language="JavaScript">
<!--
self.moveTo(0,0)
self.resizeTo(screen.availWidth,screen.availHeight)
//-->
</script>

<%
OnlineBmExcleUtil onlineBmExcleUtil = new OnlineBmExcleUtil(application);
///System.out.println(request);
ArrayList infoList = onlineBmExcleUtil.getStatList(request);
response.reset();
response.setContentType("application/vnd.ms-excel");
OnlineBmExcle onlineBmExcle = new OnlineBmExcle();
onlineBmExcle.InfiviExcel(response.getOutputStream(),"",infoList);
out.clear();
out=pageContext.pushBody();
%>  
