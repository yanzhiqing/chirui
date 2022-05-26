<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/user-tag.tld" prefix="user-tag" %>
<%@ page contentType="text/html; charset=GBK" %>
<html:html>
<head>
<title>操作员信息一览表</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {font-size: 10px}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/userInfoAction.do?actionType=0");
}
</script>
</head>
<body >
  <%
  String userid=request.getParameter("userid");
  %>

<form action="<%=request.getContextPath()%>/userRoleAction.do" method="post">

  <html:hidden property="actionType" value="fprole"/>

<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：系统维护 →操作员信息 →分配角色</td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#E0ECFE">
  <tr>
    <td height="13">&nbsp;</td>
  </tr>

  <logic:present name="list">
          <logic:iterate id="roleList" name="list" type="java.util.HashMap" >
           <tr>
             <td width="5%"></td>
              <td align="right" width="7%">
             <%
             if(roleList.get("flag")=="false"){%>
            <input  type="checkbox" name="rolechek"   value="<bean:write name="roleList" property="roleid"/>"/>
            <%}else{%>
            <input  type="checkbox" name="rolechek"  checked="checked" value="<bean:write name="roleList" property="roleid"/>"/>
            <%}%>
            </td>
             <td align="left"><bean:write name="roleList" property="rolename"/></td>
           </tr>
          </logic:iterate>
  </logic:present>
</table>
<table>
  <tr>
    <td width="5%"></td>
  	<td>
            <input type="hidden" name="userid" value="<%=userid%>"/>
  	<input type="submit" value="确定"/>
        <input type="button" class="button" onclick="return RZback()" value="取消"/>
        </td>

  </tr>
</table>
</form>
</body>
</html:html>
