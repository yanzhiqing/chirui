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
	var check = function(o){
		
		if(o.value == "" || ! /^\d*$/.test(o.value)){
			alert("栏目索引不能空,并且只能是数字！");
			o.focus();
		}
	}
	

	var ok = function(){
		var newIndex = document.getElementById("menuIndex");
		var oldIndex = document.getElementById("oldmenuIndex");
		if(newIndex.value == ""  || ! /^\d*$/.test(newIndex.value)){
			alert("栏目索引不能空,并且只能是数字！");
			newIndex.focus();
			newIndex.focus();
			return false;
		}else if(newIndex.value != oldIndex.value){
			if(!confirm("您确定要更改菜单索引吗？")){
				return false;
			}
		}
		
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
	
	window.onload = function(){
		<c:if test='${object.menuLevel != "1"}'>
			document.getElementById("contentType").value="${object.contentType}";
		</c:if>
	}
</script>
	
</head>
<body>
<form name="somMenuForm" action="<%=request.getContextPath() %>/somMenuAction.do?menuName=<%=request.getParameter("menuName") == "" ? "（顶级栏目）" : Toolkit.toUnicode(request.getParameter("menuName"))%>" method="post">
	<input type="hidden" id="actionType" name="actionType" value="5"/>
 	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="wudi">
				&nbsp;您现在的位置：网站管理 → 栏目管理 → <c:if test='${object.menuLevel == "1"}'>一</c:if><c:if test='${object.menuLevel == "2" }'>二</c:if><c:if test='${object.menuLevel == "3" }'>三</c:if>级栏目
			</td>
		</tr>
	</table>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="43">&nbsp;</td>
	  </tr>
	</table>
				<input type="hidden" name="somMenu.id" id="id" value='${object.id }' />
				<input type="hidden" name="somMenu.menuId" id="menuId" value='${object.menuId}' />
				<input type="hidden" name="somMenu.menuLevel" id="menuLevel" value='${object.menuLevel }' />
				<input type="hidden" name="somMenu.menuParentId" id="menuParentId" value='${object.menuParentId }' />
				<input type="hidden" name="somMenu.createTime" id="createTime" value='${object.createTime }' />
				<input type="hidden" name="menuId" value='${object.menuParentId }' />
				<input type="hidden" name="menuLevel" value='${object.menuLevel}' />
	<table width="70%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
		<tr>
        	<td height="24" colspan="2" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg">
        		<div align="center">
        			<span class="header">栏目修改</span>
        		</div>
        	</td>
      	</tr>
		  
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">上级菜单：</td>
			<td bgcolor="#FFFFEC">
				${requestScope.menuName == "" ? "（无）":requestScope.menuName}
			</td>
		</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">栏目序号：</td>
			<td bgcolor="#FFFFEC">
				<input type="text" name="somMenu.menuIndex" id="menuIndex" sytle="width:250px;" maxlength="3" onchange="check(this)" value="${object.menuIndex}">
				<input type="hidden" name="oldmenuIndex" id="oldmenuIndex" style="width:250px;" maxlength="50" value="${object.menuIndex}">
				( 只能是数据字 )
			</td>
		</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">栏目名称：</td>
			<td bgcolor="#FFFFEC">
				<input type="text" name="somMenu.menuName" id="menuName" style="width:250px;" maxlength="50" value="${object.menuName}">
			</td>
		</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">显示状态：</td>
			<td bgcolor="#FFFFEC">
				<input type="radio" name="somMenu.menuState" id="menuState" value="1" ${object.menuState == "1" ? "checked":""} >显示 &nbsp;&nbsp;
				<input type="radio" name="somMenu.menuState" id="menuState" value="0" ${object.menuState == "0" ? "checked":""}>隐藏
			</td>
		</tr>
		<c:if test='${object.menuLevel != "1"}'>
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
				<textarea rows="5" cols="80" name="somMenu.remark" id="remark" class="ziti" >${object.remark}</textarea>
			</td>
		</tr>	
		<tr>
			<td height="24" colspan="2" background="<%=request.getContextPath()%>/images/di.jpg" >
				<div align="center">
					<input type="submit" name="confirm" value="确认" onclick="return ok();"/>
					<input type="button" value="返回" onclick="history.back();">
				</div>
			</td>
		</tr>
	</table>
	<%@ include file="../../../common/token.jsp" %>
</form>
</body>
</html>
