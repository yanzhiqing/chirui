<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="../../../common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;" />
		<title>SOM网站管理-学院领导</title>
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
		window.location.href = "<%=request.getContextPath()%>/leaderAction.do?actionType=0";
	}
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/leaderAction.do" method="post">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;您现在的位置：网站管理 → 学院领导管理 → 学院领导查看
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
			<table width="80%" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="#DEE5EF"
				style="border-collapse: collapse">
				<tr>
					<td height="24" colspan="2" class="ziti"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<span class="header">学院领导查看</span>
						</div>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right" bgcolor="#ECFBFF" class="ziti">
						姓&nbsp;&nbsp;&nbsp;&nbsp;名：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${object.leadername}
					</td>
				</tr>
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						职&nbsp;&nbsp;&nbsp;&nbsp;位：
					</td>
					<td bgcolor="#FFFFEC">
						${object.leaderpower}						
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti">
						职位索引：
					</td>
					<td bgcolor="#FFFFEC">
						${object.placeIndex}						
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						照&nbsp;&nbsp;&nbsp;&nbsp;片：
					</td>
					<td bgcolor="#FFFFEC">
						<c:if test='${object.leaderpopath != null && object.leaderpopath !=""}'>
							<img src="<%=request.getContextPath()%>/${object.leaderpopath}" id="photo_img"/> 
						
						</c:if>
						<c:if test='${object.leaderpopath == null || object.leaderpopath ==""}'>
							(无照片)
						</c:if>
					
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						简&nbsp;&nbsp;&nbsp;&nbsp;介：
					</td>
					<td bgcolor="#FFFFEC">
						<div style="margin-top: 10px; margin-bottom: 10px;">
							${object.leaderinfo}
						</div>
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

		</form>
	</body>
</html>
