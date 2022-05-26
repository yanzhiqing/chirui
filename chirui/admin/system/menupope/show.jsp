<%
/**
 * <p>Title:菜单操作浏览 </p>
 * <p>Description: 2006-06-01</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author 陈振宇
 * @version 1.0
 */
%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<html:html>
<head>
  <html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>菜单信息一览表</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {font-size: 10px}
-->
</style>
<%
String menuid=request.getParameter("menuid");
if(menuid==null||menuid.equals("")){
  menuid=(String)session.getAttribute("menuid");
  }else{
   session.setAttribute("menuid",menuid);
  }
%>
<script language="JavaScript" type="text/JavaScript">
	function RZadd(){
		window.location.replace("<%=request.getContextPath()%>/admin/system/menupope/apply.jsp?menuid=<%=menuid%>");
        }

      function RZsearch(){

        }

function RZback(){
  window.location.replace("<%=request.getContextPath()%>/menuAction.do?actionType=0");
}
</script>
</head>
<jsp:include page="../../../common/buttonPage.jsp"/>

<body >

  <html:form action="/menuPopeAction.do" method="post">

  <html:hidden property="actionType" value="0"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：系统维护 → 菜单维护 →菜单操作信息</td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#E0ECFE">
  <tr>
    <td height="13">&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>　</td>
  </tr>
</table>
<table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
<tr align="center" bgcolor="#B7DBFF">
    <td width="6%" height="20"><input type="checkbox" name="delkeys" onclick="return RZchose();"/></td>
    <td width="14%"><div align="center" class="ziti"> 菜单编号</div></td>
    <td width="25%"><span class="ziti">菜单操作名称</span>&nbsp;</td>
    <td width="25%"><span class="ziti">菜单操作URL</span>&nbsp;</td>
    <td width="25%"><span class="ziti">菜单备注</span>&nbsp;</td>
    <td width="20%">操作</td>
  </tr>

 <logic:present name="list" scope="request">
    <logic:iterate id="bean" name="list" scope="request" type="crjd.model.admin.system.menupop.MenuPopeVO" indexId="ind">
     <%
String bgcol = "#FFFFEC";

if( (ind.intValue()%2) != 0){
    bgcol = "#ECFBFF";
}
%>
  		<tr bgcolor="#E2FAFE">
    			<td height="21" bgcolor="<%=bgcol%>"><div align="center">
      				<input type="checkbox" name="keys" value="<bean:write name="bean" property="popeRowId"/>"/>
    			</div></td>
    			<td bgcolor="<%=bgcol%>"><div align="center" class="ziti">&nbsp;<bean:write name="bean" property="menuId"/></div></td>
    			<td bgcolor="<%=bgcol%>"><div align="center">&nbsp;<bean:write name="bean" property="popeName"/></div></td>
                       <td bgcolor="<%=bgcol%>"><div align="center">&nbsp;<bean:write name="bean" property="popeUrl"/></div></td>
      			<td bgcolor="<%=bgcol%>"><div align="center">&nbsp;<bean:write name="bean" property="col1"/></div></td>
                       <td bgcolor="<%=bgcol%>"  ><div id="add" align="center">
                         <a href="<%=request.getContextPath()%>/menuPopeAction.do?menuid=<%=menuid%>&amp;actionType=3&amp;key=<bean:write name="bean" property="popeRowId"/>">修改</a> </div></td>
  		</tr>
      

    </logic:iterate>
  </logic:present>


</table>

<table width="100%" height="33"  border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
  <tr>
    <td height="30" class="wushang" valign="middle">&nbsp;
      <html:button styleClass="ziti" value="删除" property="del" onclick="return RZdel();"/>
    &nbsp;
    <html:button styleClass="ziti" value="添加" property="add1" onclick="return RZadd();"/>
    &nbsp;
    <html:button styleClass="ziti" value="返回菜单"  property="edit" onclick="return RZback();"/></td>
    <!--html:button styleClass="ziti" value="返回菜单"  property="edit" onclick="return RZsearch();"/></td-->
  </tr>
</table>
<input type="hidden" name="popmun" value=""/>
<jsp:include page="../../../common/splitPage.jsp"/>
<jsp:include page="../../../common/resultMessage.jsp"/>
</body>
</html:form>
</html:html>

