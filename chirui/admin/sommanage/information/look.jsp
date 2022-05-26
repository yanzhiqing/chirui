<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="../../../common/taglibs.jsp"%>
<html>
	<head>
		<html:base />
		<meta http-equive="Cache-Control" content="no-cache" />
		<title>详细页面</title>
		<link href="<%=request.getContextPath()%>/css/border.css"
			rel="stylesheet" type="text/css">
		<style type="text/css">
<!--
.style1 {
	color: #FF0000
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function RZback(){
  var conditionString = document.all["conditionString"].value;

  window.location.replace("<%=request.getContextPath()%>/somInfomationAction.do?actionType=7"+conditionString );
}
</script>
		<html:base />
	</head>

	<body>
		<table width="99%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="wudi">
					&nbsp;您现在的位置：网站管理 → 栏目管理 → 栏目信息管理 → 栏目信息查看
				</td>
			</tr>
		</table>
		<p>
		</p>

		<form action="<%=request.getContextPath()%>/somInfomationAction.do" method="post">
			<%
				//String conditionString = Toolkit.dealNull(request.getParameter("conditionString"));
			%>
			<html:hidden property="conditionString" value="" />
			<table id="list" width="95%" border="1" align="center"
				cellpadding="0" cellspacing="0" bordercolor="#DEE5EF"
				style="border-collapse: collapse">
				<tr>
					<td height="24" colspan="6" class="ziti" bgcolor="#B7DBFF">
						<div align="center">
							<span class="header">新闻信息查看</span>
						</div>
					</td>
				</tr>
				<tr>
					<td width="10%" bgcolor="#F8F8FC" class="ziti">
						&nbsp;&nbsp;新闻标题
					</td>
					<td width="" bgcolor="">
						&nbsp;
						<bean:write name="object" property="title" />
					</td>
				</tr>
				<tr>
					<td height="20" bgcolor="#F8F8FC" class="ziti">
						&nbsp;新闻标题超级连接
					</td>
					<td colspan="2" bgcolor="">&nbsp;
						<bean:write name="object" property="titlehref" />
					</td>
				</tr>
				<tr>
					<td bgcolor="#F8F8FC" class="ziti">
						&nbsp;&nbsp;新闻内容
					</td>
					<td bgcolor="">
						&nbsp;
						<bean:write name="object" property="content" filter="false" />
					</td>
				</tr>
				<tr>
					<td bgcolor="#F8F8FC" class="ziti">
						&nbsp;&nbsp;备注
					</td>
					<td bgcolor="">
						&nbsp;
						<bean:write name="object" property="abstract_" />
					</td>
				</tr>
				<tr>
					<td bgcolor="#F8F8FC" class="ziti">
						&nbsp;&nbsp;发件时间
					</td>
					<td bgcolor="">
						&nbsp;
						<bean:write format="yyyy-MM-dd" name="object" property="createtime"/>
					</td>
				</tr>

				<tr>
					<td bgcolor="#F8F8FC" class="ziti">
						&nbsp;&nbsp;发件人
					</td>
					<td bgcolor="">
						&nbsp;
						<bean:write name="object" property="promulgator" />
					</td>
				</tr>
				
				<tr>
					<td colspan="4"
						background="<%=request.getContextPath()%>/image/tiao3.gif">
						<div align="center">
							<html:button styleClass="ziti" value="返回" property="Submit3"
								onclick="Javascript:window.history.back()" />
						</div>
					</td>
				</tr>
			</table>
		</form>
		<p>
		</p>
	</body>
</html>