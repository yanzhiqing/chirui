<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.Toolkit;" %>
<%@ include file="../../../common/taglibs.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" />
	<title>SOM��վ������Ŀ����</title>
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
			alert("��Ŀ�������ܿ�,����ֻ�������֣�");
			o.focus();
		}
	}
	

	var ok = function(){
		var newIndex = document.getElementById("menuIndex");
		var oldIndex = document.getElementById("oldmenuIndex");
		if(newIndex.value == ""  || ! /^\d*$/.test(newIndex.value)){
			alert("��Ŀ�������ܿ�,����ֻ�������֣�");
			newIndex.focus();
			newIndex.focus();
			return false;
		}else if(newIndex.value != oldIndex.value){
			if(!confirm("��ȷ��Ҫ���Ĳ˵�������")){
				return false;
			}
		}
		
		if(document.getElementById("menuName").value == ""){
			alert("��Ŀ���Ʋ���Ϊ�գ�");
			document.getElementById("menuName").focus();
			return false;
		}
		
		if(document.getElementById("contentType").value == ""){
			alert("��ѡ����Ŀ��ʾ���ͣ�");
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
<form name="somMenuForm" action="<%=request.getContextPath() %>/somMenuAction.do?menuName=<%=request.getParameter("menuName") == "" ? "��������Ŀ��" : Toolkit.toUnicode(request.getParameter("menuName"))%>" method="post">
	<input type="hidden" id="actionType" name="actionType" value="5"/>
 	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="wudi">
				&nbsp;�����ڵ�λ�ã���վ���� �� ��Ŀ���� �� <c:if test='${object.menuLevel == "1"}'>һ</c:if><c:if test='${object.menuLevel == "2" }'>��</c:if><c:if test='${object.menuLevel == "3" }'>��</c:if>����Ŀ
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
        			<span class="header">��Ŀ�޸�</span>
        		</div>
        	</td>
      	</tr>
		  
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">�ϼ��˵���</td>
			<td bgcolor="#FFFFEC">
				${requestScope.menuName == "" ? "���ޣ�":requestScope.menuName}
			</td>
		</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">��Ŀ��ţ�</td>
			<td bgcolor="#FFFFEC">
				<input type="text" name="somMenu.menuIndex" id="menuIndex" sytle="width:250px;" maxlength="3" onchange="check(this)" value="${object.menuIndex}">
				<input type="hidden" name="oldmenuIndex" id="oldmenuIndex" style="width:250px;" maxlength="50" value="${object.menuIndex}">
				( ֻ���������� )
			</td>
		</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">��Ŀ���ƣ�</td>
			<td bgcolor="#FFFFEC">
				<input type="text" name="somMenu.menuName" id="menuName" style="width:250px;" maxlength="50" value="${object.menuName}">
			</td>
		</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">��ʾ״̬��</td>
			<td bgcolor="#FFFFEC">
				<input type="radio" name="somMenu.menuState" id="menuState" value="1" ${object.menuState == "1" ? "checked":""} >��ʾ &nbsp;&nbsp;
				<input type="radio" name="somMenu.menuState" id="menuState" value="0" ${object.menuState == "0" ? "checked":""}>����
			</td>
		</tr>
		<c:if test='${object.menuLevel != "1"}'>
			<tr>
				<td align="right" bgcolor="#ECFBFF" class="ziti">��Ŀ���ͣ�</td>
				<td bgcolor="#FFFFEC">
					<select name="somMenu.contentType" id="contentType">
						<option value="">--��ѡ��--</option>
						<option value="1">��Ϣ���</option>
						<option value="2">��Ϣ�б�</option>
						<option value="3">ͼƬ</option>
						<option value="4">��֯����</option>
						<option value="5">ʦ��</option>
						<option value="6">ѧԺ�쵼</option>
						<option value="7">���߱���</option>
						<option value="8">ר������</option>
					</select>
				</td>
			</tr>
		</c:if>	
	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
			<td bgcolor="#FFFFEC">
				<textarea rows="5" cols="80" name="somMenu.remark" id="remark" class="ziti" >${object.remark}</textarea>
			</td>
		</tr>	
		<tr>
			<td height="24" colspan="2" background="<%=request.getContextPath()%>/images/di.jpg" >
				<div align="center">
					<input type="submit" name="confirm" value="ȷ��" onclick="return ok();"/>
					<input type="button" value="����" onclick="history.back();">
				</div>
			</td>
		</tr>
	</table>
	<%@ include file="../../../common/token.jsp" %>
</form>
</body>
</html>
