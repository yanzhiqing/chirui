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
			alert("������У��������");
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
		
		var newIndex = document.getElementById("placeIndex");
		var oldIndex = document.getElementById("oldplaceIndex");
		if(newIndex.value == ""  || ! /^\d*$/.test(newIndex.value)){
			alert("��ʦ�����ܿ�,����ֻ�������֣�");
			newIndex.focus();
			newIndex.focus();
			return false;
		}else if(newIndex.value != oldIndex.value){
			if(!confirm("��ȷ��Ҫ���Ľ�ʦ������")){
				return false;
			}
		}
		
		return true;
	}
	
	
	function viewImg(){
		var o = document.getElementById("photo");
		var fileName = o.value;
		if(fileName == ""){
			alert("��ѡ��Ҫ�ϴ���ͼƬ�ļ�");
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
	
	
	//����
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/somTeacherAction.do?actionType=0";
	}
	
	//�������������
	var checkDate = function(o){
		
		if(o.value == "" || ! /^\d*$/.test(o.value)){
			alert("�����������ܿ�,����ֻ�������֣�");
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
						&nbsp;�����ڵ�λ�ã���վ���� �� ʦ�ʶ������ �� ʦ�ʶ����޸�
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
							<span class="header">ʦ�ʶ����޸�</span>
						</div>
					</td>
				</tr>
				<%
				if(roleflag.equals("noteacher")){
				%>
	            <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						����ģ�飺
					</td>
					<td width="*%"  bgcolor="#FFFFEC"><input TYPE="hidden" name="somTeacher.model">
					<input type="checkbox" value="��ʦ���" name="model" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getModel()).indexOf("��ʦ���")==-1)?"":"checked"%>>��ʦ���&nbsp;
					<input type="checkbox" value="ʦ�ʶ���" name="model" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getModel()).indexOf("ʦ�ʶ���")==-1)?"":"checked"%>>ʦ�ʶ���&nbsp;
					<input type="checkbox" value="������ʦ" name="model" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getModel()).indexOf("������ʦ")==-1)?"":"checked"%>>������ʦ&nbsp;
					<input type="checkbox" value="����ʦ��" name="model" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getModel()).indexOf("����ʦ��")==-1)?"":"checked"%>>�߼�������ѵ����ʦ��&nbsp;
					</td>
				</tr>
				<%
				}
				 %>
			   <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						������
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.name" id="name" maxlength="20" value="${object.name}">
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.placeIndex" id="placeIndex"	maxlength="3" value="${object.placeIndex}"  onchange="checkDate(this)">
						<input type="hidden" name="oldplaceIndex" id="oldplaceIndex" value="${object.placeIndex}">( ֻ���������� )
					</td>
				</tr>
					<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						�������£�
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					    <input type="text" id="brithDate" name="somTeacher.brithDate" maxlength="10" value="${object.brithDate}"/>
					    &nbsp;&nbsp;&nbsp;&nbsp;
					    <input type="checkbox" value="1" id="brithDateFlag" name="somTeacher.brithDateFlag" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getBrithDateFlag()).equals("1"))?"checked":""%>>��ǰ̨ҳ��ɼ�
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						��ϵ�绰��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					    <input type="text" name="somTeacher.tel" id="tel" maxlength="20" value="${fn:substringBefore(object.tel, 'a')}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="a" name="telFlag" <%=(Toolkit.dealNull(((SomTeacher) request.getAttribute("object")).getTel()).indexOf("a")==-1)?"":"checked"%>>��ǰ̨ҳ��ɼ�
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						E-mail��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<input type="text" name="somTeacher.email" id="email" maxlength="50"��value="${fn:substringBefore(object.email, '|')}"/>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="|" name="emailFlag">��ǰ̨ҳ��ɼ�
					</td>
				</tr>
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						ְ�ƣ�
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					   <select name="somTeacher.positional" id="positional" value="${object.positional}">
							<option value="">---��ѡ��---</option>
							<option value="1" ${object.positional == "1" ? "selected":""}>Ժʿ</option>
							<option value="2" ${object.positional == "2" ? "selected":""}>����</option>
							<option value="3" ${object.positional == "3" ? "selected":""}>������</option>
							<option value="4" ${object.positional == "4" ? "selected":""}>��ʦ</option>
							<option value="5" ${object.positional == "5" ? "selected":""}>����</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						ѧ����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					    <select name="somTeacher.educational" id="educational" value="${object.educational}">
							<option value="">---��ѡ��---</option>
							<option value="��ר" ${object.educational == "��ר" ? "selected":""}>��ר</option>
							<option value="����" ${object.educational == "����" ? "selected":""}>����</option>
							<option value="˶ʿ�о���" ${object.educational == "˶ʿ�о���" ? "selected":""}>˶ʿ�о���</option>
							<option value="��ʿ�о���" ${object.educational == "��ʿ�о���" ? "selected":""}>��ʿ�о���</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						ѧλ��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.degree" id="degree" value="${object.degree}">
							<option value="">---��ѡ��---</option>
							<option value="ѧʿ" ${object.degree == "ѧʿ" ? "selected":""} >ѧʿ</option>
							<option value="˶ʿ" ${object.degree == "˶ʿ" ? "selected":""}>˶ʿ</option>
							<option value="��ʿ" ${object.degree == "��ʿ" ? "selected":""}>��ʿ</option>
						</select>
					</td>
				 </tr>
				 <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						��ʦ���ͣ�
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						<select name="somTeacher.type" id="type" value="${object.type}">
							<option value="">---��ѡ��---</option>
							<option value="1" ${object.type == "1" ? "selected":""} >˶��</option>
							<option value="2" ${object.type == "2" ? "selected":""}>����</option>
						</select>
					</td>
				 </tr>
				 
				
				<tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						��ҵԺУ��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					  <input type="text" name="somTeacher.graduatedFrom" id="name" maxlength="40" value="${object.graduatedFrom}">
					  
					</td>
				</tr>
				
				    <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						ϵ��
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					 <select name="somTeacher.departments" id="departments" value="${object.departments}">
							<option value="">---��ѡ��---</option>
							<option value="���̹���ϵ" ${object.departments == "���̹���ϵ" ? "selected":""}>���̹���ϵ</option>
							<option value="�����ѧ�빤��ϵ" ${object.departments == "�����ѧ�빤��ϵ" ? "selected":""}>�����ѧ�빤��ϵ</option>
							<option value="��Ϣ����ϵ" ${object.departments == "��Ϣ����ϵ" ? "selected":""}>��Ϣ����ϵ</option>
							<option value="����ó��ϵ" ${object.departments == "����ó��ϵ" ? "selected":""}>����ó��ϵ</option>
							<option value="���ϵ" ${object.departments == "���ϵ" ? "selected":""}>���ϵ</option>
						</select>	
					</td>
				</tr>
				  <tr>
					<td  align="right" bgcolor="#ECFBFF" class="ziti">
						�о�����
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					 <input type="text" size="40"name="somTeacher.researches" id="name" maxlength="200" value="${object.researches}">
					
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						��Ƭ��
					</td>
					<td bgcolor="#FFFFEC">
						<input type="hidden" name="somTeacher.photoPath" id="name" value="${object.photoPath}"/>
						<c:if test='${object.photoPath != null && object.photoPath !=""}'>
							<img src="<%=request.getContextPath()%>/${object.photoPath}" id="photo_img"/> 
							 <a href="javascript:modify();">������Ƭ</a>
						</c:if>
						<c:if test='${object.photoPath == null || object.photoPath == ""}'>
							(����Ƭ)&nbsp;&nbsp;<a href="javascript:modify();">�����Ƭ</a>
						</c:if>
						<div id="img_div" style="display:none">
							<input type="file" name="photo" class="bd4" size="40" id="photo" onchange="viewImg();"/>
							(֧��.JPG.JPEG.JIF��ʽ) <!--<a href="javascript:viewImg();">Ԥ��</a>
						--></div>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						��ѧ�����
					</td>
					<td bgcolor="#FFFFEC">
					
					    <textarea class="ziti" rows="5" cols="100" name="somTeacher.studyabroad">${object.studyabroad}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						�����γ̣�
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="100" name="somTeacher.courses">${object.courses}</textarea>
					</td>
				</tr>
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						ѧ����ְ��
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="5" cols="100" name="somTeacher.committeeBroad">${object.committeeBroad}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						ѧϰ����������300�֣���
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="10" cols="100" name="somTeacher.workingExperience">${object.workingExperience}</textarea>
					</td>
				</tr>
				
				<tr>
					<td valign="middle"  align="left" bgcolor="#ECFBFF" class="ziti" valign="top">
					  ��ѧ���о��ɹ����񽱣�300�֣���
					</td>
					<td bgcolor="#FFFFEC">
						<textarea class="ziti" rows="10" cols="100" name="somTeacher.researchResults">${object.researchResults}</textarea>
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
