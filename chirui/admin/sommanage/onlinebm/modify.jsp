<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.*"%>
<%@ page import="crjd.model.admin.sommanage.onLineBm.*"%>
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

<script language="javascript" src="<%=request.getContextPath()%>/script/calendar.js"></script>
<script type="text/javascript">
	function goSub(){
		return true;
	}

	//����
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/onLineBmAction.do?actionType=0";
	}
	
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/onLineBmAction.do" method="post" enctype="multipart/form-data" id="onLineBmForm" name="onLineBmForm">
			<input type="hidden" id="actionType" name="actionType" value="5"/>
			<input type="hidden" name="onLineBm.id" id="id" value='${object.id}'/>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;�����ڵ�λ�ã���վ���� �� ���߱��� �� ���߱����޸�
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
			<table width="82%" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="#DEE5EF"
				style="border-collapse: collapse">
				<tr>
					<td height="24" colspan="4" class="ziti"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<span class="header">���߱����޸�</span>
						</div>
					</td>
				</tr>
				<tr>
					<td  width="26%" align="left" bgcolor="#ECFBFF" class="ziti">��ѵ������</td>
					<td  width="30%"  bgcolor="#FFFFEC"><input type="text" name="onLineBm.className"  value="${object.className}" size="20" maxlength="20"></td>
					<td  width="20%" align="left" bgcolor="#ECFBFF" class="ziti">MBA���ͣ�</td>
					<td  width="30%" bgcolor="#FFFFEC">
					<select name="onLineBm.MBAType" value="${object.MBAType}">
							<option value="">--��ѡ��--</option>
							<option value="ȫ��MBA" ${object.MBAType == "ȫ��MBA" ? "selected":""}>ȫ��MBA</option>
							<option value="��ְMBA" ${object.MBAType == "��ְMBA" ? "selected":""}>��ְMBA</option>
							<option value="����MBA" ${object.MBAType == "����MBA" ? "selected":""}>����MBA</option>
						</select>
					</td>
				</tr>
				<tr>
					<td  width="22%" align="left" bgcolor="#ECFBFF" class="ziti">�� ����</td>
					<td  width="30%"  bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.xm" id="xm" maxlength="20" value="${object.xm}">
					</td>
					<td  width="15%" align="left" bgcolor="#ECFBFF" class="ziti">�� ��</td>
					<td  width="35%" bgcolor="#FFFFEC">
						<input value="��"  ${object.xb == "��" ? "checked":""} type=radio name="onLineBm.xb">&nbsp;��&nbsp;&nbsp;&nbsp;
						<input value="Ů" ${object.xb == "Ů" ? "checked":""} type=radio name="onLineBm.xb">&nbsp;Ů&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�� �壺</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.mz" maxlength="50" value="${object.mz}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�� ����</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.gj" maxlength="50" value="${object.gj}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�������ڣ�</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.csrq" maxlength="10" value="${object.csrq}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">���֤�ţ�</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.sfzh" maxlength="10" value="${object.sfzh}">
					</td>
				</tr>
				
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�ֻ����룺</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.yydh" maxlength="11" value="${object.yydh}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">������룺</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.cz" maxlength="11" value="${object.cz}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">�������䣺</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.dzxx" maxlength="50" value="${object.dzxx}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��ϵQQ��</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.qq" maxlength="20" value="${object.qq}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">������ϵ��������</td>
					<td bgcolor="#FFFFEC" colspan="3">
						<input type="text" name="onLineBm.jjlxr" maxlength="50" value="${object.jjlxr}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">������ϵ���ֻ���</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.lxrsj" maxlength="20" value="${object.lxrsj}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">������ϵ�˵绰��</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.lxrdh" maxlength="20" value="${objectlxrdh}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">���ѧ����</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.zgxl" maxlength="50" value="${object.zgxl}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��ҵѧУ��</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.byxx" maxlength="100" value="${object.byxx}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��ѧרҵ��</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.sxzy" maxlength="100" value="${object.sxzy}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��ҵ֤�ţ�</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.byzh" maxlength="30" value="${object.byzh}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">���ƣ���ר��ѧ�����ʣ�</td>
					<td bgcolor="#FFFFEC" colspan="3"><select name="onLineBm.xlxz" style="200px" value="${object.xlxz}">
							<option value="">-----��ѡ��-----</option>
							<option value="ȫ����" ${object.xlxz == "ȫ����" ? "selected":""}>ȫ����</option>
							<option value="ҹ��" ${object.xlxz == "ҹ��" ? "selected":""}>ҹ��</option>
							<option value="����" ${object.xlxz == "����" ? "selected":""}>����</option>
							<option value="�Կ�" ${object.xlxz == "�Կ�" ? "selected":""}>�Կ�</option>
							<option value="ѧ����ƾ" ${object.xlxz == "ѧ����ƾ" ? "selected":""}>ѧ����ƾ</option>
							<option value="�������" ${object.xlxz == "�������" ? "selected":""}>�������</option>
							<option value="ר����" ${object.xlxz == "ר����" ? "selected":""}>ר����</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�� �᣺</td>
					<td bgcolor="#FFFFEC" colspan="3">
						<input type="text" name="onLineBm.jg" maxlength="100" value="${object.jg}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�������룺</td>
					<td bgcolor="#FFFFEC" colspan="3">
						<input type="text" name="onLineBm.yb" maxlength="12" value="${object.yb}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">���ڵ�λ��˾���ƣ�</td>
					<td bgcolor="#FFFFEC" colspan="3">
						<input type="text" name="onLineBm.dwmc" maxlength="100" value="${object.dwmc}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">��ְ���ţ�</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.rzbm" maxlength="100" value="${object.rzbm}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">����ְ��</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.xrzw" maxlength="100" value="${object.xrzw}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">��λ��ַ��</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.dwdz" maxlength="100" value="${object.dwdz}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��λ�ʱࣺ</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.dwyb" maxlength="10" value="${object.dwyb}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">��λ�绰��</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.dwdh" maxlength="100" value="${object.dwdh}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">��λ���棺</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.dwcz" maxlength="10" value="${object.dwcz}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">�������ޣ�</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.gznx" maxlength="100" value="${object.gznx}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">���������ޣ�</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.gljynx" maxlength="10" value="${object.gljynx}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">���˽�������ҵ��ѧ������</td>
					<td bgcolor="#FFFFEC">
					    <select name="onLineBm.qt" value="${object.qt}">
							<option value="">--��ѡ��--</option>
							<option value="��ֽ/��־" ${object.qt == "��ֽ/��־" ? "selected":""}>��ֽ/��־</option>
							<option value="��վ" ${object.qt == "��վ" ? "selected":""}>��վ</option>
							<option value="�ʼ�����" ${object.qt == "�ʼ�����" ? "selected":""}>�ʼ�����</option>
							<option value="������ҵ��ѧ�ƹ�" ${object.qt == "������ҵ��ѧ�ƹ�" ? "selected":""}>������ҵ��ѧ�ƹ�</option>
							<option value="������ҵ��ѧУ��" ${object.qt == "������ҵ��ѧУ��" ? "selected":""}>������ҵ��ѧУ��</option>
							<option value="ͬ��/����" ${object.qt == "ͬ��/����" ? "selected":""}>ͬ��/����</option>
							<option value="����" ${object.qt == "����" ? "selected":""}>����</option>
						</select>
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">�������</td>
					<td bgcolor="#FFFFEC">
						<select name="onLineBm.bmlb" value="${object.bmlb}">
						    <option value="">--��ѡ��--</option>
							<option value="MBA" ${object.bmlb == "MBA" ? "selected":""}>MBA</option>
							<option value="EMBA" ${object.bmlb == "EMBA" ? "selected":""}>EMBA</option>
							<option value="����˶ʿ" ${object.bmlb == "����˶ʿ" ? "selected":""}>����˶ʿ</option>
							<option value="��У��ʦ" ${object.bmlb == "��У��ʦ" ? "selected":""}>��У��ʦ</option>
							<option value="�й��豸������ѵ����" ${object.bmlb == "�й��豸������ѵ����" ? "selected":""}>�й��豸������ѵ����</option>
							<option value="�߼�������ѵ����" ${object.bmlb == "�߼�������ѵ����" ? "selected":""}>�߼�������ѵ����</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">����������</td>
					<td bgcolor="#FFFFEC" colspan="3">
						<textarea rows="5" cols="60" name="onLineBm.gzjl">${object.gzjl}</textarea>
					</td>
				</tr>
				<tr>
					<td height="24" colspan="4"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<input type="submit" name="confirm" value="ȷ��" onclick="return goSub();" />
							<input type="button" value="����" onclick="goback();" />
						</div>
					</td>
				</tr>
			</table>
			<%@ include file="../../../common/token.jsp"%>
		</form>
	</body>
</html>
