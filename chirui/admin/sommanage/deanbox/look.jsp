<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.Toolkit;"%>
<%@ include file="../../../common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;" />
		<title>SOM��վ����-�쵼����</title>
		<link href="<%=request.getContextPath()%>/css/border.css"
			rel="stylesheet" type="text/css" />
		<style type="text/css">
<!--
.style1 {
	color: #FF0000
}

table td {
	padding-right: 5px;
}
-->
</style>

	<script language="javascript" src="<%=request.getContextPath()%>/script/calendar.js"></script>

<script type="text/javascript">
	//����
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/deanBoxAction.do?actionType=0";
	}
	
	
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/deanBoxAction.do" method="post" enctype="multipart/form-data">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;�����ڵ�λ�ã���վ���� �� �쵼���� ����ϸ��Ϣ
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
							<span class="header">��ϸ��Ϣ</span>
						</div>
					</td>
				</tr>
				<tr>
					<td width="30%" align="right" bgcolor="#ECFBFF" class="ziti">
						��&nbsp;&nbsp;&nbsp;&nbsp;�⣺
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						 ${object.title}
					</td>
				</tr>
				<tr>
					<td width="30%" align="right" bgcolor="#ECFBFF" class="ziti">
						��&nbsp;&nbsp;&nbsp;&nbsp;�ݣ�
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					     <textarea    rows="5" cols="50" readonly="readonly"> ${object.content} </textarea>
						
					</td>
				</tr>
				<tr>
					<td width="30%" align="right" bgcolor="#ECFBFF" class="ziti">
						�ύʱ�䣺
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${object.createtime}"/>
					</td>
				</tr>
				
				<tr>
					<td width="30%" align="right" bgcolor="#ECFBFF" class="ziti">
						�ύ�ˣ�
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${object.author}
					</td>
				</tr>
				<tr>
					<td width="30%" align="right" bgcolor="#ECFBFF" class="ziti">
						����Ժϵ��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${object.yx}
					</td>
				</tr>
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						��&nbsp;&nbsp;&nbsp;&nbsp;����
					</td>
					<td bgcolor="#FFFFEC">
                        
                        <textarea   rows="5" cols="50" readonly="readonly">${object.reply}</textarea>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						�ظ��ˣ�
					</td>
					<td bgcolor="#FFFFEC">
                        
                        ${object.leader}
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						�ظ�ʱ�䣺
					</td>
					<td bgcolor="#FFFFEC">
                        
                        ${object.reply_time}
					</td>
				</tr>
				
				
				<tr>
					<td height="24" colspan="2"
						background="<%=request.getContextPath()%>/images/di.jpg">
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

