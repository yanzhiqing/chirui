<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="../../../common/taglibs.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" />
	<title>SOM��վ����ԺУ�쵼</title>
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
			window.location.href = "<%=request.getContextPath()%>/admin/sommanage/leader/add.jsp";
		}
		
		/*===================================================
			���ܣ�����ʹ����ϢExcel����
		===================================================*/
		function RZprint(){
		    var excel="xm="+document.all["xm"].value+"&sxzy="+document.all["sxzy"].value+"&bmlb="+document.all["bmlb"].value;
			window.open("<%=request.getContextPath()%>/admin/sommanage/onlinebm/showExcel.jsp?"+excel, "_blank");
		}
		
	</script>
</head>
<body>
<jsp:include page="../../../common/buttonPage.jsp" />
<form action="<%=request.getContextPath()%>/onLineBmAction.do" method="post">
	<input type="hidden" id="actionType" name="actionType" value=""/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="wudi">
				&nbsp;�����ڵ�λ�ã���վ���� �� ���߱���
			</td>
		</tr>
	</table>
	
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="20"></td>
	  </tr>
	</table>
	<table width="100%" height="27"  border="0" cellpadding="0" cellspacing="0" bordercolor="#B7DBFF" style="border-collapse: collapse"  background="<%=request.getContextPath()%>/images/di.jpg">
	  <tr> 
		<td width="10%" ><div align="right"><span class="ziti">����&nbsp;</span></div></td>
	    <td width="10%" bordercolor="#B7DBFF"><span class="ziti">&nbsp;
	    <html:text styleClass="shuru" maxlength="30" property="xm" size="15" value=""/>
	    </span>
		</td>
		
	    <td width="10%"><div align="right"><span class="ziti">&nbsp;��ѧרҵ&nbsp;</span></div></td>
	    <td width="10%"><span class="ziti">
	    <html:text styleClass="shuru" maxlength="100" property="sxzy" size="15" value=""/>
	    </span></td>
	    
	    <td width="10%"><div align="right"><span class="ziti">&nbsp;�������&nbsp;</span></div></td>
	    <td width="10%"><span class="ziti">
	    <select name="bmlb" value="">
						    <option value="">--��ѡ��--</option>
							<option value="MBA">MBA</option>
							<option value="EMBA">EMBA</option>
							<option value="����˶ʿ">����˶ʿ</option>
							<option value="��У��ʦ" >��У��ʦ</option>
							<option value="�й��豸������ѵ����">�й��豸������ѵ����</option>
							<option value="�߼�������ѵ����">�߼�������ѵ����</option>
						</select>
	    </span></td>
	    <td width="10%">&nbsp;&nbsp;
		  <html:submit styleClass="ziti" value="��ѯ" property="Submit4" onclick="return RZquery();"/>
	    </td>
	  </tr>
	</table>
	<table id="list" width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
		<tr align="center" bgcolor="#B7DBFF">
			<td width="5%" height="20">
				<input type="checkbox" name="delkeys" onClick="return RZchose();" />
			</td>
			<td width="10%">
				<span class="ziti">����</span>&nbsp;
			</td>
			<td width="15%">
				<span class="ziti">���֤��</span>&nbsp;
			</td>
			<td width="20%">
				<span class="ziti">��ѧרҵ</span>&nbsp;
			</td>
			<td width="15%">
				<span class="ziti">�������</span>&nbsp;
			</td>	
			<td width="10%">
				<span class="ziti">����</span>&nbsp;
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
								<c:out value="${object.xm}"/>
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${object.sfzh}"/>
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${object.sxzy}"/>
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${object.bmlb}"/>
							</div>
						</td>
						
						<td align="center">
							<a href="<%=request.getContextPath()%>/onLineBmAction.do?actionType=3&key=${object.id}" >�޸�</a>	&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="<%=request.getContextPath()%>/onLineBmAction.do?actionType=4&key=${object.id}" >��ϸ</a>
							
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
							<input type="button" class="ziti" value="ɾ��" onClick="return RZdel();"/>
						</td>
						<td valign="middle" width="30" id="RZprint" style="">
							<input type="button" class="ziti" value="����EXCEL" onClick="return RZprint();"/>
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
