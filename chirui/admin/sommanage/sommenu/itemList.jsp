<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="../../../common/taglibs.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" />
	<title>SOM��վ������Ŀ����</title>
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
			var params = "?menuId=${menuId}&menuName=${menuName}&level=${menuLevel}";
			window.location.href = "<%=request.getContextPath()%>/admin/sommanage/sommenu/itemAdd.jsp" + params;
		}
	</script>
</head>
<body>
<jsp:include page="../../../common/buttonPage.jsp" />
<form name="somMenuForm" action="<%=request.getContextPath() %>/somMenuAction.do" method="post">
	<input type="hidden" id="actionType" name="actionType" value=""/>
	<input type="hidden" id="menuId" name="menuId" value='${menuId == null ? "0" : menuId}'/>
	<input type="hidden" id="menuLevel" name="menuLevel" value="${menuLevel}"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="wudi">
				&nbsp;�����ڵ�λ�ã���վ���� �� ��Ŀ���� �� <c:if test='${menuLevel == "1" }'>һ</c:if><c:if test='${menuLevel == "2" }'>��</c:if><c:if test='${menuLevel == "3" }'>��</c:if>����Ŀ
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
			<!-- ����һ���˵�ɾ�� -->
			<c:if test='${menuLevel != "1" }'>
				<td width="10%" height="20">
					<input type="checkbox" name="delkeys" onClick="return RZchose();" />
				</td>
			</c:if>
			<td width="10%">
				<span class="ziti">��Ŀ���</span>&nbsp;
			</td>
			
			<td width="20%">
				<span class="ziti">��Ŀ����</span>&nbsp;
			</td>					
			<td width="15%">
				<span class="ziti">��ʾ״̬</span>&nbsp;
			</td>			
			<td width="15%">
				<span class="ziti">��������</span>&nbsp;
			</td>			
			<td width="*%">
				<span class="ziti">����</span>&nbsp;
			</td>
		</tr>
		<c:forEach items="${list}" var="somMenu" varStatus="index" >
			
				<tbody class="${ (index.count%2 != 0) ? 'tb1' : 'tb2' }">
					<tr bgcolor="#E2FAFE">
						<!-- ����һ���˵�ɾ�� -->
						<c:if test='${menuLevel != "1" }'>
							<td>
								<div align="center">
									<input type="checkbox" name="keys"
												value="${somMenu.id}" />
								</div>
							</td>
						</c:if>
						<td>
							<div align="center">
								<c:out value="${somMenu.menuIndex}"/>
							</div>
						</td>						
						<td>
							<div align="center">
								<c:out value="${somMenu.menuName}"/>
							</div>
						</td>								
						<td>
							<div align="center">
								<c:if test='${somMenu.menuState == "1"}'><span style="color:green;">��ʾ</span></c:if>
								<c:if test='${somMenu.menuState == "0"}'><span style="color:red;">����</span></c:if>
							</div>
						</td>								
						<td>
							<div align="center">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${somMenu.createTime}"/>
							</div>
						</td>
						
						<td align="center">
							<c:if test='${menuLevel !=3}'>
								<a href="<%=request.getContextPath()%>/somMenuAction.do?actionType=7&menuId=${somMenu.menuId}&menuName=${somMenu.menuName}&menuLevel=${somMenu.menuLevel+1}" title="�鿴����Ŀ">����Ŀ</a>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if>
							<a href="<%=request.getContextPath()%>/somMenuAction.do?actionType=3&key=${somMenu.id}&menuName=${requestScope.menuName}" title="�޸���Ŀ����">�޸�</a>	&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="<%=request.getContextPath()%>/somMenuAction.do?actionType=4&key=${somMenu.id}&menuName=${requestScope.menuName}" title="�鿴��Ŀ��ϸ">��ϸ</a>
							
						</td>
					</tr>
				</tbody>
		</c:forEach>
	
	</table>
	<table width="100%" height="33" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
		<tr>
			<td height="30" class="wushang" width="100%" valign="middle">
				<table width="15%" border="0">
					<tr>
						<c:if test='${menuLevel != "1" }'>
							<td valign="middle" width="30" id="RZdel" style="">
								<input type="button" class="ziti" value="ɾ��" onClick="return RZdel();"/>
							</td>
						</c:if>
						<td valign="middle" width="30" id="RZtjczt" style="">
							<input type="button" class="ziti" value="�����Ŀ" onClick="return add();"/>
						</td>
						<c:if test='${menuLevel !=1}'>
						<td id="RZdel">
							<input type="button" class="ziti" value="����" onClick="javascript:history.back();"/>	
						</td>
						</c:if>
					
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<%@ include file="../../../common/token.jsp" %>
</form>
<jsp:include page="../../../common/splitPage.jsp" />
</body>
</html>
