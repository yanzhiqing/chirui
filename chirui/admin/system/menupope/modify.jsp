<%
/**
 * 增加菜单信息页面
 * <p>Title: admin/system/user/show.jsp </p>
 * <p>Description: 2006-06-08</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author 陈振宇
 * @version 1.0
 */
%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/user-tag.tld" prefix="user-tag" %>
<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.model.admin.system.menupop.MenuPopeVO,crjd.common.SessionContainer" %>

<html:html>
<head>
  <html:base/>
<meta http-equiv="pragma" content="no-cache">
<title>菜单操作信息</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
<script  language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script  language="javascript" src="<%=request.getContextPath()%>/script/message.js"></script>
<script  language="javascript" src="common.js"></script>
<script language="JavaScript" type="text/JavaScript">
function oncheck(){
    if(checkall()) {
	    return true;
	}
	else {
	    return false;
	}
}

function RZback(){
  window.location.replace("<%=request.getContextPath()%>/menuPopeAction.do?actionType=0");
}
</script>

</head>
<%
MenuPopeVO menuPopeVO = (MenuPopeVO)request.getAttribute("object");
if( menuPopeVO == null){
  menuPopeVO = new MenuPopeVO();
}
%>

<body >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：系统维护 → 菜单维护 → 菜单信息添加 →菜单操作修改</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="43">&nbsp;</td>
  </tr>
</table>

<html:form action="/menuPopeAction.do" method="post">

<input type="hidden" name="actionType" value="5"/>
 <html:hidden property="menuPopeVO.popeRowId" value="<%=menuPopeVO.getPopeRowId()%>"/>
  <table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">菜单信息维护</span></div></td>
      </tr>
      <tr>
        <td width="30%"  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;菜单编码</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="8" size="30" property="menuPopeVO.menuId" value="<%=menuPopeVO.getMenuId()%>" onkeyup ="javascript:checkMenuId();"/>
          <span class="style1">*</span>&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;菜单操作名称</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="20" size="30"  property="menuPopeVO.popeName" value="<%=menuPopeVO.getPopeName()%>" onkeyup ="javascript:checkPopeName();"/>
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;菜单操作URL</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="100" style="width:286pt" property="menuPopeVO.popeUrl" value="<%=menuPopeVO.getPopeUrl()%>"/>
          <span class="style1">*</span>&nbsp;</td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;备注</td>
        <td class="right" bgcolor="#FFFFEC">&nbsp;
          <html:textarea cols="60" styleClass="shuru" rows="3" property="menuPopeVO.col1" value="<%=menuPopeVO.getCol1()%>" onkeyup ="javascript:checkcCol1();"></html:textarea></td>
        <td width="33%" class="left" bgcolor="#FFFFEC">&nbsp;&nbsp; 限字 100</td>
      </tr>
      <tr bgcolor="#ECFBFF">
        <td height="27" colspan="3">&nbsp;<span class="ziti">加 <span class="style1">*</span> 的内容必须填写</span></td>
      </tr>
      <tr >
        <td height="24" colspan="3" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <html:submit styleClass="ziti" value="确定" onclick="return oncheck();"/>
            <!-- &nbsp;
            <html:reset styleClass="ziti" value="重置"/> -->
            &nbsp;
            <html:button styleClass="ziti" value="取消" property="Submit3" onclick="return RZback();"/>
        </div></td>
      </tr>
</table>

</html:form>
<p>　</p>
</body>
</html:html>
