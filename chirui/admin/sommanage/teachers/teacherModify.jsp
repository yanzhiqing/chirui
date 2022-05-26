<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.*"%>
<%@ page import="crjd.model.admin.sommanage.teachers.SomTeacher"%>
<%@ include file="../../../common/taglibs.jsp"%>
<%@ page import="crjd.common.SplitPageParameter,crjd.common.SessionContainer" %>

<%

    String roleflag="noteacher";
	SessionContainer sContainer = (SessionContainer)session.getAttribute("sessionContainer");
    request.setAttribute("username",sContainer.getUserName());
	
	String role[]=sContainer.getRoleId();
	 for (int i=0;i<role.length;i++){
	     if(role[i].equals("20")){
	        roleflag="teacher";
	        break;
	     }
	 }
 %>
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
			alert("请输入校友姓名！");
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
	/** 认证上传文件格式。 */
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
		
		var newIndex = document.getElementById("placeIndex");
		var oldIndex = document.getElementById("oldplaceIndex");
		if(newIndex.value == ""  || ! /^\d*$/.test(newIndex.value)){
			alert("教师排序不能空,并且只能是数字！");
			newIndex.focus();
			newIndex.focus();
			return false;
		}else if(newIndex.value != oldIndex.value){
			if(!confirm("您确定要更改教师排序吗？")){
				return false;
			}
		}
		
		return true;
	}
	
	
	function viewImg(){
		var o = document.getElementById("photo");
		var fileName = o.value;
		if(fileName == ""){
			alert("请选择要上传的图片文件");
			return;
		}
		
		
		if(!checkFile()){return;}
		
		var path = "file:///" + fileName;
		if(document.getElementById("photo_img") != undefined){
			document.getElementById("photo_img").src = path;
		}
		//window.open(path); 
		return ;
	}	
	
	function modify(){
		document.getElementById("img_div").style.display = "";
	}
	
	
	//返回
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/somTeacherAction.do?actionType=0";
	}
	
	//检查索引是数字
	var checkDate = function(o){
		
		if(o.value == "" || ! /^\d*$/.test(o.value)){
			alert("排序索引不能空,并且只能是数字！");
			o.focus();
		}
	}
	
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/somTeacherAction.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="actionType" name="actionType" value="5"/>
			<input type="hidden" name="somTeacher.id" id="id" value='${object.id }' />
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;您现在的位置：网站管理 → 师资队伍管理 → 师资队伍修改
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
							<span class="header">师资队伍修改</span>
						</div>
					</td>
				</tr>
				<%
				if(roleflag.equals("noteacher")){
				%>
	            <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						所在模块：
					</td>
					<td width="*%"  bgcolor="#FFFFEC"><input TYPE="hidden" name="somTeacher.model">
					<input type="checkbox" value="导师风采" name="model" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getModel()).indexOf("导师风采")==-1)?"":"checked"%>>导师风采&nbsp;
					<input type="checkbox" value="师资队伍" name="model" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getModel()).indexOf("师资队伍")==-1)?"":"checked"%>>师资队伍&nbsp;
					<input type="checkbox" value="合作导师" name="model" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getModel()).indexOf("合作导师")==-1)?"":"checked"%>>合作导师&nbsp;
					<input type="checkbox" value="高培师资" name="model" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getModel()).indexOf("高培师资")==-1)?"":"checked"%>>高级管理培训中心师资&nbsp;
					</td>
				</tr>
				<%
				}
				 %>
			   <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						姓名：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.name" id="name" maxlength="20" value="${object.name}">
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						排序：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.placeIndex" id="placeIndex"	maxlength="3" value="${object.placeIndex}"  onchange="checkDate(this)">
						<input type="hidden" name="oldplaceIndex" id="oldplaceIndex" value="${object.placeIndex}">( 只能是数据字 )
					</td>
				</tr>
					<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						出生年月：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					    <input type="text" id="brithDate" name="somTeacher.brithDate" maxlength="10" value="${object.brithDate}"/>
					    &nbsp;&nbsp;&nbsp;&nbsp;
					    <input type="checkbox" value="1" id="brithDateFlag" name="somTeacher.brithDateFlag" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getBrithDateFlag()).equals("1"))?"checked":""%>>在前台页面可见
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						联系电话：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					    <input type="text" name="somTeacher.tel" id="tel" maxlength="20" value="${fn:substringBefore(object.tel, 'a')}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="a" name="telFlag" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getTel()).indexOf("a")==-1)?"":"checked"%>>在前台页面可见
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						E-mail：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.email" id="email" maxlength="50"　value="${fn:substringBefore(object.email, '|')}"/>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="|" name="emailFlag">在前台页面可见
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						职称：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					   <select name="somTeacher.positional" id="positional" value="${object.positional}">
							<option value="">---请选择---</option>
							<option value="1" ${object.positional == "1" ? "selected":""}>院士</option>
							<option value="2" ${object.positional == "2" ? "selected":""}>教授</option>
							<option value="3" ${object.positional == "3" ? "selected":""}>副教授</option>
							<option value="4" ${object.positional == "4" ? "selected":""}>讲师</option>
							<option value="5" ${object.positional == "5" ? "selected":""}>助教</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						学历：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					    <select name="somTeacher.educational" id="educational" value="${object.educational}">
							<option value="">---请选择---</option>
							<option value="大专" ${object.educational == "大专" ? "selected":""}>大专</option>
							<option value="本科" ${object.educational == "本科" ? "selected":""}>本科</option>
							<option value="硕士研究生" ${object.educational == "硕士研究生" ? "selected":""}>硕士研究生</option>
							<option value="博士研究生" ${object.educational == "博士研究生" ? "selected":""}>博士研究生</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						学位：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.degree" id="degree" value="${object.degree}">
							<option value="">---请选择---</option>
							<option value="学士" ${object.degree == "学士" ? "selected":""} >学士</option>
							<option value="硕士" ${object.degree == "硕士" ? "selected":""}>硕士</option>
							<option value="博士" ${object.degree == "博士" ? "selected":""}>博士</option>
						</select>
					</td>
				 </tr>
				 <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						导师类型：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.type" id="type" value="${object.type}">
							<option value="">---请选择---</option>
							<option value="1" ${object.type == "1" ? "selected":""} >硕导</option>
							<option value="2" ${object.type == "2" ? "selected":""}>博导</option>
						</select>
					</td>
				 </tr>
				 
				
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						毕业院校：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					  <input type="text" name="somTeacher.graduatedFrom" id="name" maxlength="40" value="${object.graduatedFrom}">
					  
					</td>
				</tr>
				
				    <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						系别：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					 <select name="somTeacher.departments" id="departments" value="${object.departments}">
							<option value="">---请选择---</option>
							<option value="工商管理系" ${object.departments == "工商管理系" ? "selected":""}>工商管理系</option>
							<option value="管理科学与工程系" ${object.departments == "管理科学与工程系" ? "selected":""}>管理科学与工程系</option>
							<option value="信息管理系" ${object.departments == "信息管理系" ? "selected":""}>信息管理系</option>
							<option value="经济贸易系" ${object.departments == "经济贸易系" ? "selected":""}>经济贸易系</option>
							<option value="会计系" ${object.departments == "会计系" ? "selected":""}>会计系</option>
						</select>	
					</td>
				</tr>
				  <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						研究方向：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					 <input type="text" size="40"name="somTeacher.researches" id="name" maxlength="200" value="${object.researches}">
					
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						照片：
					</td>
					<td bgcolor="#FFFFEC">
						<input type="hidden" name="somTeacher.photoPath" id="name" value="${object.photoPath}"/>
						<c:if test='${object.photoPath != null && object.photoPath !=""}'>
							<img src="<%=request.getContextPath()%>/${object.photoPath}" id="photo_img"/> 
							 <a href="javascript:modify();">更换照片</a>
						</c:if>
						<c:if test='${object.photoPath == null || object.photoPath == ""}'>
							(无照片)&nbsp;&nbsp;<a href="javascript:modify();">添加照片</a>
						</c:if>
						<div id="img_div" style="display:none">
							<input type="file" name="photo" class="bd4" size="40" id="photo" onchange="viewImg();"/>
							(支持.JPG.JPEG.JIF格式) <!--<a href="javascript:viewImg();">预览</a>
						--></div>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						留学情况：
					</td>
					<td bgcolor="#FFFFEC">
					
					    <textarea class="ziti" rows="5" cols="100" name="somTeacher.studyabroad">${object.studyabroad}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						主讲课程：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="100" name="somTeacher.courses">${object.courses}</textarea>
					</td>
				</tr>
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						学术兼职：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="100" name="somTeacher.committeeBroad">${object.committeeBroad}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						学习工作简历（300字）：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="10" cols="100" name="somTeacher.workingExperience">${object.workingExperience}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="left" bgcolor="#ECFBFF" class="ziti" valign="top">
					  教学及研究成果、获奖（300字）：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="10" cols="100" name="somTeacher.researchResults">${object.researchResults}</textarea>
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
