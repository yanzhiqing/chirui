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
	padding-right: 5px;
}
-->
</style>
	<script language="javascript" src="<%=request.getContextPath()%>/script/calendar.js"></script>

<script type="text/javascript">

	//����
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/schoolfellowAction.do?actionType=0";
	}
	
	//�ύ��
	function goSub(){
	
		var name = document.getElementById("name");
		if(name.value == ""){
			alert("������У��������");
			name.focus();
			return false;
		}
		
		if(!checkFile()){return false;}
		
		Dvbbs_CopyData('resume');
		return true;
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
		<form action="<%=request.getContextPath()%>/schoolfellowAction.do" method="post" enctype="multipart/form-data" id="schoolfellowForm" name="schoolfellowForm">
			<input type="hidden" id="actionType" name="actionType" value="1"/>
			<input type="hidden" name="schoolfellow.resume" id="resume" value="">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;�����ڵ�λ�ã���վ���� �� �ܳ�У�ѹ��� �� У�����
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
							<span class="header">У�����</span>
						</div>
					</td>
				</tr>
				<tr>
					<td width="25%" align="right" bgcolor="#ECFBFF" class="ziti">
						��&nbsp;&nbsp;&nbsp;&nbsp;����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="schoolfellow.name" id="name"
							maxlength="20"��>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td bgcolor="#FFFFEC">
						<input type="radio" name="schoolfellow.sex" value="��" checked="checked">�� &nbsp;&nbsp;
						<input type="radio" name="schoolfellow.sex" id="sex" value="Ů" >Ů
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						�������£�
					</td>
					<td bgcolor="#FFFFEC">
						 <input type="text" id="birthday" class="Wdate" name="schoolfellow.birthday" value="" onfocus="setday(this,document.getElementById('birthday'));" readonly="readonly"/>
		   					 <img style="cursor: hand;" src="<%=request.getContextPath()%>/image/timer.gif" width="16"
										height="16" border="0" alt="��ѡ������"
										onClick="setday(this,document.getElementById('birthday'));" />
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						ѧ&nbsp;&nbsp;&nbsp;&nbsp;λ��
					</td>
					<td bgcolor="#FFFFEC">
						<select name="schoolfellow.degree" id="degree" >
							<option value="">---��ѡ��---</option>
							<option value="ѧʿ">ѧʿ</option>
							<option value="˶ʿ">˶ʿ</option>
							<option value="��ʿ">��ʿ</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						����Ժϵ��
					</td>
					<td bgcolor="#FFFFEC">
						<select name="schoolfellow.department" id="department" >
							<option value="">---��ѡ��---</option>
							<option value="�����ѧ�빤��ϵ">�����ѧ�빤��ϵ</option>
							<option value="��Ϣ����ϵ">��Ϣ����ϵ</option>
							<option value="����ó��ϵ">����ó��ϵ</option>
							<option value="���ϵ">���ϵ</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						��&nbsp;&nbsp;&nbsp;&nbsp;Ƭ��
					</td>
					<td bgcolor="#FFFFEC">
						<input type="file" name="photo" class="bd4" size="20" id="photo" onchange="checkFile();"/>
						(֧��.JPG.JPEG.JIF��ʽ) <!--<a href="javascript:viewImg();">Ԥ��</a>
					--></td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						��&nbsp;&nbsp;&nbsp;&nbsp;�飺
					</td>
					<td bgcolor="#FFFFEC" >
					
						<jsp:include page="../../../common/editor.jsp"/>

					</td>
				</tr>
				<tr>
					<td height="24" colspan="2"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<input type="submit" name="Submit" value="ȷ��" onclick="return goSub();" />
							<input type="button" value="����" onclick="goback();" />
						</div>
					</td>
				</tr>
			</table>
			<%@ include file="../../../common/token.jsp"%>
		</form>


	</body>
</html>
