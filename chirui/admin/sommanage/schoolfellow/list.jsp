<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="../../../common/taglibs.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" />
	<title>SOM网站管理－杰出校友</title>
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
			window.location.href = "<%=request.getContextPath()%>/admin/sommanage/schoolfellow/add.jsp";
		}
	</script>
</head>
<body>
<jsp:include page="../../../common/buttonPage.jsp" />
<form action="<%=request.getContextPath()%>/schoolfellowAction.do" method="post">
	<input type="hidden" id="actionType" name="actionType" value=""/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="wudi">
				&nbsp;您现在的位置：网站管理 → 杰出校友 
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
			<td width="10%">
				<span class="ziti">序号</span>&nbsp;
			</td>
			<td width="13%">
				<span class="ziti">姓名</span>&nbsp;
			</td>
			<td width="13%">
				<span class="ziti">性别</span>&nbsp;
			</td>					
			<td width="13%">
				<span class="ziti">学位</span>&nbsp;
			</td>					
			<td width="13%">
				<span class="ziti">所属院系</span>&nbsp;
			</td>					
			<td width="13%">
				<span class="ziti">创建日期</span>&nbsp;
			</td>			
			<td width="*%">
				<span class="ziti">操作</span>&nbsp;
			</td>
		</tr>
		<c:forEach items="${list}" var="object" varStatus="index" >
			
				<tbody class="${ (index.count%2 != 0) ? 'tb1' : 'tb2' }">
					<tr bgcolor="#E2FAFE">
						<td>
							<div align="center">
								<input type="checkbox" name="keys"
											value="${object.id}" />
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${index.count}"/>
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${object.name}"/>
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${object.sex}"/>
							</div>
						</td>								
						<td>
							<div align="center">
								<c:out value="${object.degree}"/>
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${object.department}"/>
							</div>
						</td>				
						<td>
							<div align="center">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${object.createTime}"/>
							</div>
						</td>
						
						<td align="center">
							<a href="<%=request.getContextPath()%>/schoolfellowAction.do?actionType=3&key=${object.id}" >修改</a>	&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="<%=request.getContextPath()%>/schoolfellowAction.do?actionType=4&key=${object.id}" >详细</a>
							
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
						<td valign="middle" width="30" id="RZdel" style="">
							<input type="button" class="ziti" value="删除" onClick="return RZdel();"/>
						</td>
						<td valign="middle" width="30" id="RZtjczt" style="">
							<input type="button" class="ziti" value="添加校友" onClick="return add();"/>
						</td>
										
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
