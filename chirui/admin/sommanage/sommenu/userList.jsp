<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="../../../common/taglibs.jsp" %>
<html:html>
<head>
	<html:base />
	<title>用户信息一览表</title>
	<link href="<%=request.getContextPath()%>/css/border.css"
		rel="stylesheet" type="text/css">
	<style type="text/css">
<!--
.style1 {font-size: 10px}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function RZadd(){
	window.location.replace("<%=request.getContextPath()%>/admin/system/user/userApply.jsp");
}

function RZsearch(){
     window.location.replace("<%=request.getContextPath()%>/admin/system/user/userSearch.jsp");
}

function userListquery(){
    var userIdQuery = document.all["userIdQuery"].value;
	var userNameQuery = document.all["userNameQuery"].value;
	var userDepIdQuery = document.all["userDepIdQuery"].value;
	
	var urlUserList = "<%=request.getContextPath()%>/menuAuthorityAction.do?actionType=7&userIdQuery="+userIdQuery+"&userDepIdQuery="+userDepIdQuery+"&userNameQuery="+userNameQuery;
    window.location.replace(urlUserList);
}
        

</script>
</head>

<jsp:include page="../../../common/buttonPage.jsp" />
<body onload="return onlaoding();">
	<form action="<%=request.getContextPath()%>/menuAuthorityAction.do" method="post">
		<html:hidden property="actionType" value="0" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="wudi">
					&nbsp;您现在的位置：网站管理 → 栏目授权
				</td>
			</tr>
		</table>
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  			<tr>
   				 <td height="20"></td>
  			</tr>
		</table>
	   <table width="100%"  border="0" cellspacing="0" cellpadding="0" background="<%=request.getContextPath()%>/images/di.jpg">
  			<tr valign="middle">
			    <td width="13%" height="27" valign="middle"><div align="right"><span class="ziti">操作员ID&nbsp;</span></div></td>
			    <td width="12%" height="27"><div align="left"><span class="ziti">&nbsp;
			    <html:text styleClass="shuru" maxlength="8" property="userIdQuery" value=""/>
			    </span></div></td>
			    <td width="12%" height="27"><div align="right"><span class="ziti">操作员姓名&nbsp;</span></div></td>
			    <td width="18%" height="27"><div align="left"><span class="ziti">&nbsp;
			    <html:text styleClass="shuru" maxlength="20" property="userNameQuery" value=""/>
			    </span></div></td>
			    <td width="13%" height="27"><div align="right"><span class="ziti">用户类型&nbsp;</span></div></td>
			    <td width="14%" height="27"><div align="left"><span class="ziti">&nbsp;
			    <user-tag:selDepTag property="userDepIdQuery" value="" styleClass="shuru" />
			    </span></div></td>
			    <td width="18%" height="27"><div align="center"><span class="ziti">
			       <html:button styleClass="ziti" value="查询" property="Submit4" onkeypress="13" onclick="return userListquery();"/>
			    </span></div></td>
  		</tr>
	</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="20"></td>
			</tr>
		</table>
		<table width="100%" border="1" align="center" cellpadding="0"
			cellspacing="0" bordercolor="#DEE5EF"
			style="border-collapse: collapse">
			<tr align="center" bgcolor="#B7DBFF">
				<td width="25%">
					<div align="center" class="ziti">
						操作员ID
					</div>
				</td>
				<td width="25%">
					<span class="ziti">操作员姓名</span>&nbsp;
				</td>				
				<td width="25%" class="ziti">
					状态
				</td>
				<td width="25%">
					<div align="center" class="ziti">
						操作
					</div>
				</td>
			</tr>

			<logic:present name="list" scope="request">
				<logic:iterate id="bean" name="list" scope="request" type="crjd.model.admin.system.user.UserInfo" indexId="ind">
					<%
								String bgcol = "#FFFFEC";
								if ((ind.intValue() % 2) != 0) {
							bgcol = "#ECFBFF";
								}
					%>
					<tr bgcolor="#E2FAFE">					
						<td bgcolor="<%=bgcol%>">
							<div align="center" class="ziti">
								&nbsp;
								<bean:write name="bean" property="userId" />
							</div>
						</td>
						<td bgcolor="<%=bgcol%>">
							<div align="center">
								&nbsp;
								<bean:write name="bean" property="userName" />
							</div>
						</td>
						<td bgcolor="<%=bgcol%>">
							<div align="center" class="ziti">
								<logic:equal name="bean" property="userState" value="0">正常</logic:equal>
								<logic:equal name="bean" property="userState" value="1">挂起</logic:equal>
							</div>
						</td>
						<td bgcolor="<%=bgcol%>" align="center">
								<a href="<%=request.getContextPath()%>/menuAuthorityAction.do?actionType=1&userId=${bean.userRowId}">授权</a>
						</td>
					</tr>
				</logic:iterate>
			</logic:present>


		</table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="20"></td>
			</tr>
		</table>
		<input type="hidden" name="popmun" value="" />
	</form>

</body>
</html:html>

