<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.Toolkit;"%>
<%@ include file="../../../common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;" />
		<title>SOM��վ����-�ܳ�У��</title>
		<link href="<%=request.getContextPath()%>/css/border.css"
			rel="stylesheet" type="text/css" />
		<style type="text/css">
<!--
.style1 {
	color: #FF0000
}

table td {
	padding-left: 10px;
	padding-right: 5px;
}
-->
</style>
<script type="text/javascript">
	
	//����
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/schoolfellowAction.do?actionType=0";
	}
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/schoolfellowAction.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="actionType" name="actionType" value="5"/>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;�����ڵ�λ�ã���վ���� �� �ܳ�У�ѹ��� �� У�Ѳ鿴
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="43">
						&nbsp;
					</td>
				</tr>
			</table>
			<table width="80%" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="#DEE5EF"
				style="border-collapse: collapse">
				<tr>
					<td height="24" colspan="2" class="ziti"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<span class="header">У�Ѳ鿴</span>
						</div>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right" bgcolor="#ECFBFF" class="ziti">
						��&nbsp;&nbsp;&nbsp;&nbsp;����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${object.name}
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td bgcolor="#FFFFEC">
						${object.sex}						
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						�������£�
					</td>
					<td bgcolor="#FFFFEC">
						<fmt:formatDate value="${object.birthday}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						ѧ&nbsp;&nbsp;&nbsp;&nbsp;λ��
					</td>
					<td bgcolor="#FFFFEC">
						${object.degree}						
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						����Ժϵ��
					</td>
					<td bgcolor="#FFFFEC">
						${object.department}						
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						��&nbsp;&nbsp;&nbsp;&nbsp;Ƭ��
					</td>
					<td bgcolor="#FFFFEC">
						<c:if test='${object.photo != null && object.photo !=""}'>
							<img src="<%=request.getContextPath()%>/${object.photo}" id="photo_img"/> 
						
						</c:if>
						<c:if test='${object.photo == null || object.photo ==""}'>
							(����Ƭ)
						</c:if>
					
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						��&nbsp;&nbsp;&nbsp;&nbsp;�飺
					</td>
					<td bgcolor="#FFFFEC">
						<div style="margin-top: 10px; margin-bottom: 10px;">
							${object.resume}
						</div>
					</td>
				</tr>
				
				<tr>
					<td height="24" colspan="2"	background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<input type="button" value="����" onclick="goback();" />
						</div>
					</td>
				</tr>
			</table>
			<%@ include file="../../../common/token.jsp"%>

		</form>
	</body>
</html>
