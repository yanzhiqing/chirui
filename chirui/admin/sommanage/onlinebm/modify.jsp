<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.*"%>
<%@ page import="crjd.model.admin.sommanage.onLineBm.*"%>
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

<script language="javascript" src="<%=request.getContextPath()%>/script/calendar.js"></script>
<script type="text/javascript">
	function goSub(){
		return true;
	}

	//返回
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/onLineBmAction.do?actionType=0";
	}
	
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/onLineBmAction.do" method="post" enctype="multipart/form-data" id="onLineBmForm" name="onLineBmForm">
			<input type="hidden" id="actionType" name="actionType" value="5"/>
			<input type="hidden" name="onLineBm.id" id="id" value='${object.id}'/>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;您现在的位置：网站管理 → 在线报名 → 在线报名修改
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
			<table width="82%" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="#DEE5EF"
				style="border-collapse: collapse">
				<tr>
					<td height="24" colspan="4" class="ziti"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<span class="header">在线报名修改</span>
						</div>
					</td>
				</tr>
				<tr>
					<td  width="26%" align="left" bgcolor="#ECFBFF" class="ziti">培训班名：</td>
					<td  width="30%"  bgcolor="#FFFFEC"><input type="text" name="onLineBm.className"  value="${object.className}" size="20" maxlength="20"></td>
					<td  width="20%" align="left" bgcolor="#ECFBFF" class="ziti">MBA类型：</td>
					<td  width="30%" bgcolor="#FFFFEC">
					<select name="onLineBm.MBAType" value="${object.MBAType}">
							<option value="">--请选择--</option>
							<option value="全国MBA" ${object.MBAType == "全国MBA" ? "selected":""}>全国MBA</option>
							<option value="在职MBA" ${object.MBAType == "在职MBA" ? "selected":""}>在职MBA</option>
							<option value="陕西MBA" ${object.MBAType == "陕西MBA" ? "selected":""}>陕西MBA</option>
						</select>
					</td>
				</tr>
				<tr>
					<td  width="22%" align="left" bgcolor="#ECFBFF" class="ziti">姓 名：</td>
					<td  width="30%"  bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.xm" id="xm" maxlength="20" value="${object.xm}">
					</td>
					<td  width="15%" align="left" bgcolor="#ECFBFF" class="ziti">性 别：</td>
					<td  width="35%" bgcolor="#FFFFEC">
						<input value="男"  ${object.xb == "男" ? "checked":""} type=radio name="onLineBm.xb">&nbsp;男&nbsp;&nbsp;&nbsp;
						<input value="女" ${object.xb == "女" ? "checked":""} type=radio name="onLineBm.xb">&nbsp;女&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">民 族：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.mz" maxlength="50" value="${object.mz}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">国 籍：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.gj" maxlength="50" value="${object.gj}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">出生日期：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.csrq" maxlength="10" value="${object.csrq}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">身份证号：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.sfzh" maxlength="10" value="${object.sfzh}">
					</td>
				</tr>
				
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">手机号码：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.yydh" maxlength="11" value="${object.yydh}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">传真号码：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.cz" maxlength="11" value="${object.cz}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">电子信箱：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.dzxx" maxlength="50" value="${object.dzxx}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">联系QQ：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.qq" maxlength="20" value="${object.qq}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">紧急联系人姓名：</td>
					<td bgcolor="#FFFFEC" colspan="3">
						<input type="text" name="onLineBm.jjlxr" maxlength="50" value="${object.jjlxr}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">紧急联系人手机：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.lxrsj" maxlength="20" value="${object.lxrsj}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">紧急联系人电话：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.lxrdh" maxlength="20" value="${objectlxrdh}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">最高学历：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.zgxl" maxlength="50" value="${object.zgxl}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">毕业学校：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.byxx" maxlength="100" value="${object.byxx}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">所学专业：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.sxzy" maxlength="100" value="${object.sxzy}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">毕业证号：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.byzh" maxlength="30" value="${object.byzh}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">本科（大专）学历性质：</td>
					<td bgcolor="#FFFFEC" colspan="3"><select name="onLineBm.xlxz" style="200px" value="${object.xlxz}">
							<option value="">-----请选择-----</option>
							<option value="全日制" ${object.xlxz == "全日制" ? "selected":""}>全日制</option>
							<option value="夜大" ${object.xlxz == "夜大" ? "selected":""}>夜大</option>
							<option value="函授" ${object.xlxz == "函授" ? "selected":""}>函授</option>
							<option value="自考" ${object.xlxz == "自考" ? "selected":""}>自考</option>
							<option value="学历文凭" ${object.xlxz == "学历文凭" ? "selected":""}>学历文凭</option>
							<option value="网络教育" ${object.xlxz == "网络教育" ? "selected":""}>网络教育</option>
							<option value="专升本" ${object.xlxz == "专升本" ? "selected":""}>专升本</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">籍 贯：</td>
					<td bgcolor="#FFFFEC" colspan="3">
						<input type="text" name="onLineBm.jg" maxlength="100" value="${object.jg}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">邮政编码：</td>
					<td bgcolor="#FFFFEC" colspan="3">
						<input type="text" name="onLineBm.yb" maxlength="12" value="${object.yb}">
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">所在单位或公司名称：</td>
					<td bgcolor="#FFFFEC" colspan="3">
						<input type="text" name="onLineBm.dwmc" maxlength="100" value="${object.dwmc}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">任职部门：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.rzbm" maxlength="100" value="${object.rzbm}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">现任职务：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.xrzw" maxlength="100" value="${object.xrzw}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">单位地址：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.dwdz" maxlength="100" value="${object.dwdz}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">单位邮编：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.dwyb" maxlength="10" value="${object.dwyb}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">单位电话：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.dwdh" maxlength="100" value="${object.dwdh}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">单位传真：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.dwcz" maxlength="10" value="${object.dwcz}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">工作年限：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.gznx" maxlength="100" value="${object.gznx}">
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">管理经验年限：</td>
					<td bgcolor="#FFFFEC">
						<input type="text" name="onLineBm.gljynx" maxlength="10" value="${object.gljynx}">
					</td>
				</tr>
				<tr>
				    <td align="left" bgcolor="#ECFBFF" class="ziti">您了解西北工业大学渠道：</td>
					<td bgcolor="#FFFFEC">
					    <select name="onLineBm.qt" value="${object.qt}">
							<option value="">--请选择--</option>
							<option value="报纸/杂志" ${object.qt == "报纸/杂志" ? "selected":""}>报纸/杂志</option>
							<option value="网站" ${object.qt == "网站" ? "selected":""}>网站</option>
							<option value="邮寄资料" ${object.qt == "邮寄资料" ? "selected":""}>邮寄资料</option>
							<option value="西北工业大学推广活动" ${object.qt == "西北工业大学推广活动" ? "selected":""}>西北工业大学推广活动</option>
							<option value="西北工业大学校友" ${object.qt == "西北工业大学校友" ? "selected":""}>西北工业大学校友</option>
							<option value="同事/朋友" ${object.qt == "同事/朋友" ? "selected":""}>同事/朋友</option>
							<option value="其他" ${object.qt == "其他" ? "selected":""}>其他</option>
						</select>
					</td>
					<td align="left" bgcolor="#ECFBFF" class="ziti">报名类别：</td>
					<td bgcolor="#FFFFEC">
						<select name="onLineBm.bmlb" value="${object.bmlb}">
						    <option value="">--请选择--</option>
							<option value="MBA" ${object.bmlb == "MBA" ? "selected":""}>MBA</option>
							<option value="EMBA" ${object.bmlb == "EMBA" ? "selected":""}>EMBA</option>
							<option value="工程硕士" ${object.bmlb == "工程硕士" ? "selected":""}>工程硕士</option>
							<option value="高校教师" ${object.bmlb == "高校教师" ? "selected":""}>高校教师</option>
							<option value="中国设备管理培训中心" ${object.bmlb == "中国设备管理培训中心" ? "selected":""}>中国设备管理培训中心</option>
							<option value="高级管理培训中心" ${object.bmlb == "高级管理培训中心" ? "selected":""}>高级管理培训中心</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" bgcolor="#ECFBFF" class="ziti">工作简历：</td>
					<td bgcolor="#FFFFEC" colspan="3">
						<textarea rows="5" cols="60" name="onLineBm.gzjl">${object.gzjl}</textarea>
					</td>
				</tr>
				<tr>
					<td height="24" colspan="4"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<input type="submit" name="confirm" value="确认" onclick="return goSub();" />
							<input type="button" value="返回" onclick="goback();" />
						</div>
					</td>
				</tr>
			</table>
			<%@ include file="../../../common/token.jsp"%>
		</form>
	</body>
</html>
