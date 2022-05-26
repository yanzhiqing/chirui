<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.Toolkit;"%>
<%@ include file="../../../common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;" />
		<title>SOM��վ����-��ʦ����</title>
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

	//����
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/somTeacherAction.do?actionType=0";
	}
	
	//�ύ��
	function goSub(){
		var name = document.getElementById("name");
		
		//��ϵ�绰�Ƿ���ǰ̨ҳ����ʾ
		if(document.all["telFlag"].checked){
			document.all["somTeacher.tel"].value = document.all["somTeacher.tel"].value + "a";
		}else{
			document.all["somTeacher.tel"].value = document.all["somTeacher.tel"].value;
		}
		
		//E-mail�Ƿ���ǰ̨ҳ����ʾ
		if(document.all["emailFlag"].checked){
			document.all["somTeacher.email"].value = document.all["somTeacher.email"].value + "|";
		}else{
			document.all["somTeacher.email"].value = document.all["somTeacher.email"].value;
		}
		
		model();
		if(name.value == ""){
			alert("�����뵼ʦ������");
			name.focus();
			return false;
		}
		
		if(!checkFile()){return false;}
		return true;
	}

	function model(){
	 	var model ="";
	 	for(i=0;i<document.all["model"].length;i++){
			if (document.all["model"][i].checked)
           		model += document.all["model"][i].value + ",";
	 	}
		 document.all["somTeacher.model"].value = model;
	 	//alert(resultinformfashion);
	 	return document.all["somTeacher.model"].value;
	}
	/** ��֤�ϴ��ļ���ʽ�� */
	function checkFile(){
		var o = document.getElementById("photo");
		var fileName = o.value;
		if(fileName.length > 0){
			var type = fileName.substring(fileName.lastIndexOf("."),fileName.length).toLowerCase();
			if(type != ".jpg" && type != ".gif" && type != ".bmp"){
				alert("�ļ�����ֻ��Ϊ:JPG��GIF��BMP��");
				
				document.selection.clear();
				o.focus();
				return false;
			}
		}
		return true;
	}
	
	//�ݲ��ô˷��� 
	function viewImg(){
		var o = document.getElementById("photo");
		var fileName = o.value;
		if(fileName == ""){
			alert("��ѡ��Ҫ�ϴ���ͼƬ�ļ�");
			return;
		}
		if(!checkFile()){return;}
		
	//	var tempPath = "<%=request.getContextPath()%>/identityCardAction.do?file:///" +$("#identityCode").val();
		var path = "file:///" + document.getElementById("photo").value;
		return ;
	}	
	
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/somTeacherAction.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="actionType" name="actionType" value="1"/>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;�����ڵ�λ�ã���վ���� �� ��ʦ������� �� ��ʦ���
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
			<table width="82%" border="1" align="left" cellpadding="0"
				cellspacing="0" bordercolor="#DEE5EF"
				style="border-collapse: collapse">
				<tr>
					<td height="24" colspan="2" class="ziti"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<span class="header">��ʦ���</span>
						</div>
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						����ģ�飺
					</td>
					<td width="*%"  bgcolor="#FFFFEC"><input TYPE="hidden" name="somTeacher.model">
					<input type="checkbox" value="��ʦ���" name="model">��ʦ���&nbsp;
					<input type="checkbox" value="ʦ�ʶ���" name="model">ʦ�ʶ���&nbsp;
					<input type="checkbox" value="������ʦ" name="model">������ʦ&nbsp;
					<input type="checkbox" value="����ʦ��" name="model">�߼�������ѵ����ʦ��&nbsp;
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						������
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.name" id="name"
							maxlength="20"��>
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.placeIndex" id="placeIndex" maxlength="20" >
					</td>
				</tr>
					<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						�������£�
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						  <input type="text" id="brithDate" name="somTeacher.brithDate" maxlength="10"/>
						  <input type="checkbox" value="1" name="somTeacher.brithDateFlag" id="brithDateFlag">��ǰ̨ҳ��ɼ�
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						��ϵ�绰��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.tel" id="tel"
							maxlength="13">
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="a" name="telFlag">��ǰ̨ҳ��ɼ�
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						E-mail��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.email" id="email"
							maxlength="50"��>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="|" name="emailFlag">��ǰ̨ҳ��ɼ�
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						ְ�ƣ�
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.positional" id="name" >
							<option value="">---��ѡ��---</option>
							<option value="1">Ժʿ</option>
							<option value="2">����</option>
							<option value="3">������</option>
							<option value="4">��ʦ</option>
							<option value="5">����</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						ѧ����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.educational" id="name" >
						<option value="">---��ѡ��---</option>
							<option value="��ר">��ר</option>
							<option value="����">����</option>
							<option value="˶ʿ�о���">˶ʿ�о���</option>
							<option value="��ʿ�о���">��ʿ�о���</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						ѧλ��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.degree" id="name" >
							<option value="">---��ѡ��---</option>
							<option value="ѧʿ">ѧʿ</option>
							<option value="˶ʿ">˶ʿ</option>
							<option value="��ʿ">��ʿ</option>
						</select>	
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						��ʦ���ͣ�
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.type" id="name" >
							<option value="">---��ѡ��---</option>
							<option value="1">˶��</option>
							<option value="2">����</option>
						</select>	
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						��ҵԺУ��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.graduatedFrom" id="name"
							maxlength="20"��>
					</td>
				</tr>
				
				    <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						ϵ��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.departments" id="name" >
							<option value="">---��ѡ��---</option>
							<option value="���̹���ϵ">���̹���ϵ</option>
							<option value="�����ѧ�빤��ϵ">�����ѧ�빤��ϵ</option>
							<option value="��Ϣ����ϵ">��Ϣ����ϵ</option>
							<option value="����ó��ϵ">����ó��ϵ</option>
							<option value="���ϵ">���ϵ</option>
						</select>	
					</td>
				</tr>
				  <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						�о�����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" size="40" name="somTeacher.researches" id="name"
							maxlength="200"��>
					</td>
				</tr>
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti">
						��Ƭ��
					</td>
					<td bgcolor="#FFFFEC">
						<input type="file" name="photo" class="bd4" size="40" id="photo" onchange="checkFile();"/>
						(֧��.JPG.JPEG.JIF��ʽ) <!--<a href="javascript:viewImg();">Ԥ��</a>
					--></td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						��ѧ�����
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="100" name="somTeacher.studyabroad"></textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						�����γ̣�
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="100" name="somTeacher.courses"></textarea>
					</td>
				</tr>
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						ѧ����ְ��
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="100" name="somTeacher.committeeBroad"></textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						ѧϰ����������300�֣���
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="10" cols="100" name="somTeacher.workingExperience"></textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						��ѧ���о��ɹ����񽱣�300�֣���
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="10" cols="100" name="somTeacher.researchResults"></textarea>
					</td>
				</tr>
				
				<tr>
					<td height="24" colspan="2"
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
