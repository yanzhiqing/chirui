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
	padding-right: 5px;
}
-->
</style>

<script type="text/javascript">

	//����
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/leaderAction.do?actionType=0";
	}
	
	//�ύ��
	function goSub(){
	
		var name = document.getElementById("leadername");
		if(name.value == ""){
			alert("������ѧԺ�쵼������");
			name.focus();
			return false;
		}
		
		var leaderpower = document.getElementById("leaderpower");
		if(leaderpower.value == ""){
			alert("�������쵼ְλ��");
			leaderpower.focus();
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
	//	var path = "file:///" + document.getElementById("leaderpopath").value;
		return ;
	}	
	
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/leaderAction.do" method="post" enctype="multipart/form-data" id="leaderForm" name="leaderForm">
			<input type="hidden" id="actionType" name="actionType" value="1"/>
			<input type="hidden" name="leader.leaderinfo" id="resume" value="">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;�����ڵ�λ�ã���վ���� �� ѧԺ�쵼���� �� ѧԺ�쵼���
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
							<span class="header">ѧԺ�쵼���</span>
						</div>
					</td>
				</tr>
				<tr>
					<td width="25%" align="right" bgcolor="#ECFBFF" class="ziti">
						��&nbsp;&nbsp;&nbsp;&nbsp;����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="leader.leadername" id="leadername"
							maxlength="20"��>
					</td>
				</tr>
				
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						ְ&nbsp;&nbsp;&nbsp;&nbsp;λ��
					</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="leader.leaderpower" class="bd4" id="leaderpower" maxlength="25"/>
					</td>
				</tr>
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						��&nbsp;&nbsp;&nbsp;&nbsp;Ƭ��
					</td>
					<td bgcolor="#FFFFEC">
						<input type="file" name="photo" class="bd4" size="20" id="photo" onchange="checkFile();"/>
						(֧��.JPG.JPEG.JIF��ʽ) 
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
