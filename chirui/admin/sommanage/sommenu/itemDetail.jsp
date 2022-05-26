<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="../../../common/taglibs.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" />
	<title>SOM网站管理－栏目管理</title>
	<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
	<!--
	.style1 {color: #FF0000}
	table td {
		padding-left: 10px;
		padding-right: 5px;
	}
	-->
	</style>
	
</head>
<body>
<form name="somMenuForm" action="<%=request.getContextPath() %>/somMenuAction.do" method="post">
	<input type="hidden" id="actionType" name="actionType" value="5"/>
 	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="wudi">
				&nbsp;您现在的位置：网站管理 → 栏目管理
			</td>
		</tr>
	</table>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="43">&nbsp;</td>
	  </tr>
	</table>
	<table width="70%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
		<tr>
        	<td height="24" colspan="2" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg">
        		<div align="center">
        			<span class="header">栏目查看</span>
        		</div>
        	</td>
      	</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">栏目序号：</td>
			<td bgcolor="#FFFFEC">${object.menuIndex}</td>
		</tr>
      	<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">上级菜单：</td>
			<td bgcolor="#FFFFEC">
				${requestScope.menuName == "" ? "（无）":requestScope.menuName}
			</td>
		</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">栏目名称：</td>
			<td bgcolor="#FFFFEC"> ${object.menuName} </td>
		</tr>
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">显示状态：</td>
			<td bgcolor="#FFFFEC">${object.menuState == "1" ? "显示":"隐藏"}</td>
		</tr>
		<c:if test='${object.menuLevel != "1"}'>
			<tr>
				<td align="right" bgcolor="#ECFBFF" class="ziti">栏目类型：</td>
				<td bgcolor="#FFFFEC">
						<c:if test='${object.contentType == "1"}'>信息简介</c:if>
						<c:if test='${object.contentType == "2"}'>信息列表</c:if>
						<c:if test='${object.contentType == "3"}'>图片</c:if>
						<c:if test='${object.contentType == "4"}'>组织机构</c:if>
						<c:if test='${object.contentType == "5"}'>师资</c:if>
						<c:if test='${object.contentType == "6"}'>学院领导</c:if>
						<c:if test='${object.contentType == "7"}'>在线报名</c:if>
				</td>
			</tr>
		</c:if>		
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
			<td bgcolor="#FFFFEC">
				<textarea rows="5" cols="60" name="somMenu.remark" id="remark" readonly="readonly">${object.remark}</textarea>
			</td>
		</tr>	
		<tr>
			<td height="24" colspan="2" background="<%=request.getContextPath()%>/images/di.jpg">
				<div align="center">
					<input type="button" value="返回" onclick="history.back();">
				</div>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
