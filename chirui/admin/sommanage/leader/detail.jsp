<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="../../../common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;" />
		<title>SOM��վ����-ѧԺ�쵼</title>
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
		window.location.href = "<%=request.getContextPath()%>/leaderAction.do?actionType=0";
	}
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/leaderAction.do" method="post">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;�����ڵ�λ�ã���վ���� �� ѧԺ�쵼���� �� ѧԺ�쵼�鿴
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
							<span class="header">ѧԺ�쵼�鿴</span>
						</div>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right" bgcolor="#ECFBFF" class="ziti">
						��&nbsp;&nbsp;&nbsp;&nbsp;����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${object.leadername}
					</td>
				</tr>
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						ְ&nbsp;&nbsp;&nbsp;&nbsp;λ��
					</td>
					<td bgcolor="#FFFFEC">
						${object.leaderpower}						
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						ְλ������
					</td>
					<td bgcolor="#FFFFEC">
						${object.placeIndex}						
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						��&nbsp;&nbsp;&nbsp;&nbsp;Ƭ��
					</td>
					<td bgcolor="#FFFFEC">
						<c:if test='${object.leaderpopath != null && object.leaderpopath !=""}'>
							<img src="<%=request.getContextPath()%>/${object.leaderpopath}" id="photo_img"/> 
						
						</c:if>
						<c:if test='${object.leaderpopath == null || object.leaderpopath ==""}'>
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
							${object.leaderinfo}
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

		</form>
	</body>
</html>
