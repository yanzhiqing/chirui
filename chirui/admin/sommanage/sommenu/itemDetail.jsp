<%@ page language="java" pageEncoding="GBK"%>
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
	
</head>
<body>
<form name="somMenuForm" action="<%=request.getContextPath() %>/somMenuAction.do" method="post">
	<input type="hidden" id="actionType" name="actionType" value="5"/>
 	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="wudi">
				&nbsp;�����ڵ�λ�ã���վ���� �� ��Ŀ����
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
        			<span class="header">��Ŀ�鿴</span>
        		</div>
        	</td>
      	</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">��Ŀ��ţ�</td>
			<td bgcolor="#FFFFEC">${object.menuIndex}</td>
		</tr>
      	<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">�ϼ��˵���</td>
			<td bgcolor="#FFFFEC">
				${requestScope.menuName == "" ? "���ޣ�":requestScope.menuName}
			</td>
		</tr>	
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">��Ŀ���ƣ�</td>
			<td bgcolor="#FFFFEC"> ${object.menuName} </td>
		</tr>
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">��ʾ״̬��</td>
			<td bgcolor="#FFFFEC">${object.menuState == "1" ? "��ʾ":"����"}</td>
		</tr>
		<c:if test='${object.menuLevel != "1"}'>
			<tr>
				<td align="right" bgcolor="#ECFBFF" class="ziti">��Ŀ���ͣ�</td>
				<td bgcolor="#FFFFEC">
						<c:if test='${object.contentType == "1"}'>��Ϣ���</c:if>
						<c:if test='${object.contentType == "2"}'>��Ϣ�б�</c:if>
						<c:if test='${object.contentType == "3"}'>ͼƬ</c:if>
						<c:if test='${object.contentType == "4"}'>��֯����</c:if>
						<c:if test='${object.contentType == "5"}'>ʦ��</c:if>
						<c:if test='${object.contentType == "6"}'>ѧԺ�쵼</c:if>
						<c:if test='${object.contentType == "7"}'>���߱���</c:if>
				</td>
			</tr>
		</c:if>		
		<tr>
			<td align="right" bgcolor="#ECFBFF" class="ziti">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
			<td bgcolor="#FFFFEC">
				<textarea rows="5" cols="60" name="somMenu.remark" id="remark" readonly="readonly">${object.remark}</textarea>
			</td>
		</tr>	
		<tr>
			<td height="24" colspan="2" background="<%=request.getContextPath()%>/images/di.jpg">
				<div align="center">
					<input type="button" value="����" onclick="history.back();">
				</div>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
