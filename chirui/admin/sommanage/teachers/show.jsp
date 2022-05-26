<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="../../../common/taglibs.jsp" %>
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
	<title>��ʦ��Ϣ����</title>
	<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="<%=request.getContextPath()%>/script/calendar.js"></script>
	<style type="text/css">
		table#list tbody.tb1 td {
			background-color: #ECFBFF;
		}
		table#list tbody.tb2 td {
			background-color: #FFFFEC;
		}
	</style>
	<script type="text/javascript">
		function add(){
			window.location.href = "<%=request.getContextPath()%>/admin/sommanage/teachers/add.jsp";
		}
	</script>
</head>
<body>
<jsp:include page="../../../common/buttonPage.jsp" />
<form name="somTeacherAction" action="<%=request.getContextPath() %>/somTeacherAction.do" method="post">
	<input type="hidden" id="actionType" name="actionType" value=""/>
	<input type="hidden" id="state" name="state" value="1"/>
	<input type="hidden" id="menuId" name="parentMenuId" value="${menuId}"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="wudi">
				&nbsp;�����ڵ�λ�ã���վ���� �� ʦ�ʶ���
			</td>
		</tr>
	</table>
	<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
	  <tr>
	    <td height="20"></td>
	  </tr>
	</table>
	<table width="100%" height="27"  border="0" cellpadding="0" cellspacing="0" bordercolor="#B7DBFF" style="border-collapse: collapse"  background="<%=request.getContextPath()%>/images/di.jpg">
	  <tr> 
		<td width="7%" ><div align="right"><span class="ziti">��ʦ����&nbsp;</span></div></td>
	    <td width="9%" bordercolor="#B7DBFF"><span class="ziti">&nbsp;
	    <html:text styleClass="shuru" maxlength="30" property="name" size="15" value=""/>
	    </span>
		</td>
		
	    <td width="4%"><div align="right"><span class="ziti">&nbsp;ѧλ&nbsp;</span></div></td>
	    <td width="9%"><span class="ziti">
	    <html:text styleClass="shuru" maxlength="100" property="degree" size="15" value=""/>
	    </span></td>
	    
	    <td width="5%"><div align="right"><span class="ziti">&nbsp;ϵ��&nbsp;</span></div></td>
	    <td width="10%"><span class="ziti">
	    <html:text styleClass="shuru" maxlength="10" property="departments" size="25" value=""/>
	    </span></td>
	    
	    <td width="8%" ><div align="right" ><span class="ziti">&nbsp;��ҵԺУ</span></div></td>
	    <td width="16%"><span class="ziti">&nbsp;
	    <html:text styleClass="shuru" maxlength="10" property="graduatedFrom" size="25" value=""/>
	    </span></td>
		
	    <td width="11%">&nbsp;&nbsp;
		  <html:submit styleClass="ziti" value="��ѯ" property="Submit4" onclick="return RZquery();"/>
	    </td>
	  </tr>
	</table>

	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="20"></td>
	  </tr>
	</table>
	<table id="list" width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
		<tr align="center" bgcolor="#B7DBFF">
			<td width="10%" height="20">
				<input type="checkbox" name="delkeys" onClick="return RZchose();" />
			</td>
			<td width="*%" align="left">
				<span class="ziti">&nbsp;&nbsp;��ʦ����</span>&nbsp;
			</td>
			<td width="*%">
				<span class="ziti">ְ��</span>&nbsp;
			</td>
			<td width="*%">
				<span class="ziti">&nbsp;ѧλ</span>&nbsp;
			</td>			
			
			<td width="*%">
				<span class="ziti">&nbsp;ϵ��</span>&nbsp;
			</td>	
			
			<td width="*%">
				<span class="ziti">&nbsp;��ҵԺУ</span>&nbsp;
			</td>	
			<td width="*%">
				<span class="ziti">����</span>&nbsp;
			</td>
		</tr>
		<c:forEach items="${list}" var="somTeacher" varStatus="index" >
			
				<tbody class="${ (index.count%2 != 0) ? 'tb1' : 'tb2' }">
				<%
				if(roleflag.equals("teacher")){
				%>
				
				<c:if   test="${(username) eq (somTeacher.name)   }">   
				
					<tr bgcolor="#E2FAFE">
						<td>
							<div align="center">
								<input type="checkbox" name="keys"
											value="${somTeacher.id}" />
							</div>
						</td>
						<td>
							<div align="left">&nbsp;
								<c:out value="${somTeacher.name}"/>
							</div>
						</td>
						
						<td>
							<div align="center">
								
								<c:out value='${somTeacher.positional == "1" ? "Ժʿ":""}'/>
								<c:out value='${somTeacher.positional == "2" ? "����":""}'/>
								<c:out value='${somTeacher.positional == "3" ? "������":""}'/>
								<c:out value='${somTeacher.positional == "4" ? "��ʦ":""}'/>
								<c:out value='${somTeacher.positional == "5" ? "����":""}'/>
							</div>
						</td>
						
						<td>
							<div align="center">
								<c:out value="${somTeacher.degree}"/>
							</div>
						</td>
						
						<td>
							<div align="center">
								<c:out value="${somTeacher.departments}"/>
							</div>
						</td>
						
						
						<td>
							<div align="center">
								<c:out value="${somTeacher.graduatedFrom}"/>
							</div>
						</td>
						
						<td align="center">
						     	<a href="<%=request.getContextPath()%>/somTeacherAction.do?actionType=3&key=${somTeacher.id}" title="�޸���Ŀ����">�޸�</a>	&nbsp;&nbsp;&nbsp;&nbsp;
					    
						
							<a href="<%=request.getContextPath()%>/somTeacherAction.do?actionType=4&key=${somTeacher.id}" title="�鿴��Ŀ��ϸ">��ϸ</a>
						</td>
						
					</tr>
					</c:if>
					<%}else{%>
					<tr bgcolor="#E2FAFE">
						<td>
							<div align="center">
								<input type="checkbox" name="keys"
											value="${somTeacher.id}" />
							</div>
						</td>
						<td>
							<div align="left">&nbsp;
								<c:out value="${somTeacher.name}"/>
							</div>
						</td>
						
						<td>
							<div align="center">
								
								<c:out value='${somTeacher.positional == "1" ? "Ժʿ":""}'/>
								<c:out value='${somTeacher.positional == "2" ? "����":""}'/>
								<c:out value='${somTeacher.positional == "3" ? "������":""}'/>
								<c:out value='${somTeacher.positional == "4" ? "��ʦ":""}'/>
								<c:out value='${somTeacher.positional == "5" ? "����":""}'/>
							</div>
						</td>
						
						<td>
							<div align="center">
								<c:out value="${somTeacher.degree}"/>
							</div>
						</td>
						
						<td>
							<div align="center">
								<c:out value="${somTeacher.departments}"/>
							</div>
						</td>
						
						
						<td>
							<div align="center">
								<c:out value="${somTeacher.graduatedFrom}"/>
							</div>
						</td>
						
						<td align="center">
						     	<a href="<%=request.getContextPath()%>/somTeacherAction.do?actionType=3&key=${somTeacher.id}" title="�޸���Ŀ����">�޸�</a>	&nbsp;&nbsp;&nbsp;&nbsp;
					    
						
							<a href="<%=request.getContextPath()%>/somTeacherAction.do?actionType=4&key=${somTeacher.id}" title="�鿴��Ŀ��ϸ">��ϸ</a>
						</td>
						
					</tr>
					<%}%>
				</tbody>
		</c:forEach>
	
	</table>
	<table width="100%" height="33" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
		<tr>
			<td height="30" class="wushang" width="100%" valign="middle">
			  <%  if(!roleflag.equals("teacher")){%>
				<table width="15%" border="0">
					<tr>
						<td valign="middle" width="30" id="RZdel" style="">
							<input type="button" class="ziti" value="ɾ��" onClick="return RZdel();"/>
						</td>
						<td valign="middle" width="30" id="RZtjczt" style="">
							<input type="button" class="ziti" value="��ӵ�ʦ" onClick="return add();"/>
						</td>
					</tr>
				</table>
				<%}%>
			</td>
		</tr>
	</table>
	<jsp:include page="../../../common/splitPage.jsp" />
</form>

</body>
</html>
