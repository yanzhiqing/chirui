<%
/**
 * 展示机构信息列表页面
 * <p>Title: admin/system/user/show.jsp </p>
 * <p>Description: 2006-06-04</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author eqzhou
 * @version 1.0
 */
%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/user-tag.tld" prefix="user-tag" %>
<%@ page contentType="text/html; charset=GBK" %>

<html:html>
<head>
<html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equive="Cache-Control" content="no-cache"/>
<title>机构信息一览表</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {font-size: 10px}
-->
</style>
<script  language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script  language="javascript" src="<%=request.getContextPath()%>/script/message.js"></script>
<script  language="javascript" src="common.js"></script>
<script language="JavaScript" type="text/JavaScript">
	function RZadd(){
		window.location.replace("<%=request.getContextPath()%>/admin/system/department/apply.jsp");
        }

        function RZsearch(){
          	window.location.replace("<%=request.getContextPath()%>/admin/system/department/search.jsp");
        }

</script>
</head>
<jsp:include page="../../../common/buttonPage.jsp"/>
<body onload="return onlaoding();" >
<html:form action="/departmentAction.do" method="post" focus="departmentVO.depId">

  <html:hidden property="actionType" value="0"/>

<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：系统维护 → 机构管理</td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="20"></td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="<%=request.getContextPath()%>/images/di.jpg">
  <tr valign="middle">
    <td width="13%" height="27" valign="middle"><div align="right"><span class="ziti">机构编码&nbsp;</span></div></td>
    <td width="12%" height="27"><div align="left"><span class="ziti">&nbsp;
    <html:text styleClass="shuru" maxlength="8" property="departmentVO.depId" value="" onkeyup ="javascript:checkDepId();"/>
    </span></div></td>
    <td width="12%" height="27"><div align="right"><span class="ziti">机构名称&nbsp;</span></div></td>
    <td width="18%" height="27"><div align="left"><span class="ziti">&nbsp;
    <html:text styleClass="shuru" maxlength="20" property="departmentVO.depName" value=""/>
    </span></div></td>
    <td width="18%" height="27"><div align="center"><span class="ziti">
       <html:submit styleClass="ziti" value="查询" property="Submit4" onclick="return RZquery();"/>
    </span></div></td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20"></td>
  </tr>
</table>
<table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
  <tr align="center" bgcolor="#B7DBFF">
    <td width="6%" height="20"><input type="checkbox" name="delkeys" onclick="return RZchose();"/></td>
    <td width="14%"><div align="center" class="ziti"> 机构编码</div></td>
    <td width="25%"><span class="ziti">机构名称</span>&nbsp;</td>
    <td width="15%" class="ziti">主管</td>
    <td width="20%"><div align="center" class="ziti">操作</div></td>
  </tr>

  <logic:present name="list" scope="request">
    <logic:iterate id="bean" name="list" scope="request" type="crjd.model.admin.system.department.DepartmentVO" indexId="ind">
       <%
String bgcol = "#FFFFEC";

if( (ind.intValue()%2) != 0){
    bgcol = "#ECFBFF";
}
%>
  		<tr bgcolor="#E2FAFE">
    			<td height="21" bgcolor="<%=bgcol%>"><div align="center">
      				<input type="checkbox" name="keys" value="<bean:write name="bean" property="depRowId"/>"/>
    			</div></td>
    			<td bgcolor="<%=bgcol%>"><div align="center" class="ziti">&nbsp;<bean:write name="bean" property="depId"/></div></td>
    			<td bgcolor="<%=bgcol%>"><div align="center">&nbsp;<bean:write name="bean" property="depName"/></div></td>
    			<td bgcolor="<%=bgcol%>"><div align="center" class="ziti">&nbsp;
				<bean:write name="bean" property="depMaster"/>
                              </div>
                        </td>
    			<td bgcolor="<%=bgcol%>">
				  <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
					<td>
            <div align="center" id="RZlook" style="display:none">
					     <a href="<%=request.getContextPath()%>/departmentAction.do?actionType=4&amp;key=<bean:write name="bean" property="depRowId"/>">详细</a>
					  </div>
				    </td>
					<td>
           <div align="center" id="RZedit" style="display:none">
				     <a href="<%=request.getContextPath()%>/departmentAction.do?actionType=3&amp;key=<bean:write name="bean" property="depRowId"/>">修改</a>
           </div>
          </td>
            <td id="RZlook"></td>
            <td id="RZedit"></td>
				  </table>
          </td>
  		</tr>
     

    </logic:iterate>
  </logic:present>


</table>


<table width="100%" height="33"  border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
  <tr>
    <td height="30" class="wushang" width="100%" valign="middle">
      <table width="15%" border="0">
        <tr>
            <td valign="middle" width="30" id="RZdel" style="display:none"><html:button styleClass="ziti"  value="删除"   property="del2" onclick="return RZdel();"/></td>
            <td valign="middle" width="30" style="display:none" id="RZadd"><html:button styleClass="ziti"  value="添加"   property="add13" onclick="return RZadd();"/></td>
            <td valign="middle" width="30" style="display:none" id="RZsearch"><html:button styleClass="ziti"  value="详细查询"  property="add132" onclick="return RZsearch();"/></td>
            <td id="RZdel" ></td>
            <td id="RZadd" ></td>
            <td id="RZsearch" ></td>
        </tr>
      </table>
     </td>
  </tr>
</table>
<input type="hidden" name="popmun" value=""/>
<jsp:include page="../../../common/splitPage.jsp"/>
<jsp:include page="../../../common/resultMessage.jsp"/>

</html:form>

</body>
</html:html>

