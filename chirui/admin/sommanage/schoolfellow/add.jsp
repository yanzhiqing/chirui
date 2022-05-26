<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.Toolkit;"%>
<%@ include file="../../../common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;" />
		<title>SOM网站管理-杰出校友</title>
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

	//返回
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/schoolfellowAction.do?actionType=0";
	}
	
	//提交表单
	function goSub(){
	
		var name = document.getElementById("name");
		if(name.value == ""){
			alert("请输入校友姓名！");
			name.focus();
			return false;
		}
		
		if(!checkFile()){return false;}
		
		Dvbbs_CopyData('resume');
		return true;
	}
	
	/** 验证上传文件格式。 */
	function checkFile(){
		var o = document.getElementById("photo");
		var fileName = o.value;
		if(fileName.length > 0){
			var type = fileName.substring(fileName.lastIndexOf("."),fileName.length).toLowerCase();
			if(type != ".jpg" && type != ".gif" && type != ".bmp"){
				alert("文件类型只能为:JPG、GIF、BMP！");
				
				document.selection.clear();
				o.focus();
				return false;
			}
		}
		return true;
	}
	
	//暂不用此方法 
	function viewImg(){
		var o = document.getElementById("photo");
		var fileName = o.value;
		if(fileName == ""){
			alert("请选择要上传的图片文件");
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
						&nbsp;您现在的位置：网站管理 → 杰出校友管理 → 校友添加
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
							<span class="header">校友添加</span>
						</div>
					</td>
				</tr>
				<tr>
					<td width="25%" align="right" bgcolor="#ECFBFF" class="ziti">
						姓&nbsp;&nbsp;&nbsp;&nbsp;名：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="schoolfellow.name" id="name"
							maxlength="20"　>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						性&nbsp;&nbsp;&nbsp;&nbsp;别：
					</td>
					<td bgcolor="#FFFFEC">
						<input type="radio" name="schoolfellow.sex" value="男" checked="checked">男 &nbsp;&nbsp;
						<input type="radio" name="schoolfellow.sex" id="sex" value="女" >女
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						出生年月：
					</td>
					<td bgcolor="#FFFFEC">
						 <input type="text" id="birthday" class="Wdate" name="schoolfellow.birthday" value="" onfocus="setday(this,document.getElementById('birthday'));" readonly="readonly"/>
		   					 <img style="cursor: hand;" src="<%=request.getContextPath()%>/image/timer.gif" width="16"
										height="16" border="0" alt="请选择日期"
										onClick="setday(this,document.getElementById('birthday'));" />
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						学&nbsp;&nbsp;&nbsp;&nbsp;位：
					</td>
					<td bgcolor="#FFFFEC">
						<select name="schoolfellow.degree" id="degree" >
							<option value="">---请选择---</option>
							<option value="学士">学士</option>
							<option value="硕士">硕士</option>
							<option value="博士">博士</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						所属院系：
					</td>
					<td bgcolor="#FFFFEC">
						<select name="schoolfellow.department" id="department" >
							<option value="">---请选择---</option>
							<option value="管理科学与工程系">管理科学与工程系</option>
							<option value="信息管理系">信息管理系</option>
							<option value="经济贸易系">经济贸易系</option>
							<option value="会计系">会计系</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						照&nbsp;&nbsp;&nbsp;&nbsp;片：
					</td>
					<td bgcolor="#FFFFEC">
						<input type="file" name="photo" class="bd4" size="20" id="photo" onchange="checkFile();"/>
						(支持.JPG.JPEG.JIF格式) <!--<a href="javascript:viewImg();">预览</a>
					--></td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						简&nbsp;&nbsp;&nbsp;&nbsp;介：
					</td>
					<td bgcolor="#FFFFEC" >
					
						<jsp:include page="../../../common/editor.jsp"/>

					</td>
				</tr>
				<tr>
					<td height="24" colspan="2"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<input type="submit" name="Submit" value="确认" onclick="return goSub();" />
							<input type="button" value="返回" onclick="goback();" />
						</div>
					</td>
				</tr>
			</table>
			<%@ include file="../../../common/token.jsp"%>
		</form>


	</body>
</html>
