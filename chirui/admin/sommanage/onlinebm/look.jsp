<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.Toolkit;"%>
<%@ include file="../../../common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;" />
		<title>SOM��վ����-���߱���</title>
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
		window.location.href = "<%=request.getContextPath()%>/onLineBmAction.do?actionType=0";
	}
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/onLineBmAction.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="actionType" name="actionType" value="5"/>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;�����ڵ�λ�ã���վ���� �� ���߱��� �����߱����鿴
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
			<table width="70%" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="#DEE5EF"
				style="border-collapse: collapse">
				<tr>
					<td height="24" colspan="4" class="ziti"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<span class="header">���߱����鿴</span>
						</div>
					</td>
				</tr>
				<tr>
					<td  width="26%" align="left" bgcolor="#ECFBFF" class="ziti">��ѵ������</td>
					<td  width="30%"  bgcolor="#FFFFEC">${object.className}</td>
					<td  width="20%" align="left" bgcolor="#ECFBFF" class="ziti">MBA���ͣ�</td>
					<td  width="30%" bgcolor="#FFFFEC">${object.MBAType}</td>
				</tr>
				<tr>
					<td  align="left" bgcolor="#ECFBFF" class="ziti">�� ����</td>
					<td  bgcolor="#FFFFEC">${object.xm}</td>
					<td  align="left" bgcolor="#ECFBFF" class="ziti">�� ��</td>
					<td  bgcolor="#FFFFEC">${object.xb}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">�� �壺</td>
				    <td bgcolor="#FFFFEC">${object.mz}</td>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">�� ����</td>
				    <td bgcolor="#FFFFEC">${object.gj}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�������ڣ�</td>
					<td bgcolor="#FFFFEC">${object.csrq}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">���֤�ţ�</td>
					<td bgcolor="#FFFFEC">${object.sfzh}</td>
				</tr>
				
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�ֻ����룺</td>
					<td bgcolor="#FFFFEC">${object.yydh}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">������룺</td>
					<td bgcolor="#FFFFEC">${object.cz}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">�������䣺</td>
					<td bgcolor="#FFFFEC">${object.dzxx}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��ϵQQ��</td>
					<td bgcolor="#FFFFEC">${object.qq}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">������ϵ��������</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.jjlxr}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">������ϵ���ֻ���</td>
					<td bgcolor="#FFFFEC">${object.lxrsj}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">������ϵ�˵绰��</td>
					<td bgcolor="#FFFFEC">${object.lxrdh}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">���ѧ����</td>
					<td bgcolor="#FFFFEC">${object.zgxl}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��ҵѧУ��</td>
					<td bgcolor="#FFFFEC">${object.byxx}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��ѧרҵ��</td>
					<td bgcolor="#FFFFEC">${object.sxzy}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��ҵ֤�ţ�</td>
					<td bgcolor="#FFFFEC">${object.byzh}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">���ƣ���ר��ѧ�����ʣ�</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.xlxz}</td>
				</tr>
				
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�� �᣺</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.jg}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�������룺</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.yb}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">���ڵ�λ��˾���ƣ�</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.dwmc}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">��ְ���ţ�</td>
					<td bgcolor="#FFFFEC">${object.rzbm}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">����ְ��</td>
					<td bgcolor="#FFFFEC">${object.xrzw}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">��λ��ַ��</td>
					<td bgcolor="#FFFFEC">${object.dwdz}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��λ�ʱࣺ</td>
					<td bgcolor="#FFFFEC">${object.dwyb}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">��λ�绰��</td>
					<td bgcolor="#FFFFEC">${object.dwdh}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��λ���棺</td>
					<td bgcolor="#FFFFEC">${object.dwcz}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">�������ޣ�</td>
					<td bgcolor="#FFFFEC">${object.gznx}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">���������ޣ�</td>
					<td bgcolor="#FFFFEC">${object.gljynx}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">���˽�������ҵ��ѧ������</td>
					<td bgcolor="#FFFFEC">${object.qt}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�������</td>
					<td bgcolor="#FFFFEC">${object.bmlb}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">����������</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.gzjl}</td>
				</tr>
				<tr>
					<td height="24" colspan="4"	background="<%=request.getContextPath()%>/images/di.jpg">
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
