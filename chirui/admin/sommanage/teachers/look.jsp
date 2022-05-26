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
<script type="text/javascript">
	
	//返回
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/somTeacherAction.do?actionType=0";
	}
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/somTeacherAction.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="actionType" name="actionType" value="5"/>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;您现在的位置：网站管理 → 师资队伍管理 → 师资队伍查看
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
			<table width="80%" border="1" align="left" cellpadding="0"
				cellspacing="0" bordercolor="#DEE5EF"
				style="border-collapse: collapse">
				<tr>
					<td height="24" colspan="2" class="ziti"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<span class="header">师资队伍查看</span>
						</div>
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						所在模块：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">${object.model}
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						姓名：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${object.name}
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						排序：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">${object.placeIndex}
					</td>
				</tr>
					<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						出生年月：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
							<fmt:formatDate value="${object.brithDate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						联系电话：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${fn:substringBefore(object.tel, 'a')}
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						E-mail：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${fn:substringBefore(object.email, '|')}
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						职称：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					${object.positional == "1" ? "院士":""}
					${object.positional == "2" ? "教授":""}
					${object.positional == "3" ? "副教授":""}
					${object.positional == "4" ? "讲师":""}
					${object.positional == "5" ? "助教":""}
					</td>
				</tr>
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						学历：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">${object.educational}</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						学位：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">${object.degree}</td>
				 </tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						导师类型：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${object.type == "1" ? "硕导":"博导"}
					</td>
				 </tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						毕业院校：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
			
		                ${object.graduatedFrom}
					</td>
				</tr>
				
				    <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						系别：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						 ${object.departments}
					</td>
				</tr>
				  <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						研究方向：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
				
					${object.researches}
					</td>
				</tr>
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						照片：
					</td>
					<td bgcolor="#FFFFEC">
						<c:if test='${object.photoPath != null && object.photoPath !=""}'>
							<img src="<%=request.getContextPath()%>/${object.photoPath}" id="photo_img"/> 
						
						</c:if>
						<c:if test='${object.photoPath == null || object.photoPath ==""}'>
							(无照片)
						</c:if>
					
					</td>
				</tr>
				<tr>
					<td valign="middle" align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						留学情况：
					</td>
					<td bgcolor="#FFFFEC">
					
					    <textarea class="ziti" rows="5" cols="90" name="somTeacher.studyabroad" readonly>${object.studyabroad}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle" align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						主讲课程：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="90" name="somTeacher.courses">${object.courses}</textarea>
					</td>
				</tr>
				<tr>
					<td valign="middle" align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						学术兼职：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="90" name="somTeacher.committeeBroad" readonly>${object.committeeBroad}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle" align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						学习工作简历（300字）：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea valign="middle" class="ziti" rows="10" cols="90" name="somTeacher.workingExperience">${object.workingExperience}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle" align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						教学及研究成果、获奖（300字）：
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="10" cols="90" name="somTeacher.researchResults">${object.researchResults}</textarea>
					</td>
				</tr>
				
				
				
				
				
				
				
				
				<tr>
					<td height="24" colspan="2"	background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<input type="button" value="返回" onclick="goback();" />
						</div>
					</td>
				</tr>
				
			</table>
			<%@ include file="../../../common/token.jsp"%>

		</form>
	</body>
</html>
