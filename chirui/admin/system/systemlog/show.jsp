<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<html:html>
<head>
  <html:base/>
<meta http-equive="Cache-Control" content="no-cache"/>
<title>系统日志</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {font-size: 10px}
-->
</style>

<script language="JavaScript" type="text/JavaScript">

        function RZsearch(){
          	window.location.replace("<%=request.getContextPath()%>/admin/system/systemlog/search.jsp");
        }

</script>
</head>

<jsp:include page="../../../common/buttonPage.jsp"/>
<body onload="return onlaoding();">

  <html:form action="/systemLogAction.do" method="post" focus="systemLogVO.operationUser">

    <html:hidden property="actionType" value="0"/>

<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：系统维护 → 系统日志</td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="20"></td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0"  style="border-collapse: collapse" bordercolor="#B7DBFF" background="<%=request.getContextPath()%>/images/di.jpg">
  <tr valign="middle">
    <td width="13%" height="27" valign="middle" ><div align="right"><span class="ziti">操作人员&nbsp;</span></div></td>
    <td width="12%" height="27"><div align="left"><span class="ziti">&nbsp;
    <html:text styleClass="shuru" property="systemLogVO.operationUser" size="15" maxlength="30"/>
    </span></div></td>
    <td width="12%" height="27" ><div align="right"><span class="ziti">操作类型&nbsp;</span></div></td>
    <td width="18%" height="27"><div align="left"><span class="ziti">&nbsp;
      <html:select property="systemLogVO.operationType" style="width=133px;" styleClass="shuru">
      <html:option value="">--请选择--</html:option>
      <html:option value="添加">添加</html:option>
      <html:option value="修改">修改</html:option>
      <html:option value="删除">删除</html:option>
    </html:select>
    </span></div></td>
    <td width="13%" height="27"><div align="right"><span class="ziti">日志类型&nbsp;</span></div></td>
    <td width="14%" height="27"><div align="left"><span class="ziti">&nbsp;
    <html:select property="systemLogVO.operatorRole" style="width=133px;" styleClass="shuru">
      <html:option value="">--请选择--</html:option>
      <html:option value="系统管理日志">系统管理日志</html:option>
      <html:option value="业务操作日志">业务操作日志</html:option>
    </html:select>
    </span></div></td>
    <td width="18%" height="27"><div align="center"><span class="ziti">
      <html:submit styleClass="ziti" value="查询" property="Submit" onclick="return RZquery();"/>
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
    <td width="18%"><div align="center" class="ziti"> 操作时间</div></td>
    <td width="15%">操作人员&nbsp;</td>
    <td width="41%"><div align="center" class="ziti">操作内容</div></td>
    <td width="8%" class="ziti">操作类型</td>
    <td width="12%">日志类型</td>
  </tr>

  <logic:present name="list" scope="request">
    <logic:iterate id="bean" name="list" scope="request" type="crjd.model.admin.system.systemlog.SystemLogVO" indexId="ind">
     <%
String bgcol = "#FFFFEC";

if( (ind.intValue()%2) != 0){
    bgcol = "#ECFBFF";
}
%>
  		<tr bgcolor="#E2FAFE">
    			<td height="21" bgcolor="<%=bgcol%>"><div align="center">
      				<input type="checkbox" name="keys" value="<bean:write name="bean" property="rowId"/>"/>
    			</div></td>
    			<td bgcolor="<%=bgcol%>">
                              <div align="center" class="ziti">&nbsp;
                                <%
                                String time = bean.getOperationTime();
                                time = time.substring(0,time.length()-2);
                                out.println(time);
                                %>
                              </div>
                        </td>
    			<td bgcolor="<%=bgcol%>"><div align="center">&nbsp;<bean:write name="bean" property="operationUser"/></div></td>
    			<td bgcolor="<%=bgcol%>"><div align="left" class="ziti">&nbsp;<bean:write name="bean" property="operationContent"/></div></td>
    			<td bgcolor="<%=bgcol%>"><div align="center" class="ziti">&nbsp;<bean:write name="bean" property="operationType"/></div></td>
    			<td bgcolor="<%=bgcol%>"><div align="center" class="ziti">&nbsp;<bean:write name="bean" property="operatorRole"/></div></td>
  		</tr>
      
    </logic:iterate>
  </logic:present>

</table>
<table width="100%" height="33"  border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
  <tr>
    <td height="30" class="wushang" width="100%" valign="middle">
      <table width="15%" border="0">
        <tr>
            <td valign="middle" width="30" id="RZdel" style="display:none">
               <html:button styleClass="ziti"  value="删除"   property="del2" onclick="return RZdel();"/></td>
              <td valign="middle" width="30" style="display:none" id="RZsearch"><html:button styleClass="ziti"  value="详细查询"  property="add132" onclick="return RZsearch();"/>
             </td>
            <td id="RZdel"></td>
            <td id="RZsearch"></td>
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

