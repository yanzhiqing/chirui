<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.Toolkit;"%>
<%@ include file="../../../common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;" />
		<title>SOM网站管理-在线报名</title>
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
		window.location.href = "<%=request.getContextPath()%>/onLineBmAction.do?actionType=0";
	}
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/onLineBmAction.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="actionType" name="actionType" value="5"/>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;您现在的位置：网站管理 → 在线报名 →在线报名查看
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
			<table width="70%" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="#DEE5EF"
				style="border-collapse: collapse">
				<tr>
					<td height="24" colspan="4" class="ziti"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<span class="header">在线报名查看</span>
						</div>
					</td>
				</tr>
				<tr>
					<td  width="26%" align="left" bgcolor="#ECFBFF" class="ziti">培训班名：</td>
					<td  width="30%"  bgcolor="#FFFFEC">${object.className}</td>
					<td  width="20%" align="left" bgcolor="#ECFBFF" class="ziti">MBA类型：</td>
					<td  width="30%" bgcolor="#FFFFEC">${object.MBAType}</td>
				</tr>
				<tr>
					<td  align="left" bgcolor="#ECFBFF" class="ziti">姓 名：</td>
					<td  bgcolor="#FFFFEC">${object.xm}</td>
					<td  align="left" bgcolor="#ECFBFF" class="ziti">性 别：</td>
					<td  bgcolor="#FFFFEC">${object.xb}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">民 族：</td>
				    <td bgcolor="#FFFFEC">${object.mz}</td>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">国 籍：</td>
				    <td bgcolor="#FFFFEC">${object.gj}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">出生日期：</td>
					<td bgcolor="#FFFFEC">${object.csrq}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">身份证号：</td>
					<td bgcolor="#FFFFEC">${object.sfzh}</td>
				</tr>
				
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">手机号码：</td>
					<td bgcolor="#FFFFEC">${object.yydh}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">传真号码：</td>
					<td bgcolor="#FFFFEC">${object.cz}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">电子信箱：</td>
					<td bgcolor="#FFFFEC">${object.dzxx}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">联系QQ：</td>
					<td bgcolor="#FFFFEC">${object.qq}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">紧急联系人姓名：</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.jjlxr}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">紧急联系人手机：</td>
					<td bgcolor="#FFFFEC">${object.lxrsj}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">紧急联系人电话：</td>
					<td bgcolor="#FFFFEC">${object.lxrdh}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">最高学历：</td>
					<td bgcolor="#FFFFEC">${object.zgxl}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">毕业学校：</td>
					<td bgcolor="#FFFFEC">${object.byxx}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">所学专业：</td>
					<td bgcolor="#FFFFEC">${object.sxzy}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">毕业证号：</td>
					<td bgcolor="#FFFFEC">${object.byzh}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">本科（大专）学历性质：</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.xlxz}</td>
				</tr>
				
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">籍 贯：</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.jg}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">邮政编码：</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.yb}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">所在单位或公司名称：</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.dwmc}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">任职部门：</td>
					<td bgcolor="#FFFFEC">${object.rzbm}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">现任职务：</td>
					<td bgcolor="#FFFFEC">${object.xrzw}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">单位地址：</td>
					<td bgcolor="#FFFFEC">${object.dwdz}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">单位邮编：</td>
					<td bgcolor="#FFFFEC">${object.dwyb}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">单位电话：</td>
					<td bgcolor="#FFFFEC">${object.dwdh}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">单位传真：</td>
					<td bgcolor="#FFFFEC">${object.dwcz}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">工作年限：</td>
					<td bgcolor="#FFFFEC">${object.gznx}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">管理经验年限：</td>
					<td bgcolor="#FFFFEC">${object.gljynx}</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">您了解西北工业大学渠道：</td>
					<td bgcolor="#FFFFEC">${object.qt}</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">报名类别：</td>
					<td bgcolor="#FFFFEC">${object.bmlb}</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">工作简历：</td>
					<td bgcolor="#FFFFEC" colspan="3">${object.gzjl}</td>
				</tr>
				<tr>
					<td height="24" colspan="4"	background="<%=request.getContextPath()%>/images/di.jpg">
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
