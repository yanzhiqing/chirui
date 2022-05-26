<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="../../../common/taglibs.jsp" %>
<%@ page import="crjd.common.Toolkit" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" />
	<title>��Ϣ����</title>
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
	
	<%    
	
	String conditionString = Toolkit.dealNull(request.getParameter("conditionString"));
	
 	
 String title = Toolkit.dealNull(request.getParameter("deanbox.title"));
 String author = Toolkit.dealNull(request.getParameter("deanbox.author"));
 String yx = Toolkit.dealNull(request.getParameter("deanbox.yx"));
 String time1 = Toolkit.dealNull(request.getParameter("createtime1"));
 String time2 = Toolkit.dealNull(request.getParameter("createtime2"));
 String reply = Toolkit.dealNull(request.getParameter("reply"));
 %>
	 
	<script type="text/javascript">
	
	function getConditionString(){
	var title = document.all["deanbox.title"].value;
	var author = document.all["deanbox.author"].value;
	var yx = document.all["deanbox.yx"].value;
	var time1 = document.all["createtime1"].value;
	var time2 = document.all["createtime2"].value;
	var reply = test();
	
	//��ȡ��ǰҳ��
	var currentPageNum = document.all["currentPageNum"].value;

	var conditionString = "&deanbox.title="+title+"&deanbox.author="+author+"&deanbox.yx="+yx+"&createtime1="+time1+"&createtime2="+time2+"&reply="+reply;
	
	return conditionString;
    }
    function test()
	{

       var reply = deanBoxForm.reply.value;

       for(var i=0;i<deanBoxForm.reply.length;i++)
		{
           if(deanBoxForm.reply[i].checked==true)
			{
              reply = deanBoxForm.reply[i].value;
              break;
           }
       }

       return reply;
}

	
</script>
	
	
</head>
<body>
<jsp:include page="../../../common/buttonPage.jsp" />
<form name="deanboxFrom" action="<%=request.getContextPath()%>/deanBoxAction.do" method="post">
    <input type="hidden" name="conditionString" value="conditionString"/>
	<input type="hidden" id="actionType" name="actionType" value=""/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="wudi">
				&nbsp;�����ڵ�λ�ã���վ���� �� �쵼����
			</td>
		</tr>
	</table>
	
	
	
	<table width="100%" height="27"  border="0" cellpadding="0" cellspacing="0" bordercolor="#B7DBFF" style="border-collapse: collapse"  background="<%=request.getContextPath()%>/images/di.jpg">
	
	<tr>
    <td width="15%">��&nbsp;&nbsp;&nbsp;&nbsp;��:<input type="text" name="deanbox.title" size="10" value="<%=title%>"/></td>
    <td width="15%">�ύ��:<input type="text" name="deanbox.author" size="10" value="<%=author%>"/> </td>
    <td width="15%">����Ժϵ:<input type="text" name="deanbox.yx" size="10" value="<%=yx%>"/> </td>
    
    
	</tr>
	<tr>
	<td width="30%">��ʼʱ��:<input type="text" id="createtime1" name="createtime1" size="10" value="<%=time1 %>" readonly="readonly"/>
						 <img style="cursor: hand;" src="<%=request.getContextPath()%>/image/timer.gif" width="16"
										height="16" border="0" alt="��ѡ������"
										onClick="setday(this,document.getElementById('createtime1'));" /> &nbsp;&nbsp;&nbsp;&nbsp; ��ֹʱ��:
										<input type="text" id="createtime2" name="createtime2" size="10" value="<%=time2 %>" readonly="readonly"/>
						 <img style="cursor: hand;" src="<%=request.getContextPath()%>/image/timer.gif" width="16"
										height="16" border="0" alt="��ѡ������"
										onClick="setday(this,document.getElementById('createtime2'));" />
										
										</td>
    <td width="20%">״&nbsp;&nbsp;̬:
    
    
    
    
    <input name="reply" type="radio" value="0" ${reply==null||reply=='0'?'checked':'' }/>
    
    --δ�ظ� &nbsp;
    
    
    <input name="reply" type="radio" value="1" ${reply==null||reply=='0'?'':'checked' }/>
    
    
    --�ѻظ� 
    
    
    
    </td>
	<th width="5%"><input type="submit" value="��ѯ" onclick="return RZquery();"> </th>	
	</tr>
	
	</table>
	
	
	
	
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="20"></td>
	  </tr>
	</table>
	<table id="list" width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
		<tr align="center" bgcolor="#B7DBFF">
			<td width="5%" height="20">
				<input type="checkbox" name="delkeys" onClick="return RZchose();" />
			</td>
			<td width="10%" align="left">
				<span class="ziti">&nbsp;&nbsp;����</span>&nbsp;
			</td>
			<td width="25%">
				<span class="ziti">����</span>&nbsp;
			</td>
			<td width="10%">
				<span class="ziti">&nbsp;�ύ��</span>&nbsp;
			</td>			
			
			<td width="10%">
				<span class="ziti">&nbsp;����Ժϵ</span>&nbsp;
			</td>	
			
			<td width="10%">
				<span class="ziti">&nbsp;�ύʱ��</span>&nbsp;
			</td>
			<td width="10%">
				<span class="ziti">&nbsp;״̬</span>&nbsp;
			</td>	
			<td width="10%">
				<span class="ziti">����</span>&nbsp;
			</td>
		</tr>
		<c:forEach items="${list}" var="deanbox" varStatus="index" >
			
				<tbody class="${ (index.count%2 != 0) ? 'tb1' : 'tb2' }">
					<tr bgcolor="#E2FAFE" height="20">
						<td>
							<div align="center">
								<input type="checkbox" name="keys"
											value="${deanbox.id}" />
							</div>
						</td>
						<td>
							<div align="left">&nbsp;
								<c:out value="${deanbox.title}"/>
							</div>
						</td>
						
						<td>
							<div align="center">
								
								
								
								<textarea rows="2" cols="30" ><c:out value="${deanbox.content}"></c:out></textarea>
								
							</div>
						</td>
						
						<td>
							<div align="center">
								<c:out value="${deanbox.author}"/>
							</div>
						</td>
						
						<td>
							<div align="center">
								<c:out value="${deanbox.yx}"/>
							</div>
						</td>
						
						
						<td>
							<div align="center">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${deanbox.createtime}"/>
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${deanbox.reply!=null?'�ѻظ�':'δ�ظ�'}"/>
							</div>
						</td>
						
						<td align="center">
						    <a href="<%=request.getContextPath()%>/deanBoxAction.do?actionType=3&key=${deanbox.id}" title="�ظ���Ŀ����">${deanbox.reply==null?'�ظ�':''}</a>${deanbox.reply!=null?'�ظ�':''}&nbsp;&nbsp;
							<a href="<%=request.getContextPath()%>/deanBoxAction.do?actionType=4&key=${deanbox.id}" title="�鿴��Ŀ��ϸ">��ϸ</a>
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
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<jsp:include page="../../../common/splitPage.jsp" />
</form>

</body>
</html>
