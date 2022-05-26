<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.Toolkit;" %>
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
	
<script type="text/javascript">
	var goSub = function(){
		if(document.getElementById("menuName").value == ""){
			alert("栏目名称不能为空！");
			document.getElementById("menuName").focus();
			return false;
		}
		if(document.getElementById("contentType").value == ""){
			alert("请选择栏目显示类型！");
			document.getElementById("contentType").focus();
			return false;
		}
		return true;
	}
	
</script>
</head>
<body>
<form name="somMenuForm" action="<%=request.getContextPath() %>/somMenuAction.do?menuName=<%=request.getParameter("menuName") == "" ? "（顶级栏目）" : Toolkit.toUnicode(request.getParameter("menuName"))%>" method="post">&nbsp; 
	<input type="hidden" id="actionType" name="actionType" value="1"/>
	<input type="hidden" id="menuLevel" name="somMenu.menuLevel" value="${param.level}"/>
	<input type="hidden" id="level" name="menuLevel" value="${param.level}"/>
 	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="wudi" style="padding-left: 0px">
				&nbsp;您现在的位置：网站管理 → 栏目管理 → <c:if test='${param.level == "1"}'>一</c:if><c:if test='${param.level == "2" }'>二</c:if><c:if test='${param.level == "3" }'>三</c:if>级栏目
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
        			<span class="header">栏目添加</span>
        		</div>
        	</td>
      	</tr>
      	<tr>
			<td align="right" width="25%" bgcolor="#ECFBFF" class="ziti">上级栏目：</td>
			<td width="*%" bgcolor="#FFFFEC"><%=request.getParameter("menuName") == "" ? "（顶级栏目）" : Toolkit.toUnicode(request.getParameter("menuName")) %>
			<input type="hidden" name="somMenu.menuParentId" id="menuParentId" value='${param.menuId == "" ? "0" : param.menuId}' >
			<input type="hidden" name="menuId" value='${param.menuId == "" ? "0" : param.menuId}'/>
			</td>
		</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">栏目级别：</td>
			<td bgcolor="#FFFFEC">${param.level == "" ? "0" : param.level }</td>
		</tr>
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">栏目名称：</td>
			<td bgcolor="#FFFFEC">
				<input type="text" name="somMenu.menuName" id="menuName" style="width:250px;" maxlength="50"　>
			</td>
		</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">显示状态：</td>
			<td bgcolor="#FFFFEC">
				<input type="radio" name="somMenu.menuState" id="menuState" value="1" checked="checked">显示 &nbsp;&nbsp;
				<input type="radio" name="somMenu.menuState" id="menuState" value="0">隐藏
			</td>
		</tr>
		<c:if test='${param.level != "1"}'>
			<tr>
				<td align="right" bgcolor="#ECFBFF" class="ziti">栏目类型：</td>
				<td bgcolor="#FFFFEC">
					<select name="somMenu.contentType" id="contentType">
						<option value="">--请选择--</option>
						<option value="1">信息简介</option>
						<option value="2">信息列表</option>
						<option value="3">图片</option>
						<option value="4">组织机构</option>
						<option value="5">师资</option>
						<option value="6">学院领导</option>
						<option value="7">在线报名</option>
						<option value="8">专题新闻</option>
					</select>
				</td>
			</tr>
		</c:if>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
			<td bgcolor="#FFFFEC">
				<textarea rows="5" cols="80" name="somMenu.remark" id="remark" class="ziti"></textarea>
			</td>
		</tr>
		<tr>
			<td height="24" colspan="2" background="<%=request.getContextPath()%>/images/di.jpg">
				<div align="center">
					<input type="submit" name="confirm" value="确认" onclick="return goSub();" />
					<input type="button" value="返回" onclick="history.back();" />
				</div>
			</td>
		</tr>
	</table>
	<%@ include file="../../../common/token.jsp" %>
</form>
</body>
</html>
