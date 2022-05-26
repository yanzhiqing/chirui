<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.Toolkit;"%>
<%@ include file="../../../common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;" />
		<title>SOM网站管理-导师队伍</title>
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

	//返回
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/somTeacherAction.do?actionType=0";
	}
	
	//提交表单
	function goSub(){
		var name = document.getElementById("name");
		
		//联系电话是否在前台页面显示
		if(document.all["telFlag"].checked){
			document.all["somTeacher.tel"].value = document.all["somTeacher.tel"].value + "a";
		}else{
			document.all["somTeacher.tel"].value = document.all["somTeacher.tel"].value;
		}
		
		//E-mail是否在前台页面显示
		if(document.all["emailFlag"].checked){
			document.all["somTeacher.email"].value = document.all["somTeacher.email"].value + "|";
		}else{
			document.all["somTeacher.email"].value = document.all["somTeacher.email"].value;
		}
		
		model();
		if(name.value == ""){
			alert("请输入导师姓名！");
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
		<form action="<%=request.getContextPath()%>/somTeacherAction.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="actionType" name="actionType" value="1"/>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;您现在的位置：网站管理 → 导师队伍管理 → 导师添加
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
							<span class="header">导师添加</span>
						</div>
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						所在模块：
					</td>
					<td width="*%"  bgcolor="#FFFFEC"><input TYPE="hidden" name="somTeacher.model">
					<input type="checkbox" value="导师风采" name="model">导师风采&nbsp;
					<input type="checkbox" value="师资队伍" name="model">师资队伍&nbsp;
					<input type="checkbox" value="合作导师" name="model">合作导师&nbsp;
					<input type="checkbox" value="高培师资" name="model">高级管理培训中心师资&nbsp;
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						姓名：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.name" id="name"
							maxlength="20"　>
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						排序：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.placeIndex" id="placeIndex" maxlength="20" >
					</td>
				</tr>
					<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						出生年月：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						  <input type="text" id="brithDate" name="somTeacher.brithDate" maxlength="10"/>
						  <input type="checkbox" value="1" name="somTeacher.brithDateFlag" id="brithDateFlag">在前台页面可见
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						联系电话：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.tel" id="tel"
							maxlength="13">
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="a" name="telFlag">在前台页面可见
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						E-mail：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.email" id="email"
							maxlength="50"　>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="|" name="emailFlag">在前台页面可见
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						职称：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.positional" id="name" >
							<option value="">---请选择---</option>
							<option value="1">院士</option>
							<option value="2">教授</option>
							<option value="3">副教授</option>
							<option value="4">讲师</option>
							<option value="5">助教</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						学历：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.educational" id="name" >
						<option value="">---请选择---</option>
							<option value="大专">大专</option>
							<option value="本科">本科</option>
							<option value="硕士研究生">硕士研究生</option>
							<option value="博士研究生">博士研究生</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						学位：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.degree" id="name" >
							<option value="">---请选择---</option>
							<option value="学士">学士</option>
							<option value="硕士">硕士</option>
							<option value="博士">博士</option>
						</select>	
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						导师类型：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.type" id="name" >
							<option value="">---请选择---</option>
							<option value="1">硕导</option>
							<option value="2">博导</option>
						</select>	
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						毕业院校：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.graduatedFrom" id="name"
							maxlength="20"　>
					</td>
				</tr>
				
				    <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						系别：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.departments" id="name" >
							<option value="">---请选择---</option>
							<option value="工商管理系">工商管理系</option>
							<option value="管理科学与工程系">管理科学与工程系</option>
							<option value="信息管理系">信息管理系</option>
							<option value="经济贸易系">经济贸易系</option>
							<option value="会计系">会计系</option>
						</select>	
					</td>
				</tr>
				  <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						研究方向：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" size="40" name="somTeacher.researches" id="name"
							maxlength="200"　>
					</td>
				</tr>
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti">
						照片：
					</td>
					<td bgcolor="#FFFFEC">
						<input type="file" name="photo" class="bd4" size="40" id="photo" onchange="checkFile();"/>
						(支持.JPG.JPEG.JIF格式) <!--<a href="javascript:viewImg();">预览</a>
					--></td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						留学情况：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="100" name="somTeacher.studyabroad"></textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						主讲课程：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="100" name="somTeacher.courses"></textarea>
					</td>
				</tr>
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						学术兼职：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="100" name="somTeacher.committeeBroad"></textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						学习工作简历（300字）：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="10" cols="100" name="somTeacher.workingExperience"></textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						教学及研究成果、获奖（300字）：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="10" cols="100" name="somTeacher.researchResults"></textarea>
					</td>
				</tr>
				
				<tr>
					<td height="24" colspan="2"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<input type="submit" name="confirm" value="确认" onclick="return goSub();" />
							<input type="button" value="返回" onclick="goback();" />
						</div>
					</td>
				</tr>
			</table>
			<%@ include file="../../../common/token.jsp"%>

		</form>
	</body>
</html>
