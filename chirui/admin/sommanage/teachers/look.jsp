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
<script type="text/javascript">
	
	//����
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
						&nbsp;�����ڵ�λ�ã���վ���� �� ʦ�ʶ������ �� ʦ�ʶ���鿴
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
							<span class="header">ʦ�ʶ���鿴</span>
						</div>
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						����ģ�飺
					</td>
					<td width="*%"  bgcolor="#FFFFEC">${object.model}
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						������
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${object.name}
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">${object.placeIndex}
					</td>
				</tr>
					<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						�������£�
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
							<fmt:formatDate value="${object.brithDate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						��ϵ�绰��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${fn:substringBefore(object.tel, 'a')}
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						E-mail��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${fn:substringBefore(object.email, '|')}
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						ְ�ƣ�
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					${object.positional == "1" ? "Ժʿ":""}
					${object.positional == "2" ? "����":""}
					${object.positional == "3" ? "������":""}
					${object.positional == "4" ? "��ʦ":""}
					${object.positional == "5" ? "����":""}
					</td>
				</tr>
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						ѧ����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">${object.educational}</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						ѧλ��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">${object.degree}</td>
				 </tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						��ʦ���ͣ�
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${object.type == "1" ? "˶��":"����"}
					</td>
				 </tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						��ҵԺУ��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
			
		                ${object.graduatedFrom}
					</td>
				</tr>
				
				    <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						ϵ��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						 ${object.departments}
					</td>
				</tr>
				  <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						�о�����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
				
					${object.researches}
					</td>
				</tr>
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						��Ƭ��
					</td>
					<td bgcolor="#FFFFEC">
						<c:if test='${object.photoPath != null && object.photoPath !=""}'>
							<img src="<%=request.getContextPath()%>/${object.photoPath}" id="photo_img"/> 
						
						</c:if>
						<c:if test='${object.photoPath == null || object.photoPath ==""}'>
							(����Ƭ)
						</c:if>
					
					</td>
				</tr>
				<tr>
					<td valign="middle" align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						��ѧ�����
					</td>
					<td bgcolor="#FFFFEC">
					
					    <textarea class="ziti" rows="5" cols="90" name="somTeacher.studyabroad" readonly>${object.studyabroad}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle" align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						�����γ̣�
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="90" name="somTeacher.courses">${object.courses}</textarea>
					</td>
				</tr>
				<tr>
					<td valign="middle" align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						ѧ����ְ��
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="90" name="somTeacher.committeeBroad" readonly>${object.committeeBroad}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle" align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						ѧϰ����������300�֣���
					</td>
					<td bgcolor="#FFFFEC">
						<textarea valign="middle" class="ziti" rows="10" cols="90" name="somTeacher.workingExperience">${object.workingExperience}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle" align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						��ѧ���о��ɹ����񽱣�300�֣���
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="10" cols="90" name="somTeacher.researchResults">${object.researchResults}</textarea>
					</td>
				</tr>
				
				
				
				
				
				
				
				
				<tr>
					<td height="24" colspan="2"	background="<%=request.getContextPath()%>/images/di.jpg">
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
